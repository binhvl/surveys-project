#import "NetworkUtil.h"

@implementation NetworkUtil

+(BOOL)checkNetworkRechability {
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        return false;
    } else {
        return true;
    }
}
@end
