//
//  IFXHttpResponse.h
//  TTTT
//
//  Created by 张大宗 on 2017/2/10.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  HTTP 响应接口
 */
@protocol IFXHttpResponse <NSObject>

/**
 *  解析响应结果
 *
 *  @param responseData 返回Data
 *
 *  @return 响应对象
 */
+(id<IFXHttpResponse>) parseResult:(NSData*) responseData;

@optional
/**
 *  是否存在逻辑错误
 */
-(BOOL) isError;

/**
 *  服务端返回的逻辑错误码
 */
-(NSString*) errorCode;

/**
 *  服务端返回的逻辑错误说明
 */
-(NSString*) errorMsg;

@end
