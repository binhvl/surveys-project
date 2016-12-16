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
    SAHotelInfo *hotelInfo = [super initWithJson:json];
    // Save into DB
    
    // Get the default Realm
    RLMRealm *realm = [RLMRealm defaultRealm];
    // Add to Realm with transaction
    [realm beginWriteTransaction];
    [realm addObject:hotelInfo];
    [realm commitWriteTransaction];
    // End to save in DB
    
    return [super initWithJson:json];
}
- (NSArray *)parseListObject:(NSArray *)listObject{
    if(listObject){
        // Clear old data
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteAllObjects];
        [realm commitWriteTransaction];
        
        NSMutableArray *listParsedObject = [[NSMutableArray alloc]initWithCapacity:listObject.count];
        for (NSDictionary *hotelItem in listObject) {
            if(hotelItem){
                NSData *data = [NSJSONSerialization dataWithJSONObject:hotelItem options:NSJSONWritingPrettyPrinted error:nil];
                [realm transactionWithBlock:^{
                    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                    [SAHotelInfo createInRealm:realm withValue:json];
                }];
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
