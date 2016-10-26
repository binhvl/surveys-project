//
//  SAImageViewUtil.h
//  SurveyApp
//
//  Created by KEAZ on 10/26/16.
//  Copyright © 2016 KEAZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SAImageViewUtil : NSObject
+ (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
@end
