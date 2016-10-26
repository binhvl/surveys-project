#import "RequestDataUtils.h"

@implementation RequestDataUtils

+ (void)loadDataFromAPI {
    [[SAUserService sharedInstance] getSurveysFromAPI:^(NSArray *data) {
        SAHotelInfo *hotelObject = [[SAHotelInfo alloc]init];
       [hotelObject parseListObject:data];
        [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_UPDATE_STATUS object:nil userInfo:nil];
    } failed:^(NSError *error) {
        NSLog(@"%@",error.description);
        [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_UPDATE_STATUS object:nil userInfo:nil];
    }];
}
@end
