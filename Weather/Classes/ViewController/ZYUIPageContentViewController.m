//
//  UIPageContentViewController.m
//  Weather
//
//  Created by staff on 16/3/1.
//  Copyright © 2016年 zyqIosTest. All rights reserved.
//

#import "ZYUIPageContentViewController.h"
#import "Masonry.h"
#import "MJRefresh.h"

#import "MacroDef.h"

#import "ZYUITemperatureView.h"
#import "ZYUILabelWithLineView.h"
#import "ZYUIDetailInfoView.h"
#import "ZYUIPrecipitationRaindropView.h"
#import "ZYUIPrecipitationInfoView.h"
#import "ZYUIVerticalDashLineView.h"

@interface ZYUIPageContentViewController ()

@property (nonatomic, strong) UIScrollView* scrollView;
@end

@implementation ZYUIPageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    UIImage * img = [UIImage imageNamed:@"bg"];
    
    UIImageView* imgView = [[UIImageView alloc]initWithImage:img];
    imgView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);

    imgView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imgView];
    
    self.scrollView = ({
        UIScrollView* scrollView = [[UIScrollView alloc] init];
        scrollView.backgroundColor = [UIColor grayColor];
        [self.view addSubview:scrollView];
        scrollView.frame = self.view.frame;
        
        scrollView;
    });
    
    //2.建立内容视图
    UIImageView * contentView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scrollContent.jpg"]];
    
    [self.scrollView addSubview: contentView];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, contentView.frame.size.height) ;

    NSUInteger scrollPaddingSides = 10;
    ZYUITemperatureView* tempertureView = [[ZYUITemperatureView alloc]initWithFrame:CGRectMake(scrollPaddingSides, 0, SCREEN_WIDTH*0.95, SCREEN_HEIGHT)];
//    [self.scrollView addSubview:tempertureView];
    
//    UILabelWithLineView* labelWithLineView = [[UILabelWithLineView alloc]initWithFrame:CGRectMake(scrollPaddingSides, 150, SCREEN_WIDTH*0.95, 28)];
//    [self.view addSubview:labelWithLineView];
    
    ZYUIDetailInfoView* detailInfoView = [[ZYUIDetailInfoView alloc]initWithFrame:CGRectMake(scrollPaddingSides, 200, SCREEN_WIDTH*0.95, 500)];
    [self.scrollView addSubview:detailInfoView];
    
    */
    [self testUI];
    
}

- (void)testUI
{
    NSUInteger scrollPaddingSides = 10;
    
//    ZYUIPrecipitationRaindropView* view = [[ZYUIPrecipitationRaindropView alloc]init];
//    [self.view addSubview:view];
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//    }];
//    
//    view.percent = 0.6;
//    MASAttachKeys(view);
    
    ZYUIPrecipitationInfoView* infoView = [[ZYUIPrecipitationInfoView alloc]initWithFrame:CGRectMake(scrollPaddingSides, 100, SCREEN_WIDTH*0.95, 135)];
    
//    [self.view addSubview:infoView];
    
//    ZYUIVerticalDashLineView* verLine = [[ZYUIVerticalDashLineView alloc]initWithFrame:CGRectMake(100, 100, 1, 200)];
//    ZYUIVerticalDashLineView* verLine = [[ZYUIVerticalDashLineView alloc]init];
//    [self.view addSubview:verLine];
//    [verLine mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(100);
//        make.top.mas_equalTo(100);
////        make.bottom.equalTo(self.view.mas_bottom).offset(-100);
//        make.bottom.mas_equalTo(-200);
////        make.height.mas_equalTo(100);
//    }];
    
    ZYUILabelWithLineView* title = ({
        ZYUILabelWithLineView* view = [[ZYUILabelWithLineView alloc]initWithFrame:CGRectMake(10, 100, 200, 100)];
        view.titleLabel.text = @"降水量";
        [self.view addSubview:view];
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(10);
//            make.left.mas_equalTo(10);
//            make.right.mas_equalTo(-10);
//        }];
        
        view;
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
