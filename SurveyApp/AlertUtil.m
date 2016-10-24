#import "AlertUtil.h"

@implementation AlertUtil
/**
 *  Show alert with title
 *
 *  @param title   title of message
 *  @param message messge contain
 */
+ (void)showAlertWithErrorTitle:(NSString*)title message:(NSString *)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }]];
        [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:alertController animated:YES completion:^{
        }];
    });
}
/**
 *  Show alert from error
 *
 *  @param error error from server
 */
+(void)showAlertWithErrorWithoutTitle:(NSError *)error{
    NSString *message = [ErrorUtil getMessageFromError:error];
    [AlertUtil showAlertWithErrorTitle:@"" message:message];
}
@end
