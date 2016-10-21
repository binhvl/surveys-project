#import "SAViewController.h"
#import "SurveyCellInfo.h"
@interface SAViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIButton *btnTakeSurvey;

@end

@implementation SAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customizeUI];
    [self showProgressHUDDefault];
    [[SAUserService sharedInstance] getSurveysFromAPI:^(NSArray *data) {
//        NSLog(@"%@",data.firstObject);
        SAHotelInfo *hotel = [[SAHotelInfo alloc]initWithJson:data.firstObject];
        NSLog(@"%@",hotel.descriptionInfo);
        [self hideProgressHUD];
    } failed:^(NSError *error) {
        NSLog(@"%@",error.description);
    }];
}

/**
 *  Customize the UI
 */
-(void)customizeUI{
    // Set corner for the button
    self.btnTakeSurvey.layer.cornerRadius   = 20.0f;
    
    // Set tranform for view
    self.pageControl.transform = CGAffineTransformMakeRotation(M_PI_2);
    self.pageControl.numberOfPages = 5;
    [self.pageControl setFrame:CGRectMake(0, 0, 20, 300)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SurveyCellInfo *cell = [tableView dequeueReusableCellWithIdentifier:@"IDSurveyCellInfo"];
    if(!cell){
        cell = [[SurveyCellInfo alloc]initCellFromNib];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UIScreen mainScreen].bounds.size.height-self.navigationController.navigationBar.bounds.size.height;
}

@end
