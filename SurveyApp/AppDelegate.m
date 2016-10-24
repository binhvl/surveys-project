#import "AppDelegate.h"
#import "AlertUtil.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Get data from API
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *listHotelObjects = [userDefaults readArrayWithCustomObjFromUserDefaults:kLIST_HOTEL_INFO_OBJECT];
    
    // Won't reload if we had a local version
    if(!listHotelObjects){
        [RequestDataUtils loadDataFromAPI];
    }
    [self networkHandling:listHotelObjects];
    return YES;
}
/**
 *  Handle the network connection
 *
 *  @param listHotelObjects list hotel objects
 */
-(void)networkHandling:(NSArray *)listHotelObjects{
    // Monitoring network
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if ([[AFNetworkReachabilityManager sharedManager] isReachable]) {
            // Only reload when the local data is empty
            if(!listHotelObjects){
                [AlertUtil showAlertWithErrorTitle:@"" message:@"The network is connected, retrieving data"];
                [RequestDataUtils loadDataFromAPI];
            }
        }else{
            [AlertUtil showAlertWithErrorTitle:@"" message:@"The network connection was lost"];
        }
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
