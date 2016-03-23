//
//  ZYUIBigWindmillView.m
//  Weather
//
//  Created by staff on 16/3/23.
//  Copyright © 2016年 zyqiosexercise. All rights reserved.
//

#import "ZYUIBigWindmillView.h"
#import "POP.h"

static const CGFloat ZYUIBigWindmillViewWidth       = 63;
static const CGFloat ZYUIBigWindmillViewHeight      = 90;

@interface ZYUIBigWindmillView ()
@property (nonatomic, weak) CALayer * bladeLayer;
@end

@implementation ZYUIBigWindmillView

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
    /**
     * 风叶
     */
    CALayer *bladeLayer = ({
        CALayer *layer = [[CALayer alloc]init];
        UIImage *img = [UIImage imageNamed:@"blade_big"];
        layer.contents = (id)img.CGImage;
        layer.bounds= CGRectMake(0, 0, img.size.width, img.size.height);
        layer.anchorPoint = CGPointMake(0.5, 0.5);
        layer.position = CGPointMake(ZYUIBigWindmillViewWidth*0.5, img.size.height*0.5);
        [self.layer addSublayer:layer];
        layer;
    });
    
    self.bladeLayer = bladeLayer;
    
    /**
     * 支架
     */
    CALayer *pole = ({
        CALayer *layer = [[CALayer alloc]init];
        UIImage *img = [UIImage imageNamed:@"bigpole"];
        layer.contents = (id)img.CGImage;
        layer.bounds= CGRectMake(0, 0, img.size.width, img.size.height);
        layer.anchorPoint = CGPointMake(0.5, 1);
        layer.position = CGPointMake(ZYUIBigWindmillViewWidth*0.5, ZYUIBigWindmillViewHeight);
        [self.layer addSublayer:layer];
        layer;
    });
}

- (void)setWindSpeed:(NSInteger)windSpeed
{
    [self.bladeLayer pop_removeAllAnimations];
    [self animationWidthSpeed:windSpeed];
}

- (void)animationWidthSpeed:(NSInteger)windSpeed
{
    POPBasicAnimation *rotationAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
    rotationAnimation.fromValue = @(0);
    rotationAnimation.toValue = @(2 * M_PI);
    rotationAnimation.duration = 54 / windSpeed;
    rotationAnimation.repeatForever = YES;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.bladeLayer pop_addAnimation:rotationAnimation forKey:@"layerRotationAnimation"];
}

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(ZYUIBigWindmillViewWidth, ZYUIBigWindmillViewHeight);
}

@end
