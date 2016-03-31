//
//  UIColor+ZYExtend.m
//  Weather
//
//  Created by staff on 16/3/30.
//  Copyright © 2016年 zyqiosexercise. All rights reserved.
//

#import "UIColor+ZYExtend.h"

@implementation UIColor (ZYExtend)

+ (UIColor *)zy_colorWithRGBHex:(NSUInteger)hex alpha:(CGFloat)alpha
{
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:alpha];
}

+ (UIColor *)zy_colorWithHexString:(NSString *)colorString
{
    NSScanner *scanner = [NSScanner scannerWithString:colorString];
    unsigned hexNum;
    if (![scanner scanHexInt:&hexNum]){
        return nil;
    }
    
    return [UIColor zy_colorWithRGBHex:hexNum alpha:1.0f];
}

+ (UIColor *)zy_colorWithHexString:(NSString *)colorString alpha:(CGFloat)alpha
{
    UIColor *color = [UIColor zy_colorWithHexString:colorString];
    const CGFloat *c = CGColorGetComponents(color.CGColor);
    return [UIColor colorWithRed:c[0] green:c[0] blue:c[0] alpha:alpha];
}

@end
