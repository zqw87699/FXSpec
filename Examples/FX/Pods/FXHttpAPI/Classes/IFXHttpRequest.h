//
//  IFXHttpRequest.h
//  TTTT
//
//  Created by 张大宗 on 2017/2/10.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HTTP_METHOD_GET         @"GET"
#define HTTP_METHOD_POST        @"POST"
#define HTTP_METHOD_PUT         @"PUT"
#define HTTP_METHOD_DELETE      @"DELETE"

/**
 *  HTTP 请求接口
 */
@protocol IFXHttpRequest <NSObject>

/**
 *  HTTP请求URL
 */
-(NSString*) getURL;

/**
 *  验证参数
 */
-(BOOL) validateParams;

/**
 *  HTTP Headers
 */
-(NSDictionary*) getHeaders;

/**
 *  HTTP Params
 */
-(NSDictionary*) getParams;

/**
 *  HTTP Method
 */
-(NSString*) getMethod;

/**
 *  HTTP 请求超时时间
 *
 *  @return 秒数
 */
-(long) getTimeoutDuration;

/**
 *  上传文件列表
 *
 *  @return 文件列表 key：name value：filePath    OR  key:name value:IFXUploadFileInfo
 */
-(NSDictionary*) getUploadFiles;

@end

