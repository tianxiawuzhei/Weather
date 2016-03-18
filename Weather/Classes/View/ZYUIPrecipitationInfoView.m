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

@implementation ZYUIPrecipitationInfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
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
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        
        view;
    });
    
    ZYUIPrecipitationInfoCell* morning = [[ZYUIPrecipitationInfoCell alloc]init];
    [morning setPrecipitation:@"早上" andPercent:21];
    [self addSubview:morning];
    
}

@end
