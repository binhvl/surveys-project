#import "SABaseService.h"

@implementation SABaseService

+ (instancetype)sharedInstance {
    
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:SA_HOST_DOMAIN]];
    });
    return sharedInstance;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    if(!url){
        url = [NSURL URLWithString:SA_HOST_DOMAIN];
    }
    self = [super initWithBaseURL:url];
    if (self) {
        self.requestSerializer.timeoutInterval  = TIME_OUT;
        self.responseSerializer                 = [AFJSONResponseSerializer serializer];
        self.requestSerializer                  = [AFJSONRequestSerializer serializer];
    }
        return self;
}

- (void)requestWithGetMethod:(RequestMethod)mehod uri:(NSString*)uri parameter:(NSDictionary *)parameter
                     success:(void (^)(id  _Nullable data))successBlock
                      failed:(void (^)(NSError* error))failedBlock{
    switch(mehod) {
        case GET:{
            [self GET:uri parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                successBlock(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failedBlock(error);
            }];
            break;
        }
        case POST:{
            [self POST:uri parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                successBlock(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failedBlock(error);
            }];
            break;
        }
        case PUT:{
            [self PUT:uri parameters:parameter success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                successBlock(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failedBlock(error);
            }];
            break;
        }
        case DELETE:{
            [self DELETE:uri parameters:parameter success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                successBlock(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failedBlock(error);
            }];
            break;
        }
        default:
            break;
    }
    
}

@end
