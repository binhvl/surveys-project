#import <Foundation/Foundation.h>
#import "ErrorUtil.h"
#import <UIKit/UIKit.h>
@interface AlertUtil : NSObject
/**
 *  Show alert with title
 *
 *  @param title   title of message
 *  @param message messge contain
 */
+ (void)showAlertWithErrorTitle:(NSString*)title message:(NSString *)message;
/**
 *  Show alert from error
 *
 *  @param error error from server
 */
+ (void)showAlertWithErrorWithoutTitle:(NSError *)error;
@end
