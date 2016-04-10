#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
#import "AFHTTPRequestOperationManager.h"

@protocol ServerResponseDelegate <NSObject>
- (void) success:(id)response;
- (void) failure:(id)response;
@end

typedef void (^CompletionBlock)(NSDictionary *result, NSError *error);

@interface ConnectionsManager : AFHTTPRequestOperationManager <ServerResponseDelegate>

+ (instancetype)sharedManager;

-(void)loginUser:(NSDictionary *)params withdelegate:(id<ServerResponseDelegate>) delegate;
-(void)registerUser:(NSDictionary *)params withdelegate:(id<ServerResponseDelegate>) delegate;
-(void)getForgotPassword:(NSDictionary *)params withdelegate:(id<ServerResponseDelegate>) delegate;

-(void)getBioData:(NSDictionary *)params withdelegate:(id<ServerResponseDelegate>) delegate;
-(void)saveBioData:(NSDictionary *)params andImage:(UIImageView *)img withdelegate:(id<ServerResponseDelegate>)delegate;

-(void)addBirthRecord:(NSDictionary *)params withdelegate:(id<ServerResponseDelegate>) delegate;
-(void)readBirthRecord:(NSDictionary *)params withdelegate:(id<ServerResponseDelegate>) delegate;

-(void)addParticular:(NSDictionary *)params withdelegate:(id<ServerResponseDelegate>) delegate;

-(void)readParticular:(NSDictionary *)params withdelegate:(id<ServerResponseDelegate>)delegate;

-(void)addnewborn_screening:(NSDictionary *)params withdelegate:(id<ServerResponseDelegate>) delegate;
-(void)readnewborn_screening:(NSDictionary *)params withdelegate:(id<ServerResponseDelegate>) delegate;

-(void)adddischarge_information:(NSDictionary *)params withdelegate:(id<ServerResponseDelegate>) delegate;
-(void)readdischarge_information:(NSDictionary *)params withdelegate:(id<ServerResponseDelegate>) delegate;

-(void)readinvestigations_read:(NSDictionary *)params withdelegate:(id<ServerResponseDelegate>) delegate;
@end