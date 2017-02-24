//
//  FXLogFactory.m
//  TTTT
//
//  Created by 张大宗 on 2017/2/10.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import "FXLogFactory.h"
#import "CocoaLumberjack.h"

/**
 *  日志记录器工厂
 */
@implementation FXLogFactory

static id<IFXLogger> logger = nil;

+(id<IFXLogger>) getLogger {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        Class clazz = NSClassFromString(@"FXLogger");
        if (clazz) {
            if ([clazz conformsToProtocol:@protocol(IFXLogger)]) {
                [self initLog];
                logger = [[clazz alloc] init];
            } else {
                NSString *reason = [NSString stringWithFormat:@"无法创建Logger,因为 FXLogger 没有实现协议IFXLogger"];
                @throw [NSException exceptionWithName:@"FXLoggerFactoryException" reason:reason userInfo:@{@"FXLoggerClassName":@"FXLogger"}];
            }
        }
    });
    return logger;
}

+(void)initLog{
#ifdef DEBUG
    [DDLog addLogger:[DDTTYLogger sharedInstance] withLevel:DDLogLevelAll];
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
#else
    [DDLog addLogger:[DDTTYLogger sharedInstance] withLevel:DDLogLevelError];
#endif
}

@end
