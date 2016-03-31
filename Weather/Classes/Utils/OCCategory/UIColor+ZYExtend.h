//
//  UIColor+ZYExtend.h
//  Weather
//
//  Created by staff on 16/3/30.
//  Copyright © 2016年 zyqiosexercise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ZYExtend)

/**
 *  @param hex   0x558865
 *  @param alpha 0.0 - 1.0
 *
 *  @return
 */
+ (UIColor *)zy_colorWithRGBHex:(NSUInteger)hex alpha:(CGFloat)alpha;

/**
 *  alpha  = 1.0
 *  @param colorString example： "0x558865"
 *
 *  @return
 */
+ (UIColor *)zy_colorWithHexString:(NSString *)colorString;

/**
 *  @param colorString example： "0x558865"
 *  @param alpha       0.0 ~ 1.0
 *
 *  @return
 */
+ (UIColor *)zy_colorWithHexString:(NSString *)colorString alpha:(CGFloat)alpha;

@end
