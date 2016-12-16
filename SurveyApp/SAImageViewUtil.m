//
//  SAImageViewUtil.m
//  SurveyApp
//
//  Created by KEAZ on 10/26/16.
//  Copyright © 2016 KEAZ. All rights reserved.
//

#import "SAImageViewUtil.h"

@implementation SAImageViewUtil
+ (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end
