//
//  ZYUIMainViewController.m
//  Weather
//
//  Created by staff on 16/3/18.
//  Copyright © 2016年 zyqiosexercise. All rights reserved.
//

#import "ZYUIMainViewController.h"
#import "ZYUIPageContentViewController.h"

@interface ZYUIMainViewController ()

@end

@implementation ZYUIMainViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.pageCount = 3;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create page view controller
    self.pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options: nil];
    
    self.pageViewController.dataSource = self;
    
    
    
    // Change the size of page view controller
    //    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    //
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    NSArray *subviews = self.pageViewController.view.subviews;
    UIPageControl *thisControl = nil;
    for (int i=0; i<[subviews count]; i++) {
        if ([[subviews objectAtIndex:i] isKindOfClass:[UIPageControl class]]) {
            thisControl = (UIPageControl *)[subviews objectAtIndex:i];
        }
    }
    
    thisControl.hidden = true;
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height+40);
    
    ZYUIPageContentViewController * startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    //    UIPageControl* indicate = [[UIPageControl alloc] init];
    //
    //
    //    indicate.pageIndicatorTintColor = [UIColor lightGrayColor];
    //    indicate.currentPageIndicatorTintColor = [UIColor whiteColor];
    //
    //    indicate.backgroundColor = [UIColor clearColor];
    //    [self.view addSubview: indicate];
    //
    //    [indicate mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.centerX.equalTo(self.view.mas_centerX);
    //        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    //    }];
    //
    //    indicate.numberOfPages = self.pageCount;
    //    [self.view bringSubviewToFront:indicate];
    //    self.indicate = indicate;
    //
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.view bringSubviewToFront:self.indicate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIPageViewControllerDataSource
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = ((ZYUIPageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    self.pageIndex = index;
    return [self viewControllerAtIndex:index];
    
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = ((ZYUIPageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == self.pageCount) {
        return nil;
    }
    
    self.pageIndex = index;
    return [self viewControllerAtIndex:index];
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return self.pageCount;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return self.pageIndex;
}

- (ZYUIPageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if ((self.pageCount == 0) || (index >= self.pageCount)) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    ZYUIPageContentViewController *pageContentViewController = [[ZYUIPageContentViewController alloc]init];
    //    pageContentViewController.imageFile = self.pageImages[index];
    //    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

@end
