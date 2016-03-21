//
//  ZYUIVerticalDashLineView.m
//  Weather
//
//  Created by staff on 16/3/21.
//  Copyright © 2016年 zyqiosexercise. All rights reserved.
//

#import "ZYUIVerticalDashLineView.h"

#define LINE_COLOR  [UIColor colorWithWhite:1.0f alpha:0.5]

@implementation ZYUIVerticalDashLineView

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
    return CGSizeMake(1, UIViewNoIntrinsicMetric);
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
    CGContextAddLineToPoint(currentContext, 0, self.frame.origin.y + self.frame.size.height);
    //设置虚线排列的宽度间隔:下面的arr中的数字表示先绘制3个点再绘制1个点
    CGFloat arr[] = {3, 1};
    //下面最后一个参数“2”代表排列的个数。
    CGContextSetLineDash(currentContext, 0, arr, 2);
    CGContextDrawPath(currentContext, kCGPathStroke);
}

@end

/**
 *test ui code
 */
/*
     ZYUIVerticalDashLineView* verLine = [[ZYUIVerticalDashLineView alloc]init];
     [self.view addSubview:verLine];
     [verLine mas_makeConstraints:^(MASConstraintMaker *make) {
     make.left.mas_equalTo(100);
     make.top.mas_equalTo(100);
     // make.bottom.mas_equalTo(150); //注：这样无法定义高度，必须用下面的make.height.mas_equalTo(100)方法
     // 也可以使用make.bottom.equalTo(self.view.mas_bottom).offset(-100);方法
     make.height.mas_equalTo(100);
     }];
 */
