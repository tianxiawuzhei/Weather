//
//  UIDetailInfoRightCellView.m
//  Weather
//
//  Created by staff on 16/3/11.
//  Copyright © 2016年 zyqIosTest. All rights reserved.
//

#import "ZYUIDetailInfoRightCellView.h"
#import "Masonry.h"

#import "ZYUIDashLineView.h"

@implementation ZYUIDetailInfoRightCellView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    
    return self;
}

- (void)initialize
{
    UILabel* leftLabel = ({
        UILabel* label = [[UILabel alloc]init];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:16];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left);
            make.centerY.equalTo(self.mas_centerY);
        }];
        
        label;
    });
    
    self.leftLabel = leftLabel;
    self.leftLabel.text = @"神仙";
    
    UILabel* rightLabel = ({
        UILabel* label = [[UILabel alloc]init];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:18];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-2);
            make.centerY.equalTo(self.mas_centerY);
        }];
        
        label;
    });
    
    self.rightLabel = rightLabel;
    self.rightLabel.text = @"100";
    
    ZYUIDashLineView* lineView = ({
        ZYUIDashLineView* view = [[ZYUIDashLineView alloc]init];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.bottom.equalTo(self.mas_bottom);
         }];
        
        view;
    });
    
}

- (void)setDetailInfo:(NSString *)key andValue:(NSString *)value
{
    self.leftLabel.text = key;
    self.rightLabel.text = value;
}

- (CGSize)intrinsicContentSize
{
    CGFloat width = 158.0;
    CGFloat height = 34.0;
    return CGSizeMake(width, height);
}

@end
