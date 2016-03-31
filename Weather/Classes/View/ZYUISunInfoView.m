//
//  ZYUISunInfoView.m
//  Weather
//
//  Created by staff on 16/3/31.
//  Copyright © 2016年 zyqiosexercise. All rights reserved.
//

#import "ZYUISunInfoView.h"

#import "Masonry.h"
#import "ZYConstantDef.h"
#import "ZYUILabelWithLineView.h"
#import "ZYUISunRiseSetView.h"

@implementation ZYUISunInfoView

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
    
    ZYUILabelWithLineView *title = ({
        ZYUILabelWithLineView *view = [[ZYUILabelWithLineView alloc]init];
        [view setTitleText:@"太阳"];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(10);
        }];
        
        view;
    });
    
    ZYUISunRiseSetView *sunView = ({
        ZYUISunRiseSetView *view = [[ZYUISunRiseSetView alloc]init];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(-15);
            make.bottom.mas_equalTo(-13);
        }];
        
        view;
    });
}

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(MAIN_VIEW_WIDTH, SUN_VIEW_HEIGHT);
}

@end
