//
//  SignUpViewController.m
//  BabyApp
//
//  Created by Charan Giri on 21/02/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import "SignUpViewController.h"
#import "ConnectionsManager.h"
#import "NSString+CommonForApp.h"

#define kOFFSET_FOR_KEYBOARD 100.0


@interface SignUpViewController () <ServerResponseDelegate>
@property (retain, nonatomic) NSMutableData *receivedData;
@property (retain, nonatomic) NSURLConnection *connection;
@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)createAccount:(id)sender {    //put code here for registration

    NSLog(@"createAccount");
//    if([self isValidData])
//    {
//        NSMutableDictionary *params = [NSMutableDictionary dictionary];
//        [params setObject:self.email.text forKey:@"email"];
//        [params setObject:self.passwordTF.text forKey:@"password"];
//        [params setObject:@"ios" forKey:@"device"];
//        [[ConnectionsManager sharedManager] registerUser:params withdelegate:self];
//    }
    
    [self performSegueWithIdentifier:@"HomeViewControllerSegue" sender:self];
}

-(BOOL)isValidData
{
    if(![self.email.text isValidEmail])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Please enter valid email address" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
        
        return NO;
    }
    if([self.passwordTF.text isEmpty])
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
    
    
    //initialize url that is going to be fetched.
    NSURL *url = [NSURL URLWithString:@"https://www.your urlname"];
    
    //initialize a request from url
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    //set http method
    [request setHTTPMethod:@"POST"];
    
    //initialize a post data
    
    NSString *postData = @"username password";
    
    
    //set request content type we MUST set this value.
    
    
    [request setValue:@"application/x-www-form-urlencoded;" forHTTPHeaderField:@"Content-Type" ];
    
    //set post data of request
    [request setHTTPBody:[postData dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    //initialize a connection from request
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    self.connection = connection;
    
    //start the connection
    [connection start];
    
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.receivedData appendData:data];
    
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    NSLog(@"error%@" , error);
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSString *htmlSTR = [[NSString alloc] initWithData:self.receivedData encoding:NSUTF8StringEncoding];
}


-(void)success:(NSDictionary *)response
{
    
}


-(void)failure:(NSDictionary *)response
{
    
}
@end
