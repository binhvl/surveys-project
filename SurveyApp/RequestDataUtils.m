#import "RequestDataUtils.h"

@implementation RequestDataUtils

+ (void)loadDataFromAPI {
    
    [[SAUserService sharedInstance] getSurveysFromAPI:^(NSArray *data) {
        SAHotelInfo *hotelObject = [[SAHotelInfo alloc]init];
        NSArray *listObjects = [hotelObject parseListObject:data];
        if(listObjects){
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults writeArrayWithCustomObjToUserDefaults:kLIST_HOTEL_INFO_OBJECT withArray:[listObjects copy]];
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_UPDATE_STATUS object:nil userInfo:nil];
    } failed:^(NSError *error) {
        NSLog(@"%@",error.description);
        [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_UPDATE_STATUS object:nil userInfo:nil];
    }];
}
@end
