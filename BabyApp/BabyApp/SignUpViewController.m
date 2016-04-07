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

- (IBAction)createAccount:(id)sender {

//    if([self isValidData])
//    {
//        NSMutableDictionary *params = [NSMutableDictionary dictionary];
//        [params setObject:self.email.text forKey:@"email"];
//        [params setObject:self.passwordTF.text forKey:@"password"];
//        [params setObject:@"ios" forKey:@"device"];
//        
//        
//        [[ConnectionsManager sharedManager] registerUser:params withdelegate:self];
//    }
    
    //[self performSegueWithIdentifier:@"HomeViewControllerSegue" sender:self];
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

-(void)success:(NSDictionary *)response
{
    
}


-(void)failure:(NSDictionary *)response
{
    
}
@end
