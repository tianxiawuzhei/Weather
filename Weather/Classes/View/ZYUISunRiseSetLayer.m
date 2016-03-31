//
//  ZYUISunRiseSetLayer.m
//  Weather
//
//  Created by staff on 16/3/28.
//  Copyright © 2016年 zyqiosexercise. All rights reserved.
//

#import "ZYUISunRiseSetLayer.h"
#import "ZYConstantDef.h"
#import "ZYLogging.h"
#import "UIColor+ZYExtend.h"

#define SUN_CIRCLE_COLOR [UIColor zy_colorWithRGBHex:0x60644c alpha:0.8]
#define SUN_SMALL_CIRCLE_COLOR [UIColor zy_colorWithRGBHex:0xffce1d alpha:1]
#define SUN_LINE_DOT_COLOR [UIColor colorWithWhite:0.8 alpha:0.7]
#define SunLayerHeight 90
#define SunLayerWidth MAIN_VIEW_WIDTH*0.9

static const CGFloat dayMinNum = 60*24;

@implementation ZYUISunRiseSetLayer

@dynamic time;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.bounds = CGRectMake(0, 0, SunLayerWidth, SunLayerHeight);
        self.riseTime = 6*60;
        self.setTime = 18*60;
//        [self setNeedsDisplay];
    }
    
    return self;
}

+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:@"time"]) {
        return YES;
    }
    
    return [super needsDisplayForKey:key];
}

- (id<CAAction>)actionForKey:(NSString *)event {
    if ([event isEqualToString:@"time"]) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:event];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        animation.fromValue = @([[self presentationLayer] time]);
        animation.duration = 4.0;
        return animation;
    }
    
    return [super actionForKey:event];
}

- (void)display {
    CGFloat time = [self.presentationLayer time];
//    ZYLog(@"display time %f", time);
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    CGFloat height = self.bounds.size.height - 8;
    CGFloat width = self.bounds.size.width;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //画直线
    CGContextSetStrokeColorWithColor(ctx, SUN_LINE_DOT_COLOR.CGColor);
    CGContextSetLineWidth(ctx, 1);
    CGContextMoveToPoint(ctx, 0, height);
    CGContextAddLineToPoint(ctx, width, height);
    CGContextStrokePath(ctx);
    
    CGFloat startPos = 34;//(self.riseTime/dayMinNum) * width;
    CGFloat endPos = 180;//(self.setTime/dayMinNum) * width;
    
    CGFloat radius = (endPos - startPos)*0.5;
    CGPoint centerOfCircle = CGPointMake(startPos + radius, height);
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddArc(circlePath, nil, centerOfCircle.x, centerOfCircle.y,
                                  radius, 1.0*M_PI, 2*M_PI, 0);
    CGContextAddPath(ctx, circlePath);
    CGContextSetStrokeColorWithColor(ctx, SUN_LINE_DOT_COLOR.CGColor);
    CGFloat arr[] = {3, 1};
    //下面最后一个参数“2”代表排列的个数。
    CGContextSetLineDash(ctx, 0, arr, 2);
//    CGContextSetFillColorWithColor(ctx, [UIColor grayColor].CGColor);
    CGContextSetLineWidth(ctx, 1);
    CGContextStrokePath(ctx);
    
    if (time > self.riseTime) {
        CGFloat timeRatio = (time - self.riseTime)/(self.setTime - self.riseTime);
        CGFloat deltaAngle = timeRatio*M_PI;
        //    CGFloat timeX =  startPos + timeRatio*radius*2;
        CGFloat x = cos(deltaAngle);
        CGFloat timeX = startPos + radius - (x*radius);
        CGMutablePathRef leftPartCirclePath = CGPathCreateMutable();
        
        CGPathMoveToPoint(leftPartCirclePath, nil, timeX, height);
        CGPathAddArc(leftPartCirclePath, nil, centerOfCircle.x, centerOfCircle.y,
                     radius, 1.0*M_PI, 1.0*M_PI + deltaAngle, 0);
        CGContextSetFillColorWithColor(ctx, SUN_CIRCLE_COLOR.CGColor);
        CGContextSetLineWidth(ctx, 1);
        CGContextAddPath(ctx, leftPartCirclePath);
        CGContextFillPath(ctx);
    }

    CGFloat smallRadius = 4;
    CGPoint leftSmallCenter = CGPointMake(startPos, height);
    CGAffineTransform t1 = CGAffineTransformConcat(CGAffineTransformConcat(
       CGAffineTransformMakeTranslation(-leftSmallCenter.x, -leftSmallCenter.y),
             CGAffineTransformMakeScale(1, 1.25)),
            CGAffineTransformMakeTranslation(leftSmallCenter.x, leftSmallCenter.y));
    CGMutablePathRef leftCirPath = CGPathCreateMutable();
    CGPathAddArc(leftCirPath, &t1, leftSmallCenter.x, leftSmallCenter.y,
                 smallRadius, 0*M_PI, 2*M_PI, 0);
    CGContextAddPath(ctx, leftCirPath);
    CGContextSetFillColorWithColor(ctx, SUN_SMALL_CIRCLE_COLOR.CGColor);
    CGContextFillPath(ctx);
    
    CGPoint rightSmallCenter = CGPointMake(endPos, height);
    CGAffineTransform t3 = CGAffineTransformConcat(CGAffineTransformConcat(
                                    CGAffineTransformMakeTranslation(-rightSmallCenter.x, -rightSmallCenter.y),
                                    CGAffineTransformMakeScale(1, 1.25)),
                            CGAffineTransformMakeTranslation(rightSmallCenter.x, rightSmallCenter.y));
    CGMutablePathRef rightCirPath = CGPathCreateMutable();
    CGPathAddArc(rightCirPath, &t3, rightSmallCenter.x, rightSmallCenter.y,
                 smallRadius, 0*M_PI, 2*M_PI, 0);
    CGContextAddPath(ctx, rightCirPath);
    CGContextSetFillColorWithColor(ctx, SUN_SMALL_CIRCLE_COLOR.CGColor);
    CGContextFillPath(ctx);
    
    self.contents = (id)UIGraphicsGetImageFromCurrentImageContext().CGImage;
    UIGraphicsEndImageContext();
}

@end
