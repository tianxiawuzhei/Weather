//
//  UIPrecipitationRaindropView.h
//  Weather
//
//  Created by staff on 16/3/14.
//  Copyright © 2016年 zyqIosTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYUIPrecipitationRaindropView : UIView

@property (nonatomic, assign) CGFloat percent;

@property (nonatomic, weak) UIImageView* raindropImgView;
@property (nonatomic, strong) CALayer* maskLayer;

@end
