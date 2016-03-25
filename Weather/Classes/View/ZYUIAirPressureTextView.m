//
//  ZYUIAirPressureView.m
//  Weather
//
//  Created by staff on 16/3/25.
//  Copyright © 2016年 zyqiosexercise. All rights reserved.
//  气压文字
//

#import "ZYUIAirPressureTextView.h"
#import "Masonry.h"

#define SMALL_FONT [UIFont systemFontOfSize:16]
#define BIG_FONT [UIFont   systemFontOfSize:22]
#define FONT_COLOR [UIColor colorWithWhite:1.0 alpha:1.1]

@implementation ZYUIAirPressureTextView

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
    UILabel *airTextLabel = ({
        UILabel *view = [[UILabel alloc]init];
        view.textColor = FONT_COLOR;
        view.text = @"气压";
        view.font = SMALL_FONT;
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(0);
        }];
        
        view;
    });
    
    UILabel *airUnit = ({
        UILabel *view = [[UILabel alloc]init];
        view.textColor = FONT_COLOR;
        view.text = @"毫米";
        view.font = SMALL_FONT;
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
        
        view;
    });

    UILabel *airNumLabel = ({
        UILabel *view = [[UILabel alloc]init];
        view.textColor = FONT_COLOR;
        view.text = @"23";
        view.font = BIG_FONT;
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(airUnit.mas_left).offset(-3);
            make.bottom.mas_equalTo(0);
        }];
        
        view;
    });
    
}

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(100, 42);
}

@end
