//
//  ZYLogging.m
//  Weather
//
//  Created by staff on 16/3/30.
//  Copyright © 2016年 zyqIosTest. All rights reserved.
//

#import "ZYLogging.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

#ifdef DEBUG
DDLogLevel ddLogLevel = DDLogLevelVerbose;
#else
DDLogLevel ddLogLevel = DDLogLevelWarning;
#endif

@implementation ZYLogging

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

+ (ZYLogging *)getInstance
{
    static ZYLogging *logging = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        logging = [[self alloc]init];
    });
    
    return logging;
}

+ (void)setUpLogging
{
    // Standard lumberjack initialization
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    // And we're going to enable colors
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    
    UIColor *errorColor = [UIColor colorWithRed:(255/255.0) green:(0/255.0) blue:(0/255.0) alpha:1.0];
    
    [[DDTTYLogger sharedInstance] setForegroundColor:errorColor backgroundColor:nil forFlag:DDLogFlagError];

}

- (void)setUp
{
    // Standard lumberjack initialization
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    // And we're going to enable colors
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    
    UIColor *errorColor = [UIColor colorWithRed:(255/255.0) green:(0/255.0) blue:(0/255.0) alpha:1.0];

    [[DDTTYLogger sharedInstance] setForegroundColor:errorColor backgroundColor:nil forFlag:DDLogFlagError];
}

@end