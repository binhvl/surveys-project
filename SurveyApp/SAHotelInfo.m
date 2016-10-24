//
//  SAHotelInfo.m
//  SurveyApp
//
//  Created by KEAZ on 10/22/16.
//  Copyright © 2016 KEAZ. All rights reserved.
//

#import "SAHotelInfo.h"

@implementation SAHotelInfo

- (instancetype)initWithJson:(NSDictionary *)json{
    return [super initWithJson:json];
}
- (NSArray *)parseListObject:(NSArray *)listObject{
    if(listObject){
        NSMutableArray *listParsedObject = [[NSMutableArray alloc]initWithCapacity:listObject.count];
        for (NSDictionary *hotelItem in listObject) {
            SAHotelInfo * hotelInfoObject = [self initWithJson:hotelItem];
            if(hotelItem){
                [listParsedObject addObject:hotelInfoObject];
            }
        }
        return listParsedObject;
    }
    return @[];
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.cover_image_url forKey:@"cover_image_url"];
    [encoder encodeObject:self.title forKey:@"title"];
    [encoder encodeObject:self.descriptionInfo forKey:@"descriptionInfo"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        
        //decode properties, other class vars
        self.cover_image_url    = [decoder decodeObjectForKey:@"cover_image_url"];
        self.title              = [decoder decodeObjectForKey:@"title"];
        self.descriptionInfo    = [decoder decodeObjectForKey:@"descriptionInfo"];
    }
    return self;
}

@end
