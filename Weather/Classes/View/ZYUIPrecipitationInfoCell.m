//
//  UIPrecipitationInfoCell.m
//  Weather
//
//  Created by staff on 16/3/14.
//  Copyright © 2016年 zyqIosTest. All rights reserved.
//

#import "ZYUIPrecipitationInfoCell.h"
#import "Masonry.h"

@interface ZYUIPrecipitationInfoCell ()

@end

@implementation ZYUIPrecipitationInfoCell

//154/2 174/2
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
    UILabel* title = ({
        UILabel* label = [[UILabel alloc]init];
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor whiteColor];
        label.text = @"早上";
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(5);
            make.centerX.equalTo(self);
        }];
    
        label;
    });
    self.titleLabel = title;
    
    UIImageView* iconImgView = ({
        UIImageView* imgView = [[UIImageView alloc]init];
        [self addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY);
        }];
        imgView;
    });
    self.iconImgView = iconImgView;
    
    UILabel* percentLabel = ({
        UILabel* label = [[UILabel alloc]init];
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor whiteColor];
        label.text = @"50";
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(5);
            make.centerX.equalTo(self);
        }];
        
        label;
    });
    self.percentLabel = percentLabel;
    
}

- (NSString*)iconImgName:(NSUInteger)percent
{
    CGFloat tmpPercent = percent/10.0;
    NSInteger round = lround(tmpPercent);
    NSInteger round10 = round * 10;
    return [NSString stringWithFormat:@"rain_ico_%d", round10];
}

- (void)setPrecipitation:(NSString*)time andPercent:(NSInteger)percent
{
    self.titleLabel.text = time;
    self.percentLabel.text = [NSString stringWithFormat:@"%d", percent];
    self.iconImgView.image = [UIImage imageNamed:[self iconImgName:percent]];
}

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(77, 87);
}

@end
