//
//  ZYUISunRiseSetLayer.m
//  Weather
//
//  Created by staff on 16/3/28.
//  Copyright © 2016年 zyqiosexercise. All rights reserved.
//

#import "ZYUISunRiseSetLayer.h"
#import "ZYConstantDef.h"

#define SUN_CIRCLE_COLOR  [UIColor colorWithRed:252.0/255.0 green:223.0/255.0 blue:101.0/255.0 alpha:1.0f]
#define SUN_LINE_DOT_COLOR [UIColor colorWithRed:252.0/255.0 green:223.0/255.0 blue:101.0/255.0 alpha:1.0f]

#define SunLayerHeight 80
#define SunLayerWidth MAIN_VIEW_WIDTH*0.85

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
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    CGFloat height = self.bounds.size.height;
    CGFloat width = self.bounds.size.width;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //画直线
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(ctx, 1);
    CGContextMoveToPoint(ctx, 0, height);
    CGContextAddLineToPoint(ctx, width, height);
    CGContextStrokePath(ctx);
    
    CGFloat startPos = (self.riseTime/dayMinNum) * width;
    CGFloat endPos = (self.setTime/dayMinNum) * width;
   
    CGFloat radius = (endPos - startPos)*0.5;
    CGPoint centerOfCircle = CGPointMake(startPos + radius, height);
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddArc(circlePath, nil, centerOfCircle.x, centerOfCircle.y,
                                  radius, 1.0*M_PI, 2*M_PI, 0);

    CGContextAddPath(ctx, circlePath);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor grayColor].CGColor);
    CGContextSetLineWidth(ctx, 1);
    CGContextFillPath(ctx);

    CGFloat timeRatio = (time - self.riseTime)/(self.setTime - self.riseTime);
    CGFloat deltaAngle = timeRatio*M_PI;
//    CGFloat timeX =  startPos + timeRatio*radius*2;
    CGFloat x = cos(deltaAngle);
    CGFloat timeX = startPos + radius - (x*radius);
    CGMutablePathRef leftPartCirclePath = CGPathCreateMutable();

    CGPathMoveToPoint(leftPartCirclePath, nil, timeX, height);
    CGPathAddArc(leftPartCirclePath, nil, centerOfCircle.x, centerOfCircle.y,
                 radius, 1.0*M_PI, 1.0*M_PI + deltaAngle, 0);
    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextSetLineWidth(ctx, 1);
    CGContextAddPath(ctx, leftPartCirclePath);
//    CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
    
    //设置画笔线条粗细
    CGContextSetLineWidth(ctx, 1.0);
    //设置矩形填充颜色：红色
    CGContextSetRGBFillColor (ctx, 1.0, 0.0, 0.0, 1.0);
    //设置字体
    UIFont *font = [UIFont boldSystemFontOfSize:31.0];
    //在指定的矩形区域内画文字
    [@"hello world" drawAtPoint:CGPointMake(0, 0) withFont:font];
    
    /*
    CGContextMoveToPoint(ctx, center.x - 90, center.y);
    CGContextAddArc(ctx, center.x, center.y - 1, 88, M_PI, M_PI + time * M_PI, NO);
    if (0 == time) {
        self.ratioLine = 0;
    }
    if (time < 1 / 2 && time != 0) {
        self.ratioLine = 90 - cos(time * M_PI) * 90;
    }
    if (1 / 2 == time) {
        self.ratioLine = 90;
    }
    if (time > 1 / 2 && time != 1) {
        self.ratioLine = 90 + cos(M_PI - time * M_PI) * 90;
    }
    if (1 == time) {
        self.ratioLine = 180;
    }
    
    CGContextAddLineToPoint(ctx, center.x + self.ratioLine - 90, center.y);
    CGContextFillPath(ctx);
    
    CGContextSetFillColorWithColor(ctx, [UIColor yellowColor].CGColor);
    CGContextAddEllipseInRect(ctx, CGRectMake(center.x - 93, center.y - 3, 6, 6));
    CGContextFillPath(ctx);
    
    CGContextSetFillColorWithColor(ctx, [UIColor yellowColor].CGColor);
    CGContextAddEllipseInRect(ctx, CGRectMake(center.x + 87, center.y - 3, 6, 6));
    CGContextFillPath(ctx);
    */
    self.contents = (id)UIGraphicsGetImageFromCurrentImageContext().CGImage;
    UIGraphicsEndImageContext();
}

@end
