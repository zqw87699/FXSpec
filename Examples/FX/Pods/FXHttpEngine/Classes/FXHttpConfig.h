//
//  FXHttpConfig.h
//  TTTT
//
//  Created by 张大宗 on 2017/2/15.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FXSingleton.h"
#import "AFHTTPSessionManager.h"
#import "IFXHttpFilter.h"

@interface FXHttpConfig:NSObject

AS_SINGLETON(FXHttpConfig)

/*
 *  默认请求任务
 */
-(AFHTTPSessionManager*) defaultSessionManager;

/*
 *  新建任务链接
 */
-(void)createMissionSerializer;

/*
 *  过滤器
 */
-(id<IFXHttpFilter>) httpFilter;

/**
 *  设置超时时间
 *  Default：60
 */
-(void) setTimeoutDuration:(long) timeoutDuration;

/**
 *  是否允许无效证书
 *  Default：NO
 */
-(void) setAllowInvalidCertificates:(BOOL) allow;

/**
 *  最大并发数(default 5)
 */
-(void) setMaxConcurrentCount:(NSInteger) concurrentCount;

/**
 *  添加过滤器
 */
-(void) addFilter:(id<IFXHttpFilter>)filter;

/**
 *  添加证书(只可以添加cer证书)
 */
-(void) addCertificater:(NSString*) path;

@end
