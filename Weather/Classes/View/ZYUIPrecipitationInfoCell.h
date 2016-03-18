//
//  UIPrecipitationInfoCell.h
//  Weather
//
//  Created by staff on 16/3/14.
//  Copyright © 2016年 zyqIosTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYUIPrecipitationInfoCell : UIView

@property (nonatomic, weak) UILabel* titleLabel;
@property (nonatomic, weak) UILabel* percentLabel;
@property (nonatomic, weak) UIImageView* iconImgView;

- (void)setPrecipitation:(NSString*)time andPercent:(NSInteger)percent;

@end
