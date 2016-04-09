//
//  ViewController.m
//  BabyApp
//
//  Created by Charan Giri on 19/02/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import "ViewController.h"
#import "ConnectionsManager.h"
#import "NSString+CommonForApp.h"

#define kOFFSET_FOR_KEYBOARD 100.0

@interface ViewController ()<ServerResponseDelegate, UIAlertViewDelegate>
@property (retain, nonatomic) NSMutableData *receivedData;
@property (retain, nonatomic) NSURLConnection *connection;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden=YES;
    
    for (NSString* family in [UIFont familyNames])
    {
        NSLog(@"%@", family);
        
        for (NSString* name in [UIFont fontNamesForFamilyName: family])
        {
            NSLog(@"  %@", name);
        }
    }
    
}

//
//-(void)keyboardWillShow{
//    // Animate the current view out of the way
//    if (self.view.frame.origin.y >= 0)
//    {
//        [self setViewMovedUp:YES];
//    }
//    else if (self.view.frame.origin.y < 0)
//    {
//        [self setViewMovedUp:NO];
//    }
//}
//
//-(void)keyboardWillHide {
//    if (self.view.frame.origin.y >= 0)
//    {
//        [self setViewMovedUp:YES];
//    }
//    else if (self.view.frame.origin.y < 0)
//    {
//        [self setViewMovedUp:NO];
//    }
//}
//
//-(void)textFieldDidBeginEditing:(UITextField *)sender
//{
//
//        //move the main view, so that the keyboard does not hide it.
//        if  (self.view.frame.origin.y >= 0)
//        {
//            [self setViewMovedUp:YES];
//        }
//
//}
//
////method to move the view up/down whenever the keyboard is shown/dismissed
//-(void)setViewMovedUp:(BOOL)movedUp
//{
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
//
//    CGRect rect = self.view.frame;
//    if (movedUp)
//    {
//        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
//        // 2. increase the size of the view so that the area behind the keyboard is covered up.
//        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
//        rect.size.height += kOFFSET_FOR_KEYBOARD;
//    }
//    else
//    {
//        // revert back to the normal state.
//        rect.origin.y += kOFFSET_FOR_KEYBOARD;
//        rect.size.height -= kOFFSET_FOR_KEYBOARD;
//    }
//    self.view.frame = rect;
//
//    [UIView commitAnimations];
//}
//
//
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    // register for keyboard notifications
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWillShow)
//                                                 name:UIKeyboardWillShowNotification
//                                               object:nil];
//
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWillHide)
//                                                 name:UIKeyboardWillHideNotification
//                                               object:nil];
//}
//
//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    // unregister for keyboard notifications while not visible.
//    [[NSNotificationCenter defaultCenter] removeObserver:self
//                                                    name:UIKeyboardWillShowNotification
//                                                  object:nil];
//
//    [[NSNotificationCenter defaultCenter] removeObserver:self
//                                                    name:UIKeyboardWillHideNotification
//                                                  object:nil];
//}



-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}


