#import <Foundation/Foundation.h>
#import "DCKeyValueObjectMapping.h"
#import "DCParserConfiguration.h"
@interface SABaseModel : NSObject
- (instancetype)initWithJson:(NSDictionary *)json;
@end
