//
//  IFXHttpFilter.h
//  TTTT
//
//  Created by 张大宗 on 2017/2/15.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol IFXHttpResponse;

@protocol IFXHttpFilter <NSObject>

/**
 *  HTTP 响应结果过滤器
 *
 *  @param res 响应结果
 *
 *  @return YES:返回数据  NO:拦截数据
 */
-(BOOL) doFilter:(id<IFXHttpResponse>) res;

@end
