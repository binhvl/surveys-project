#import <Foundation/Foundation.h>
#import "SAUserService.h"
#import "NSUserDefaults+SAHotelInfoCategory.h"
#import "SAHotelInfo.h"
#import "ConstantFile.h"
@interface RequestDataUtils : NSObject
/**
 *  Call to api to get data
 */
+ (void)loadDataFromAPI;
@end
