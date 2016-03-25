//
//  ZYUIWindSpeedTextView.m
//  Weather
//
//  Created by staff on 16/3/25.
//  Copyright © 2016年 zyqiosexercise. All rights reserved.
//

#import "ZYUIWindSpeedTextView.h"
#import "Masonry.h"

#define SMALL_FONT [UIFont systemFontOfSize:16]
#define BIG_FONT [UIFont   systemFontOfSize:22]
#define FONT_COLOR [UIColor colorWithWhite:1.0 alpha:1.1]

@interface ZYUIWindSpeedTextView ()
@property (nonatomic, weak) UILabel *speedNumLabel;
@property (nonatomic, weak) UILabel *dirLabel;
@end

@implementation ZYUIWindSpeedTextView

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
    UILabel *speedTextLabel = ({
        UILabel *view = [[UILabel alloc]init];
        view.textColor = FONT_COLOR;
        view.text = @"风速";
        view.font = SMALL_FONT;
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
        }];
        
        view;
    });
    
    UILabel *speedNumLabel = ({
        UILabel *view = [[UILabel alloc]init];
        view.textColor = FONT_COLOR;
        view.text = @"23";
        view.font = BIG_FONT;
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.bottom.mas_equalTo(2);
        }];
        
        view;
    });
    
    self.speedNumLabel = speedNumLabel;
    
    UILabel *speedUnit = ({
        UILabel *view = [[UILabel alloc]init];
        view.textColor = FONT_COLOR;
        view.text = @"公里/小时";
        view.font = SMALL_FONT;
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(speedNumLabel.mas_right).offset(4);
            make.bottom.mas_equalTo(0);
        }];
        
        view;
    });

    UILabel *dirLabel = ({
        UILabel *view = [[UILabel alloc]init];
        view.textColor = FONT_COLOR;
        view.font = SMALL_FONT;
        view.text = @"东北方";
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(speedUnit.mas_right).offset(4);
            make.bottom.mas_equalTo(0);
        }];
        
        view;
    });
    self.dirLabel = dirLabel;
   
}

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(166, 42);
}

@end
