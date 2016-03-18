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

#import "UITemperatureView.h"
#import "UILabelWithLineView.h"
#import "UIDetailInfoView.h"
#import "UIPrecipitationRaindropView.h"

@interface ZYUIPageContentViewController ()

@property (nonatomic, strong) UIScrollView* scrollView;
@end

@implementation ZYUIPageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    UITemperatureView* tempertureView = [[UITemperatureView alloc]initWithFrame:CGRectMake(scrollPaddingSides, 0, SCREEN_WIDTH*0.95, SCREEN_HEIGHT)];
//    [self.scrollView addSubview:tempertureView];
    
//    UILabelWithLineView* labelWithLineView = [[UILabelWithLineView alloc]initWithFrame:CGRectMake(scrollPaddingSides, 150, SCREEN_WIDTH*0.95, 28)];
//    [self.view addSubview:labelWithLineView];
    
    UIDetailInfoView* detailInfoView = [[UIDetailInfoView alloc]initWithFrame:CGRectMake(scrollPaddingSides, 200, SCREEN_WIDTH*0.95, 500)];
    [self.scrollView addSubview:detailInfoView];
    
    
    [self testUI];
    
}

- (void)testUI
{
    UIPrecipitationRaindropView* view = [[UIPrecipitationRaindropView alloc]init];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    
    view.percent = 0.6;
    MASAttachKeys(view);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
