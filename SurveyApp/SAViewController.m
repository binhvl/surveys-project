#import "SAViewController.h"
#import "SurveyCellInfo.h"
@interface SAViewController ()

// Outlet in view
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIButton *btnTakeSurvey;

// Propety in class
@property (strong, nonatomic) NSArray *listHotelInfoObject;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contraintTop;
@property (nonatomic) long previousIndex;
@end

@implementation SAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showProgressHUDDefault];
    [self customizeUI];
    [self readData];
    [self registerForNotification];
}


-(void)registerForNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateStatusCompletion:)
                                                 name:kNOTIFICATION_UPDATE_STATUS
                                               object:nil];
}

-(void)updateStatusCompletion:(NSNotification *)notification{
    [self readData];
    [self hideProgressHUD];
}

-(void)readData{
    NSUserDefaults *userDefaults            = [NSUserDefaults standardUserDefaults];
    NSArray *array                          = [userDefaults readArrayWithCustomObjFromUserDefaults:kLIST_HOTEL_INFO_OBJECT];
    if(array){
        self.listHotelInfoObject            = array;
        [self.tableView reloadData];
        [self hideProgressHUD];
    }else{
        if(![NetworkUtil checkNetworkRechability]){
            [self hideProgressHUD];
        }
    }
}

/**
 *  Customize the UI
 */
-(void)customizeUI{
    // Set corner for the button
    self.btnTakeSurvey.layer.cornerRadius   = 20.0f;
    // Set tranform for view
    self.pageControl.transform              = CGAffineTransformMakeRotation(M_PI_2);
    self.pageControl.numberOfPages          = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(self.listHotelInfoObject){
        self.pageControl.numberOfPages = self.listHotelInfoObject.count;
        return self.listHotelInfoObject.count;
    }else{
        return 0;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(SurveyCellInfo *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    // make sure 2 rows is near
    // Ex: row 1 is near row 0 and 2. row 1 can't near row 3
    if(labs(indexPath.row - self.previousIndex) >=2){
        return;
    }
    
    // Set data for cell
    if(self.listHotelInfoObject){
        SAHotelInfo *hotelObject = (SAHotelInfo *)[self.listHotelInfoObject objectAtIndex:indexPath.row];
        if(hotelObject){
            [cell setDataForCell:hotelObject];
        }
    }
    
    self.pageControl.currentPage    = indexPath.row;
    self.previousIndex              = indexPath.row;
    
    if(indexPath.row>=1){
        self.contraintTop.constant = 64;
    }else{
        self.contraintTop.constant = 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
    SurveyCellInfo *cell = [tableView dequeueReusableCellWithIdentifier:@"IDSurveyCellInfo"];
    if(!cell){
        cell = [[SurveyCellInfo alloc]initCellFromNib];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UIScreen mainScreen].bounds.size.height -(44+20);
}

#pragma mark ACTION HANDLE

/**
 *  Reload current page to get new data
 *
 *  @param sender button
 */
- (IBAction)touchReloadPage:(id)sender {
    if([NetworkUtil checkNetworkRechability]){
        [self showProgressHUDDefault];
        [RequestDataUtils loadDataFromAPI];
    }else{
        [AlertUtil showAlertWithErrorTitle:@"" message:@"The network connection was lost, please try again later"];
    }
}
/**
 *  Allow user take survey
 *
 *  @param sender button
 */
- (IBAction)touchTakeSurveyAction:(id)sender {
//    [self performSegueWithIdentifier:@"sqSurveys" sender:sender];
}





@end
