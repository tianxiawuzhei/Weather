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
#import "Masonry.h"

#define SunViewHeight 115
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
    [layer setAffineTransform:CGAffineTransformMakeScale(1, 0.8)];
    layer.position = CGPointMake(SunViewWidth*0.5, SunViewHeight*0.5);
    [self.layer addSublayer:layer];
    layer.time = 15*60;
    
    UILabel *riseTimeLabel = ({
        UILabel *view = [[UILabel alloc]init];
        view.text = @"05:34";
        view.font = [UIFont systemFontOfSize:16];
        view.textColor = [UIColor whiteColor];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_left).offset(34);
            make.bottom.mas_equalTo(0);
        }];
        
        view;
    });
    
    UILabel *setTimeLabel = ({
        UILabel *view = [[UILabel alloc]init];
        view.text = @"18:34";
        view.font = [UIFont systemFontOfSize:16];
        view.textColor = [UIColor whiteColor];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_left).offset(180);
            make.bottom.mas_equalTo(0);
        }];
        
        view;
    });

}

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(SunViewWidth, SunViewHeight);
}

@end
