#import "SABaseViewController.h"
#import "MBProgressHUD.h"
@interface SABaseViewController ()<MBProgressHUDDelegate>
@property (nonatomic, strong) MBProgressHUD             *progressHUD;
@end

@implementation SABaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - progress HUD

- (void)showProgressHUDDefault {
    [self showProgressHUDWithType:MBProgressHUDModeIndeterminate andMessage:nil];
}

- (void)hideProgressHUD
{
    //hide progress HUD
    [self.progressHUD hide:NO];
    [self.progressHUD removeFromSuperview];
}

- (void)showProgressHUDWithType:(MBProgressHUDMode)type andMessage:(NSString*)message
{
    //Prepare Progress HUD
    if (self.progressHUD.superview) {
        [self.progressHUD removeFromSuperview];
        self.progressHUD.delegate = nil;
        self.progressHUD = nil;
    }
    self.progressHUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.progressHUD show:YES];
    self.progressHUD.mode = type;
    self.progressHUD.labelText = message;
    self.progressHUD.progress = 0;
    self.progressHUD.delegate = self;
    [self.view addSubview:self.progressHUD];
}

/**
 *  Push view controller
 *
 *  @param vcName   view controller name
 *  @param animated animation
 */
- (void)pushViewController:(NSString *)vcName animated:(BOOL)animated {
    [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:vcName] animated:animated];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
