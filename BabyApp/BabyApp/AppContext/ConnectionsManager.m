//
//  ConnectionsManager.m
//  Chain
//
//  Created by Nava Carmon on 4/25/14.
//  Copyright (c) 2014 MoshiachTimes. All rights reserved.
//

#import "ConnectionsManager.h"
#import "AppDelegate.h"
#import "WSConstant.h"

static NSString * const BaseURLString = BaseUrl;
@interface ConnectionsManager ()

@property (nonatomic, strong) NSDictionary *response;

- (void) postToURL:(NSString *)url withParameters:(NSDictionary *)parameters delegate:(id<ServerResponseDelegate>)delegate;

@end

@implementation ConnectionsManager
// Singletone related

+ (instancetype)sharedManager {
    
    static ConnectionsManager *_sharedManager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedManager = [[self alloc] initWithBaseURL:[NSURL URLWithString:BaseURLString]];
    });
    
    return _sharedManager;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    
    if (self) {
        AFSecurityPolicy *policy = [[AFSecurityPolicy alloc] init];
        [policy setAllowInvalidCertificates:YES];
        
        [self setSecurityPolicy:policy];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    return self;
}

- (void) postToURL:(NSString *)url withParameters:(NSDictionary *)parameters delegate:(id<ServerResponseDelegate>)delegate
{
    NSString *urlString = url;
    //createGroup
    urlString = [NSString stringWithFormat:@"%@%@", BaseURLString, url];
    NSDictionary *tmpParameters = parameters;
   /* if([url isEqualToString:@"cfpuser/create"] || [url isEqualToString:@"userContacts/getAppUsers"])
    {
        [self.requestSerializer setTimeoutInterval:600.0];
    }
    else {
        
        [self.requestSerializer setTimeoutInterval:12.0];
    }*/
    
    [self.requestSerializer setTimeoutInterval:20.0];

    [self POST:urlString parameters:tmpParameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //NSString *str=(NSString*)responseObject;
        NSLog(@"str");
        UIApplication *application = [UIApplication sharedApplication];
        AppDelegate *appDelegateRef = (AppDelegate *)application.delegate;
        
        if (responseObject) {
            
            
            NSDictionary *response = [responseObject objectForKey:@"response"];
            
            if(!response || response == nil || response.allValues.count <= 0)
            {
                response = responseObject; //[responseObject objectForKey:@"responseBody"];
            }
            if (response) {
                
                //WSBaseResponse *baseResponse = [[WSBaseResponse alloc] initWithDictionary:response];
                //if(baseResponse.result && [baseResponse.result isSuccess])
                //{
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [delegate success:response];
                });
                //}
            }
            else {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [self showErrorMessage];
                });
            }
        }
        else {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self showErrorMessage];
            });
        }
    }
       failure:^(AFHTTPRequestOperation *operation, NSError *error) {
           
           UIApplication *application = [UIApplication sharedApplication];
           AppDelegate *appDelegateRef = (AppDelegate *)application.delegate;
           //[application endBackgroundTask:appDelegateRef.backgroundTaskIdentifier];
           
           dispatch_async(dispatch_get_main_queue(), ^{
               
               //[DejalActivityView removeView];
               
               // If timeout then don't show the timeout error message.
               if (error.code != NSURLErrorTimedOut) {
                   
                   /*UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                    message:[error localizedDescription]
                    delegate:nil
                    cancelButtonTitle:@"Ok"
                    otherButtonTitles:nil];
                    [alertView show];*/
               }
               
               if (delegate && [delegate respondsToSelector:@selector(failure:)]) {
                   
                   [delegate failure:nil];
               }
           });
       }];
}

- (void) getToURL:(NSString *)url withParameters:(NSDictionary *)parameters delegate:(id<ServerResponseDelegate>)delegate
{
    
    NSString *urlString = url;
    urlString = [NSString stringWithFormat:@"%@%@", BaseURLString, url];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:urlString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (responseObject) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [delegate success:responseObject];
            });
        }
        
        NSLog(@"%@", responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        
        if (delegate && [delegate respondsToSelector:@selector(failure:)]) {
            
            [delegate failure:nil];
        }
    }];
}


//Get Streets and Towns
-(void)gettowns_withdelegate:(id<ServerResponseDelegate>) delegate
{
    [self getToURL:@"gettowns" withParameters:nil delegate:delegate];
}

- (void)success:(NSDictionary *)response
{
    
}

- (void)failure:(NSDictionary *)response
{
    
}

- (void)showErrorMessage {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"No server response." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}



-(void)loginUser:(NSDictionary *)params withdelegate:(id<ServerResponseDelegate>) delegate
{
    [self getToURL:@"login" withParameters:params delegate:delegate];
}

-(void)registerUser:(NSDictionary *)params withdelegate:(id<ServerResponseDelegate>) delegate
{
    [self getToURL:@"signup" withParameters:params delegate:delegate];
}

-(void)getForgotPassword:(NSDictionary *)params withdelegate:(id<ServerResponseDelegate>) delegate
{
    [self getToURL:@"forgot_password" withParameters:params delegate:delegate];
}

@end
