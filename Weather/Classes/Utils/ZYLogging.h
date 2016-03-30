//
//  ZYLogging.h
//  Weather
//
//  Created by staff on 16/3/30.
//  Copyright © 2016年 zyqIosTest. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>

extern DDLogLevel ddLogLevel;

#define ZYLogError(frmt, ...) DDLogError(frmt, ##__VA_ARGS__)

#if DEBUG
#define ZYLog(frmt, ...) DDLogVerbose(frmt, ##__VA_ARGS__)
#else
#define ZYLog(frmt, ...)
#endif

@interface ZYLogging : NSObject

+ (ZYLogging *)getInstance;
+ (void)setUpLogging;

@end