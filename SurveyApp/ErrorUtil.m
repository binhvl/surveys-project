#import "ErrorUtil.h"

@implementation ErrorUtil

+(NSString *)getMessageFromError:(NSError *)error{
    NSString *message = [[[[error userInfo]objectForKey:@"Error"]objectForKey:@"error"]objectForKey:@"message"];
    if(message){
    return message;
    }else{
        message = [[error userInfo]objectForKey:@"NSLocalizedDescription"];
        if(message){
        return message;
        }else{
            return [self messageDefaultFromStatusCode:[self getStatusCodeFromError:error]];
        }
    }
}

+(long)getStatusCodeFromError:(NSError *)error{
    NSHTTPURLResponse *response = (NSHTTPURLResponse *)[[error userInfo]objectForKey:@"com.alamofire.serialization.response.error.response"];
    NSLog(@"%ld",(long)response.statusCode);
    return response.statusCode;
}

+(NSString *)messageDefaultFromStatusCode:(long)statusCode{
    switch (statusCode) {
        case 401:{
            return @"Your token is expire, please login again!";
            break;
        }
        case 403:{
            return @"You don't have permission";
            break;
        }
        case 500:{
            return @"There is an error communicating with the server, please try again";
            break;
        }
        default:
            break;
    }
    return @"There is an error communicating with the server, please try again";
}
@end
