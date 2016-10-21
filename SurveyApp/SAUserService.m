#import "SAUserService.h"
@implementation SAUserService

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)getSurveysFromAPI:(void (^)(NSArray *data))successBlock
                   failed:(void (^)(NSError* error))failedBlock{
    [[SABaseService sharedInstance] requestWithGetMethod:GET uri:[self appendAccessToken:SA_URI_SURVEY_JSON accessToken:SA_ACCESS_TOKEN] parameter:nil success:^(id data) {
        successBlock(data);
    } failed:^(NSError *error) {
        failedBlock(error);
    }];
}

-(NSString *)appendAccessToken:(NSString *)uri accessToken:(NSString *)accessToken{
    if(uri && accessToken){
    return [NSString stringWithFormat:@"%@?%@=%@",uri,SA_ACCESS_TOKEN,SA_TOKEN];
    }else{
        return uri;
    }
}


@end
