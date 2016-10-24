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
    
    // Check network before call api
    if([NetworkUtil checkNetworkRechability]){
        [[SABaseService sharedInstance] requestWithGetMethod:GET uri:[self appendAccessToken:SA_URI_SURVEY_JSON accessToken:SA_ACCESS_TOKEN] parameter:nil success:^(id data) {
            successBlock(data);
        } failed:^(NSError *error) {
            [AlertUtil showAlertWithErrorWithoutTitle:error];
            failedBlock(error);
        }];
    }
}

/**
 *  Append access token for request
 *
 *  @param uri         short url of the request
 *  @param accessToken the access token to call api
 *
 *  @return URI string
 */
-(NSString *)appendAccessToken:(NSString *)uri accessToken:(NSString *)accessToken{
    if(uri && accessToken){
    return [NSString stringWithFormat:@"%@?%@=%@",uri,SA_ACCESS_TOKEN,SA_TOKEN];
    }else{
        return uri;
    }
}


@end
