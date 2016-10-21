#import <Foundation/Foundation.h>
#import "SAServiceConst.h"
#import "AFNetworking.h"
#define TIME_OUT 30

// Method supported: GET, POST, DELETE, PUT
typedef NS_ENUM(NSInteger, RequestMethod) {
    GET     = 1,
    POST    = 2,
    DELETE  = 3,
    PUT     = 4
};

typedef void (^success)(id responseData);
typedef void (^failed)(NSError *error);

@interface SABaseService : AFHTTPSessionManager

/**
 * sharedInstance
 * @return instancetype
 */
+ (instancetype)sharedInstance;

/**
 *  Request to service with method name
 *
 *  @param mehod        method name
 *  @param uri          uri of the request
 *  @param parameter    parameter which will be sent with the request
 *  @param successBlock success block
 *  @param failedBlock  fail block
 */
- (void)requestWithGetMethod:(RequestMethod)mehod uri:(NSString*)uri parameter:(NSDictionary *)parameter
           success:(void (^)(id data))successBlock
            failed:(void (^)(NSError* error))failedBlock;


@end
