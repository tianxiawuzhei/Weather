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
#import "ZYConstantDef.h"

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
    
    NSUInteger superViewHeigth = PRECIPITATIONINFO_VIEW_HEIGHT;
    NSUInteger superViewWidth = MAIN_VIEW_WIDTH;
    NSArray* arr = [NSArray arrayWithObjects:@"4", @"7", @"9", @"50", nil];
    NSInteger index = 0;
    for (NSString* pnpc in arr) {
        ZYUIPrecipitationInfoCell* infoCell = ({
            ZYUIPrecipitationInfoCell* infoCell = [[ZYUIPrecipitationInfoCell alloc]init];
            [infoCell setPrecipitation:@"早上" andPercent:pnpc.integerValue];
            [self addSubview:infoCell];
            [infoCell mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(index*(superViewWidth/4));
                make.width.mas_equalTo(superViewWidth/4);
                make.bottom.mas_equalTo(-10);
            }];
            
            infoCell;
        });
        
        if (index != 3) {
            ZYUIVerticalDashLineView* line = ({
                ZYUIVerticalDashLineView* line = [[ZYUIVerticalDashLineView alloc]init];
                [self addSubview:line];
                [line mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(infoCell.mas_right);
                    make.centerY.equalTo(infoCell.mas_centerY);
                    make.height.equalTo(infoCell.mas_height);
                }];
                
                line;
            });
        }
        
        index++;
    }
}

@end

/**
 //  test code
 ZYUIPrecipitationInfoView* infoView = [[ZYUIPrecipitationInfoView alloc]initWithFrame:CGRectMake(MAIN_VIEW_LEFT, 100, MAIN_VIEW_WIDTH, PRECIPITATIONINFO_VIEW_HEIGHT)];
 
 [self.view addSubview:infoView];
 
 */
