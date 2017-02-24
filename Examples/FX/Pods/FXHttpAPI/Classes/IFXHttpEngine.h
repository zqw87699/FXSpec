//
//  IFXHttpEngine.h
//  TTTT
//
//  Created by 张大宗 on 2017/2/10.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IFXHttpRequest.h"
#import "IFXHttpResponse.h"
/**
 *  回调block
 *
 *  @param res   http response
 *  @param error error
 */
typedef void(^FXHttpEngineResponseBlock)(id<IFXHttpResponse> res, NSError *error);

/**
 *  响应block
 */
typedef void(^FXHttpEngineNativeResponseBlock)(NSData* resData, NSError *error);

/**
 *  下载响应block
 *
 *  @param filePath 下载文件名
 *  @param error    错误
 */
typedef void (^FXHttpEngineDownloadResponseBlock)(NSString* filePath, NSError *error);

/**
 *  进度条
 *
 *  @param progress 进度（0.0f~1.0f）
 */
typedef void (^FXHttpEngineProgressBlock)(float progress);

@protocol IFXHttpEngine <NSObject>

/**
 *  是否在请求中
 */
- (BOOL)hasLoading;

/**
 *  异步请求
 *
 *  @param request  http request
 *  @param resClass http response Class
 *  @param resBlock response block
 */
- (void)asynRequest:(id<IFXHttpRequest>) request
      responseClass:(Class) resClass
      responseBlock:(FXHttpEngineResponseBlock) resBlock;

/**
 *  同步请求(使用dispatch_semaphore_t阻塞达到同步效果,不要在主线程调用)
 *
 *  @param request  http request
 *  @param resClass http response Class
 *  @param resBlock response block
 */
- (void)synRequest:(id<IFXHttpRequest>) request
      responseClass:(Class) resClass
      responseBlock:(FXHttpEngineResponseBlock) resBlock;

/**
 *  异步请求(上传文件)
 *
 *  @param request  http request
 *  @param resClass http response Class
 *  @param resBlock response block
 */
- (void)asynRequestUploadFiles:(id<IFXHttpRequest>) request
      responseClass:(Class) resClass
      responseBlock:(FXHttpEngineResponseBlock) resBlock;

/**
 *  同步请求(上传文件)(使用dispatch_semaphore_t阻塞达到同步效果,不要在主线程调用)
 *
 *  @param request  http request
 *  @param resClass http response Class
 *  @param resBlock response block
 */
- (void)synRequestUploadFiles:(id<IFXHttpRequest>) request
                 responseClass:(Class) resClass
                 responseBlock:(FXHttpEngineResponseBlock) resBlock;

/**
 *  异步下载
 *
 *  @param url           下载文件url
 *  @param resBlock      响应block
 *  @param progressBlock 下载进度block
 */
- (void)asynDownloadByURL:(NSString*)url
            responseBlock:(FXHttpEngineDownloadResponseBlock)resBlock
                 progress:(FXHttpEngineProgressBlock)progressBlock;

/**
 *  取消任务
 */
-(void) cancel;

@end
