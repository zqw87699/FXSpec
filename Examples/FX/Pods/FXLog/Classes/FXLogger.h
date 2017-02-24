//
//  FXLogger.h
//  TTTT
//
//  Created by 张大宗 on 2017/2/10.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IFXLogger.h"
#import "CocoaLumberjack.h"

/**
 *  日志记录器
 *  使用方法
 *  1、声明静态变量 ddLogLevel
 *  #ifdef DEBUG
 *       static const DDLogLevel ddLogLevel = DDLogLevelInfo;
 *   #else
 *       static const DDLogLevel ddLogLevel = DDLogLevelError;
 *   #endif
 */

#ifdef DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelAll;
#else
static const DDLogLevel ddLogLevel = DDLogLevelError;
#endif

@interface FXLogger : NSObject<IFXLogger>

@end
