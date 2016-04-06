//
//  ConnectionsManager.h
//  Chain
//
//  Created by Nava Carmon on 4/25/14.
//  Copyright (c) 2014 MoshiachTimes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
#import "AFHTTPRequestOperationManager.h"

@protocol ServerResponseDelegate <NSObject>
- (void) success:(NSDictionary *)response;
- (void) failure:(NSDictionary *)response;
@end

typedef void (^CompletionBlock)(NSDictionary *result, NSError *error);

@interface ConnectionsManager : AFHTTPRequestOperationManager <ServerResponseDelegate>

+ (instancetype)sharedManager;

-(void)loginUser:(NSDictionary *)params withdelegate:(id<ServerResponseDelegate>) delegate;
-(void)registerUser:(NSDictionary *)params withdelegate:(id<ServerResponseDelegate>) delegate;

@end