//
//  NSUserDefaults+SAHotelInfoCategory.h
//  SurveyApp
//
//  Created by KEAZ on 10/24/16.
//  Copyright © 2016 KEAZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (SAHotelInfoCategory)

-(void)writeArrayWithCustomObjToUserDefaults:(NSString *)keyName withArray:(NSMutableArray *)myArray;

-(NSArray *)readArrayWithCustomObjFromUserDefaults:(NSString*)keyName;
@end
