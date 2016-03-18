//
//  UIDetailInfoRightCellView.h
//  Weather
//
//  Created by staff on 16/3/11.
//  Copyright © 2016年 zyqIosTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYUIDetailInfoRightCellView : UIView

@property (nonatomic, weak) UILabel* leftLabel;
@property (nonatomic, weak) UILabel* rightLabel;

- (void)setDetailInfo:(NSString*)key andValue:(NSString*)value;

@end
