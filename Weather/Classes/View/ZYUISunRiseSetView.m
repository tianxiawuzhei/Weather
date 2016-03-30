//
//  ZYUISunRiseSetView.m
//  Weather
//
//  Created by staff on 16/3/28.
//  Copyright © 2016年 zyqiosexercise. All rights reserved.
//

#import "ZYUISunRiseSetView.h"
#import "ZYUISunRiseSetLayer.h"
#import "ZYConstantDef.h"

#define SunViewHeight 80
#define SunViewWidth MAIN_VIEW_WIDTH*0.85

@implementation ZYUISunRiseSetView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeUI];
    }
    
    return self;
}

- (void)initializeUI
{
    ZYUISunRiseSetLayer *layer = [[ZYUISunRiseSetLayer alloc]init];
//    layer.backgroundColor = [UIColor blackColor].CGColor;
//    layer.opacity = 0.05;
    [layer setAffineTransform:CGAffineTransformMakeScale(1, 0.85)];
    layer.position = CGPointMake(SunViewWidth*0.5, SunViewHeight*0.5);
    [self.layer addSublayer:layer];
    layer.time = 12*60;
   
    
}

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(SunViewWidth, SunViewHeight);
}

@end
