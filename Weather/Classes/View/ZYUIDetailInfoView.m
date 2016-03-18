//
//  UIDetailInfoView.m
//  Weather
//
//  Created by staff on 16/3/11.
//  Copyright © 2016年 zyqIosTest. All rights reserved.
//

#import "ZYUIDetailInfoView.h"
#import "Masonry.h"
#import "ZYUILabelWithLineView.h"
#import "ZYUIDetailInfoRightCellView.h"

@implementation ZYUIDetailInfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    
    return self;
}

- (void)initialize
{
    self.layer.cornerRadius = 3;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5f];
    
    ZYUILabelWithLineView* titleView = ({
        ZYUILabelWithLineView* titleView = [[ZYUILabelWithLineView alloc]init];
        [titleView setTitleText:@"详细信息"];
        [self addSubview:titleView];
        [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.top.mas_equalTo(5);
        }];
        
        titleView;
    });
    
    UIImageView* leftImgView = ({
        UIImageView* imgView = [[UIImageView alloc]init];
        [self addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX).dividedBy(2);
            make.centerY.equalTo(self.mas_centerY);
        }];
        
        imgView;
    });
    
    static const int32_t paddingRight = -2;
    
    ZYUIDetailInfoRightCellView* feltTemp = ({
        ZYUIDetailInfoRightCellView* cellView = [[ZYUIDetailInfoRightCellView alloc]init];
        [self addSubview:cellView];
        [cellView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleView.mas_bottom).offset(5);
            make.right.mas_equalTo(paddingRight);
        }];
        
        cellView;
    });
    
    ZYUIDetailInfoRightCellView* humidity = ({
        ZYUIDetailInfoRightCellView* cellView = [[ZYUIDetailInfoRightCellView alloc]init];
        [self addSubview:cellView];
        [cellView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(feltTemp.mas_bottom).offset(5);
            make.right.mas_equalTo(paddingRight);
        }];
        
        cellView;
    });
    
    ZYUIDetailInfoRightCellView* visibility = ({
        ZYUIDetailInfoRightCellView* cellView = [[ZYUIDetailInfoRightCellView alloc]init];
        [self addSubview:cellView];
        [cellView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(humidity.mas_bottom).offset(5);
            make.right.mas_equalTo(paddingRight);
        }];
        
        cellView;
    });
    
    ZYUIDetailInfoRightCellView* indiceUV = ({
        ZYUIDetailInfoRightCellView* cellView = [[ZYUIDetailInfoRightCellView alloc]init];
        [self addSubview:cellView];
        [cellView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(visibility.mas_bottom).offset(5);
            make.right.mas_equalTo(paddingRight);
        }];
        
        cellView;
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
