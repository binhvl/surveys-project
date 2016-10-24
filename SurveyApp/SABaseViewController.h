#import <UIKit/UIKit.h>
#import "ConstantFile.h"
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
@end