-(void)textFieldDidEndEditing:(UITextField *)sender
{
    if  (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    //move the main view, so that the keyboard does not hide it.
    if  (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}
- (IBAction)signinAction:(id)sender {
    NSLog(@"signinAction");
   // [self performSegueWithIdentifier:@"HomeViewControllerSegue" sender:self];
    if([self isValidData])
     [self requesttoserver];
}

-(BOOL)isValidData
{
    if([self.usernameTextfield.text isEmpty])
            {
                   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Please enter valid email address" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                   [alert show];
        
                   return NO;
                }
    if([self.passwordTextfield.text isEmpty])
           {
                   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Please enter valid password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                   [alert show];
                  return NO;
              }
    
        return YES;
    }

-(void)requesttoserver
{

        //if there is a connection going on just cancel it.
      [self.connection cancel];
    
    //initialize new mutable data
       NSMutableData *data = [[NSMutableData alloc] init];
       self.receivedData = data;


       NSMutableDictionary *params = [NSMutableDictionary dictionary];
       [params setObject:self.usernameTextfield.text forKey:@"email"];
       [params setObject:self.passwordTextfield.text forKey:@"password"];
       [params setObject:@"ios" forKey:@"device"];
    
    NSString *Post=[NSString stringWithFormat:@"email=%@&password=%@&@device=ios",self.usernameTextfield.text,self.passwordTextfield.text];
    
       NSData *PostData = [Post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
       NSString *PostLengh=[NSString stringWithFormat:@"%d",[Post length]];
       NSURL *Url=[NSURL URLWithString: @"http://babyappdev.azurewebsites.net/apiv1/service/login/"];
    
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:Url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
      [request setHTTPMethod:@"POST"];
      [request setValue:PostLengh forHTTPHeaderField:@"Content-Lenght"];
      [request setHTTPBody:PostData];
    
       NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
       self.connection = connection;
    
        [connection start];
    
    
    }

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
        [self.receivedData appendData:data];
    
    }
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{

       NSLog(@"error%@" , error);
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    // NSString *htmlSTR = [[NSString alloc] initWithData:self.receivedData encoding:NSUTF8StringEncoding];
    
      NSError* error;
       NSDictionary* json = [NSJSONSerialization JSONObjectWithData:self.receivedData options:kNilOptions error:&error];
       NSLog(@"connectionDidFinishLoading =%@",json);
       if([[json objectForKey:@"status"] isEqualToString:@"1"])
        {
              // [[NSUserDefaults standardUserDefaults] setObject:json forKey:@"userData"];
               [self performSegueWithIdentifier:@"HomeViewControllerSegue" sender:self];
        
        }
    }





- (IBAction)facebookSigninAction:(id)sender {
}

- (IBAction)forgotPasswordAction:(id)sender {
    
    
    if ([UIAlertController class])
    {
        // use UIAlertController
        UIAlertController *alert= [UIAlertController
                                   alertControllerWithTitle:@"Forgot Password?"
                                   message:@"Enter your email address to reset your password."
                                   preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action){
                                                       //Do Some action here
                                                       UITextField *textField = alert.textFields[0];
                                                       [self getForgotPassword:textField.text];
                                                       
                                                       NSLog(@"text was %@", textField.text);
                                                       
                                                   }];
        UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * action) {
                                                           
                                                           NSLog(@"cancel btn");
                                                           
                                                           [alert dismissViewControllerAnimated:YES completion:nil];
                                                           
                                                       }];
        
        [alert addAction:ok];
        [alert addAction:cancel];
        
        [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
            textField.placeholder = @"Email address";
            textField.keyboardType = UIKeyboardTypeDefault;
        }];
        
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    else
    {
        // use UIAlertView
        UIAlertView* dialog = [[UIAlertView alloc] initWithTitle:@"Enter Folder Name"
                                                         message:@"Keep it short and sweet"
                                                        delegate:self
                                               cancelButtonTitle:@"Cancel"
                                               otherButtonTitles:@"OK", nil];
        
        dialog.alertViewStyle = UIAlertViewStylePlainTextInput;
        dialog.tag = 400;
        [dialog show];
        
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *name = [alertView textFieldAtIndex:0].text;
    [self getForgotPassword:name];
}

-(void)getForgotPassword:(NSString *)emailAddress
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:emailAddress forKey:@"email"];
    
    [[ConnectionsManager sharedManager] getForgotPassword:dictionary withdelegate:self];
}

- (IBAction)signupAction:(id)sender {
    
    NSLog(@"signupAction");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
}

-(void)success:(id)response
{
    /*
     {
     message = "Your new password has been sent to you email";
     status = 1;
     }
     */
    
    NSDictionary *params;
    
    if([response isKindOfClass:[NSString class]])
    {
        NSData *data = [response dataUsingEncoding:NSUTF8StringEncoding];
        params = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    }
    else if ([response isKindOfClass:[NSDictionary class]])
    {
        params = response;
    }
    
    id statusStr_ = [params objectForKey:@"status"];
    
    NSString *statusStr;
    
    statusStr = statusStr_;
    
    if([statusStr isEqualToString:@"1"])
    {
        NSString *messageStr = [params objectForKey:@"message"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:[NSString stringWithFormat:@"%@", messageStr] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if([statusStr isEqualToString:@"0"])
    {
        NSString *messageStr = [params objectForKey:@"message"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:[NSString stringWithFormat:@"%@", messageStr] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
}
-(void)failure:(id)response
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
