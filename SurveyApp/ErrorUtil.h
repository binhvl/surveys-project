#import <Foundation/Foundation.h>

@interface ErrorUtil : NSObject
/**
 *  Get message from NSErorr
 *
 *  @param error error from server
 *
 *  @return message from error
 */
+(NSString *)getMessageFromError:(NSError *)error;
/**
 *  Get status code from error
 *
 *  @param error NSError
 *
 *  @return status code from response
 */
+(long)getStatusCodeFromError:(NSError *)error;
@end
