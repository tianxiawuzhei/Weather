//
//  ZYUIWindSpeedAirView.m
//  Weather
//
//  Created by staff on 16/3/25.
//  Copyright © 2016年 zyqiosexercise. All rights reserved.
//

#import "ZYUIWindSpeedAirView.h"

#import "Masonry.h"

#import "ZYConstantDef.h"
#import "ZYUILabelWithLineView.h"
#import "ZYUIBigWindmillView.h"
#import "ZYUISmallWindmillView.h"
#import "ZYUIWindSpeedTextView.h"
#import "ZYUIAirPressureTextView.h"

@interface ZYUIWindSpeedAirView ()

@property (nonatomic, weak) ZYUIBigWindmillView *bigWindmillView;
@property (nonatomic, weak) ZYUISmallWindmillView *smallWindmillView;

@end

@implementation ZYUIWindSpeedAirView

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
    self.backgroundColor = MAIN_VIEW_COLOR;
    
    ZYUILabelWithLineView *titleLabel = ({
        ZYUILabelWithLineView* label = [[ZYUILabelWithLineView alloc]init];
        [label setTitleText:@"风速和气压"];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        
        label;
    });
    
    ZYUIBigWindmillView *bigWindmill = ({
        ZYUIBigWindmillView * windmill = [[ZYUIBigWindmillView alloc]init];
        [self addSubview:windmill];
        [windmill mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(27);
            make.bottom.mas_equalTo(-19);
        }];
        
        windmill;
    });
    self.bigWindmillView = bigWindmill;
    
    ZYUISmallWindmillView *smallWindmill = ({
        ZYUISmallWindmillView *smallWindmill = [[ZYUISmallWindmillView alloc]init];
        [self addSubview:smallWindmill];
        [smallWindmill mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(70);
            make.bottom.mas_equalTo(-19);
        }];
        
        smallWindmill;
    });
    self.smallWindmillView = smallWindmill;
    
    self.bigWindmillView.windSpeed = 15;
    self.smallWindmillView.windSpeed = 15;
    
    ZYUIWindSpeedTextView *speedTextView = ({
        ZYUIWindSpeedTextView *view = [[ZYUIWindSpeedTextView alloc]init];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(112);
            make.bottom.mas_equalTo(-77);
        }];
        
        view;
    });

    ZYUIAirPressureTextView *airPreTextView = ({
        ZYUIAirPressureTextView *view = [[ZYUIAirPressureTextView alloc]init];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-16);
            make.bottom.mas_equalTo(-3);
        }];
        
        view;
    });

    
}
@end
