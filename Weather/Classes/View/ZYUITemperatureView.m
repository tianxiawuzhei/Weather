//
//  UITemperatureView.m
//  Weather
//
//  Created by staff on 16/3/8.
//  Copyright © 2016年 zyqIosTest. All rights reserved.
//

#import "ZYUITemperatureView.h"
#import "Masonry.h"

@implementation ZYUITemperatureView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    // 温度标签
    static const int paddingLeft = 10;
    static const int paddingBottom = 10;
    
    UILabel* temperatureLabel = ({
        UILabel* label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.text = @"0°";
        label.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:120];
        [self addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(paddingLeft);
            make.bottom.mas_equalTo(paddingBottom);
        }];
        label;
    });
    
    self.temperatureLabel = temperatureLabel;
    
    //向上箭头
    UIImageView* upArrow = ({
        UIImageView* imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"PrimaryInfo_high"]];
        [self addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(temperatureLabel.mas_left).offset(10);
            make.bottom.equalTo(temperatureLabel.mas_top).offset(-10);
        }];
        
        imgView;
    });
    
    UILabel* highestTempLabel = ({
        UILabel* label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.text = @"0°";
        label.font = [UIFont systemFontOfSize:17];
        [self addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(upArrow.mas_left).offset(22);
            make.bottom.mas_equalTo(upArrow.mas_bottom);
        }];
        label;
    });
    
    //向下箭头
    UIImageView* downArrow = ({
        UIImageView* imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"PrimaryInfo_low"]];
        [self addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(highestTempLabel.mas_left).offset(22);
            make.bottom.equalTo(highestTempLabel.mas_bottom);
        }];
        
        imgView;
    });
    
    UILabel* lowestTempLabel = ({
        UILabel* label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.text = @"0°";
        label.font = [UIFont systemFontOfSize:17];
        [self addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(downArrow.mas_left).offset(22);
            make.bottom.equalTo(downArrow.mas_bottom);
        }];
        label;
    });
    
    UIImageView* weatherIcon = ({
        UIImageView* imgView = [[UIImageView alloc]init];
        imgView.image = [UIImage imageNamed:@"clear_day"];
        [self addSubview:imgView];
        
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(paddingLeft+10);
            make.bottom.equalTo(upArrow.mas_top).offset(-12);
        }];
        
        imgView;
    });
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
