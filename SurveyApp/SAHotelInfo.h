//
//  SAHotelInfo.h
//  SurveyApp
//
//  Created by KEAZ on 10/22/16.
//  Copyright © 2016 KEAZ. All rights reserved.
//

#import "SABaseModel.h"

@interface SAHotelInfo : SABaseModel
@property NSString *cover_image_url;
@property NSString *title;
@property NSString *descriptionInfo;

-(NSArray *)parseListObject:(NSArray *)listObject;
@end
