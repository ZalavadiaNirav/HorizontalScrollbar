//
//  UIImage+UImageColor.m
//  scrollvw
//
//  Created by C N Soft Net on 19/09/16.
//  Copyright © 2016 C N Soft Net. All rights reserved.
//

#import "UIImage+UImageColor.h"

@implementation UIImage (UImageColor)


+ (UIImage *)imageWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor size:(CGSize)size
{
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = CGRectMake(0, 0, size.width, size.height);
    layer.colors = @[ (__bridge id)startColor.CGColor,   // start color
                      (__bridge id)endColor.CGColor ]; // end color
    
    CIFilter *blur = [CIFilter filterWithName:@"CIGaussianBlur"];
    [blur setDefaults];
    layer.backgroundFilters = [NSArray arrayWithObject:blur];
    UIGraphicsBeginImageContext(size);
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *res = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return res;
}

+ (UIColor *)colorWithHex:(NSInteger)intColor
{
    CGFloat bComponent = intColor & 0xFF;
    CGFloat gComponent = intColor >> 8 & 0xFF;
    CGFloat rComponent = intColor >> 16 & 0xFF;
    
    return [UIColor colorWithRed:rComponent/255.0 green:gComponent/255.0 blue:bComponent/255.0 alpha:1];
}



@end
