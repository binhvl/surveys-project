#import <Foundation/Foundation.h>
#import "DCKeyValueObjectMapping.h"
#import "DCParserConfiguration.h"
#import <Realm/Realm.h>
@interface SABaseModel : RLMObject
- (instancetype)initWithJson:(NSDictionary *)json;
@end
