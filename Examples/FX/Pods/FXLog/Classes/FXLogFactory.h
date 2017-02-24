//
//  FXLogFactory.h
//  TTTT
//
//  Created by 张大宗 on 2017/2/10.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IFXLogger.h"

@interface FXLogFactory : NSObject

/**
 *  得到日志记录器
 */
+(id<IFXLogger>) getLogger;

/*
 *  初始化
 */
+(void)initLog;

@end
