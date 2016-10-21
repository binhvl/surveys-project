#import <Foundation/Foundation.h>
#import "SABaseService.h"
@interface SAUserService : SABaseService

/**
 * sharedInstance
 * @return instancetype
 */
+ (instancetype)sharedInstance;

/**
 *  Get surveys from server
 *
 *  @param successBlock successBlock
 *  @param failedBlock  failedBlock
 */
- (void)getSurveysFromAPI:(void (^)(NSArray *data))successBlock
                          failed:(void (^)(NSError* error))failedBlock;

@end
