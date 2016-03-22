//
//  UILabelWithLineView.m
//  Weather
//
//  Created by staff on 16/3/9.
//  Copyright © 2016年 zyqIosTest. All rights reserved.
//

#import "ZYUILabelWithLineView.h"

#import "Masonry.h"

@implementation ZYUILabelWithLineView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    UILabel* titleLabel = ({
        UILabel* label = [[UILabel alloc]init];
        label.text = @"风速";
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:16];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(10);
        }];
        
        label;
    });
    
    _titleLabel = titleLabel;
    
    UIView* lineView = ({
        UIView* view = [[UIView alloc]init];
        view.backgroundColor = [UIColor whiteColor];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(1);
            make.left.mas_equalTo(10);
            make.right.equalTo(self.mas_right).offset(-10);
            make.centerY.equalTo(titleLabel.mas_bottom).offset(0);
//            make.bottom.equalTo(titleLabel.mas_bottom).offset(1);
        }];
        
        view;
    });
}

- (void)setTitleText:(NSString *)titleText
{
    self.titleLabel.text = titleText;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
}

//改写UIView的intrinsicContentSize
- (CGSize)intrinsicContentSize
{
    CGFloat height = [self.titleLabel intrinsicContentSize].height + 2 + 1;
    return CGSizeMake(UIViewNoIntrinsicMetric, height);
}

@end
