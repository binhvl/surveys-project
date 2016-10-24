#import <UIKit/UIKit.h>
#import "ConstantFile.h"
#import "Reachability.h"
@interface SABaseViewController : UIViewController
- (void)showProgressHUDDefault;
- (void)hideProgressHUD;
/**
 *  Push view controller
 *
 *  @param vcName   view controller name
 *  @param animated animation
 */
- (void)pushViewController:(NSString *)vcName animated:(BOOL)animated;

/**
 *  Show message with title in controller
 *
 *  @param title   title
 *  @param message message content
 */
- (void)showAlertWithTitle:(NSString*)title message:(NSString*)message;
@end
