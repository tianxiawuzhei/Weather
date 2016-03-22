//
//  UIPrecipitationInfoView.m
//  Weather
//
//  Created by staff on 16/3/14.
//  Copyright © 2016年 zyqIosTest. All rights reserved.
//

#import "ZYUIPrecipitationInfoView.h"
#import "Masonry.h"
#import "ZYUILabelWithLineView.h"
#import "ZYUIPrecipitationInfoCell.h"
#import "ZYUIVerticalDashLineView.h"

@implementation ZYUIPrecipitationInfoView

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
    self.layer.cornerRadius = 3;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5f];
    
    ZYUILabelWithLineView* title = ({
        ZYUILabelWithLineView* view = [[ZYUILabelWithLineView alloc]init];
        view.titleLabel.text = @"降水量";
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        
        view;
    });
    /*
    NSUInteger superViewWidth = self.bounds.size.width;
    ZYUIPrecipitationInfoCell* morning = ({
        ZYUIPrecipitationInfoCell* infoCell = [[ZYUIPrecipitationInfoCell alloc]init];
        [infoCell setPrecipitation:@"早上" andPercent:21];
        [self addSubview:infoCell];
        [infoCell mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_left).offset(superViewWidth/8);
            make.width.mas_equalTo(superViewWidth/4);
            make.bottom.mas_equalTo(-10);
        }];
        
        infoCell;
    });
    
    ZYUIVerticalDashLineView* morningLine = ({
        ZYUIVerticalDashLineView* line = [[ZYUIVerticalDashLineView alloc]init];
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(superViewWidth/4);
            make.top.equalTo(morning.mas_top);
            make.height.equalTo(morning.mas_height);
        }];
        
        line;
    });
*/
    
    
}

@end
