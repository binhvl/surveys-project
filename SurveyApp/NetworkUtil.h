#import <Foundation/Foundation.h>
#import "Reachability.h"
@interface NetworkUtil : NSObject
/**
 *  Check network connection
 *
 *  @return status of connection
 */
+(BOOL)checkNetworkRechability;
@end
