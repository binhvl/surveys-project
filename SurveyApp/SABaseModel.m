#import "SABaseModel.h"
#import "DCObjectMapping.h"
#import "DCKeyValueObjectMapping.h"
#import "SAHotelInfo.h"
@implementation SABaseModel

- (instancetype)initWithJson:(NSDictionary *)json {
    
    // Add config mapping for SAHotelInfo
    DCParserConfiguration *config = [DCParserConfiguration configuration];
    DCObjectMapping *hotelConfig = [DCObjectMapping mapKeyPath:@"description" toAttribute:@"descriptionInfo" onClass:[SAHotelInfo class]];
    [config addObjectMapping:hotelConfig];
    DCKeyValueObjectMapping *parser = [DCKeyValueObjectMapping mapperForClass: [self class]  andConfiguration:config];
    
    self = [parser parseDictionary:json];
    
    return self;
}

@end
