//
//  UIPrecipitationRaindropView.m
//  Weather
//
//  Created by staff on 16/3/14.
//  Copyright © 2016年 zyqIosTest. All rights reserved.
//

#import "ZYUIPrecipitationRaindropView.h"
#import "Masonry.h"

@implementation ZYUIPrecipitationRaindropView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeUI];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeUI];
    }
    return self;
}

- (void)initializeUI
{
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    
    UIImageView* raindropImgView = ({
        UIImageView* imgView = [[UIImageView alloc]init];
        UIImage* img = [UIImage imageNamed:@"raindrop"];
        imgView.image = img;
        [self addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        imgView;
    });
    
    self.raindropImgView = raindropImgView;
    
    CALayer* maskLayer = [CALayer layer];
    UIImage* mask = [UIImage imageNamed:@"wave2"];
    maskLayer.contents = (id)mask.CGImage;
    maskLayer.bounds = CGRectMake(0, 0, mask.size.width, mask.size.height);
//    maskLayer.frame = CGRectMake(0, 30, mask.size.width, mask.size.height);
    maskLayer.anchorPoint = CGPointMake(0.5, 0);
    self.maskLayer = maskLayer;
    
    UIImageView* raindropBlueImgView = ({
        UIImageView* imgView = [[UIImageView alloc]init];
        imgView.image = [UIImage imageNamed:@"raindrop_blue"];
        imgView.layer.mask = maskLayer;
        imgView.layer.masksToBounds = YES;
//        [imgView.layer addSublayer:maskLayer];
        [self addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        imgView;
    });
    
    maskLayer.position = CGPointMake(raindropBlueImgView.intrinsicContentSize.width*0.5, raindropBlueImgView.intrinsicContentSize.height);
    
    [self bringSubviewToFront:raindropImgView];
    
    MASAttachKeys(raindropImgView, raindropBlueImgView);
}

- (void)setPercent:(CGFloat)percent
{
    _percent = percent;
    if (percent < 0.8) {
        CALayer* maskLayer = self.maskLayer;
        UIImage* mask = [UIImage imageNamed:@"wave2"];
        maskLayer.contents = (id)mask.CGImage;
        maskLayer.bounds = CGRectMake(0, 0, mask.size.width, mask.size.height);
        
        CGFloat raindropHeight = self.raindropImgView.intrinsicContentSize.height;
        maskLayer.position = CGPointMake(maskLayer.position.x, raindropHeight - raindropHeight*percent);
    } else {
        CALayer* maskLayer = self.maskLayer;
        UIImage* mask = [UIImage imageNamed:@"wave_flat"];
        maskLayer.contents = (id)mask.CGImage;
        maskLayer.bounds = CGRectMake(0, 0, mask.size.width, mask.size.height);
        
        CGFloat raindropHeight = self.raindropImgView.intrinsicContentSize.height;
        maskLayer.position = CGPointMake(maskLayer.position.x, raindropHeight - raindropHeight*percent);
    }
    
}

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(59, 76);
}

@end
