//
//  SAHotelInfo.h
//  SurveyApp
//
//  Created by KEAZ on 10/22/16.
//  Copyright © 2016 KEAZ. All rights reserved.
//

#import "SABaseModel.h"

@interface SAHotelInfo : SABaseModel
@property (strong,nonatomic) NSString *cover_image_url;
@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *descriptionInfo;
@end
