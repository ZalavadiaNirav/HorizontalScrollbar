//
//  UIImage+UImageColor.h
//  scrollvw
//
//  Created by C N Soft Net on 19/09/16.
//  Copyright © 2016 C N Soft Net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UImageColor)

+ (UIImage *)imageWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor size:(CGSize)size;
+ (UIColor *)colorWithHex:(NSInteger)intColor;

@end
