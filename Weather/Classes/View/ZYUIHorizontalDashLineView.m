//
//  UIDashLineView.m
//  Weather
//
//  Created by staff on 16/3/11.
//  Copyright © 2016年 zyqIosTest. All rights reserved.
//

#import "ZYUIHorizontalDashLineView.h"

#define LINE_COLOR  [UIColor colorWithWhite:1.0f alpha:0.5]
@implementation ZYUIHorizontalDashLineView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(UIViewNoIntrinsicMetric, 1);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    //设置虚线颜色
    CGContextSetStrokeColorWithColor(currentContext, LINE_COLOR.CGColor);
    //设置虚线宽度
    CGContextSetLineWidth(currentContext, 1);
    //设置虚线绘制起点
    CGContextMoveToPoint(currentContext, 0, 0);
    //设置虚线绘制终点
    CGContextAddLineToPoint(currentContext, self.frame.origin.x + self.frame.size.width, 0);
    //设置虚线排列的宽度间隔:下面的arr中的数字表示先绘制3个点再绘制1个点
    CGFloat arr[] = {3, 1};
    //下面最后一个参数“2”代表排列的个数。
    CGContextSetLineDash(currentContext, 0, arr, 2);
    CGContextDrawPath(currentContext, kCGPathStroke);
}

@end
