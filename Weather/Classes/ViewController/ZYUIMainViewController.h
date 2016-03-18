//
//  ZYUIMainViewController.h
//  Weather
//
//  Created by staff on 16/3/18.
//  Copyright © 2016年 zyqiosexercise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYUIMainViewController : UIViewController <UIPageViewControllerDataSource>

@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, assign) NSUInteger pageCount;
@property (nonatomic, assign) NSUInteger pageIndex;

@property (nonatomic, strong) UIPageControl* indicate;

@end
