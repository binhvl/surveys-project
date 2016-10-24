//
//  NSUserDefaults+SAHotelInfoCategory.m
//  SurveyApp
//
//  Created by KEAZ on 10/24/16.
//  Copyright © 2016 KEAZ. All rights reserved.
//

#import "NSUserDefaults+SAHotelInfoCategory.h"

@implementation NSUserDefaults (SAHotelInfoCategory)

-(void)writeArrayWithCustomObjToUserDefaults:(NSString *)keyName withArray:(NSMutableArray *)myArray
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:myArray];
    [defaults setObject:data forKey:keyName];
    [defaults synchronize];
}

-(NSArray *)readArrayWithCustomObjFromUserDefaults:(NSString*)keyName
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:keyName];
    NSArray *myArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    [defaults synchronize];
    return myArray;
}
@end
