//
//  AFFXHttpEngine.m
//  TTTT
//
//  Created by 张大宗 on 2017/2/10.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import "AFFXHttpEngine.h"
#import "FXHttpConfig.h"
#import "AFHTTPSessionManager.h"
#import "IFXUploadFileInfo.h"
#import "FXCommon.h"
#import "IFXHttpFilter.h"
#import "ReactiveObjC.h"

@interface AFFXHttpEngine ()

@property (nonatomic) dispatch_semaphore_t sem;

@property (nonatomic, weak) NSURLSessionTask *sessionTask;

@property (nonatomic, strong) RACCommand*command;

@property (nonatomic, strong) id<RACSubscriber>  _Nonnull subscriber;

@end

@implementation AFFXHttpEngine

-(instancetype)init {
    self = [super init];
    if (self) {
        if (_sem == NULL) {
            self.sem = dispatch_semaphore_create(1);
        }
    }
    return self;
}

#pragma mark IFXHttpEngine
-(BOOL)hasLoading {
    return self.loading;
}

-(void)fxRequestUploadFiles:(id<IFXHttpRequest>)request responseClass:(Class)resClass responseBlock:(FXHttpEngineResponseBlock)resBlock Asyn:(BOOL)asyn{
    if (request && [[request getUploadFiles] count]>0 && resClass != Nil && [resClass conformsToProtocol:@protocol(IFXHttpResponse)] && [request validateParams] && ![self hasLoading]) {
        FXLogDebug(@"HTTP validateParams SUCCESS");
        //检查网络
        
        NSString *url = [request getURL];
        NSDictionary *params = [request getParams];
        NSDictionary *headers = [request getHeaders];
        NSDictionary *uploadFiles = [request getUploadFiles];
        
        AFHTTPSessionManager *manager = [[FXHttpConfig sharedInstance] defaultSessionManager];
        [[FXHttpConfig sharedInstance] createMissionSerializer];
        [[FXHttpConfig sharedInstance] setTimeoutDuration:[request getTimeoutDuration]];
        if ([headers count] > 0) {
            FXLogDebug(@"HTTP Headers:%@",headers);
            NSArray *keys = [headers allKeys];
            for (NSString *key in keys) {
                if ([[headers objectForKey:key] isKindOfClass:[NSString class]]) {
                    [manager.requestSerializer setValue:headers[key] forHTTPHeaderField:key];
                }
            }
        }
        
        self.resBlock = resBlock;
        self.loading = YES;
        FXLogDebug(@"HTTP url:%@ \n Params:%@",url,params);
        
        self.command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            RACSignal*signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                self.subscriber=subscriber;
                self.sessionTask =  [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                    NSArray *allKeys = [uploadFiles allKeys];
                    for (NSString *key in allKeys) {
                        id val = uploadFiles[key];
                        if ([val conformsToProtocol:@protocol(IFXUploadFileInfo)]) {
                            id<IFXUploadFileInfo> fileInfo = (id<IFXUploadFileInfo>)val;
                            NSString *fileName = [fileInfo fileName];
                            NSString *filePath = [fileInfo filePath];
                            NSString *miniType = [fileInfo mimeType];
                            if ([FXFileUtiles existFile:filePath]) {
                                [formData appendPartWithFileData:[NSData dataWithContentsOfFile:filePath] name:key fileName:fileName mimeType:miniType];
                            }
                        } else if ([val isKindOfClass:[NSString class]]) {
                            NSString *filePath = (NSString*)val;
                            if ([FXFileUtiles existFile:filePath]) {
                                [formData appendPartWithFormData:[NSData dataWithContentsOfFile:filePath] name:key];
                            }
                        }
                    }
                } progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    [subscriber sendNext:responseObject];
                    [subscriber sendCompleted];
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    [subscriber sendError:error];
                }];
                return nil;
            }];
            return signal;
        }];
        
        if (asyn) {
            [self asynExecute:1 responseClass:resClass];
        }else{
            [self synExecute:1 responseClass:resClass];
        }
    }else{
        FXLogError(@"HTTP validateParams Fail");
        if (resBlock != NULL) {
            NSError *error = [NSError errorWithDomain:@"AFFXHttpEngineDomain" code:-1 userInfo:[NSDictionary dictionaryWithObject:@"不符合请求条件" forKey:NSLocalizedDescriptionKey]];
            resBlock(nil, error);
        }
    }
}

/**
 *  异步调用
 */
-(void)fxRequest:(id<IFXHttpRequest>)request responseClass:(Class)resClass responseBlock:(FXHttpEngineResponseBlock)resBlock Asyn:(BOOL)asyn{
    if (request && resClass != Nil && [resClass conformsToProtocol:@protocol(IFXHttpResponse)] && [request validateParams] && ![self hasLoading]) {
        FXLogDebug(@"HTTP validateParams SUCCESS");
        if ([[request getUploadFiles] count]>0) {
            [self asynRequestUploadFiles:request responseClass:resClass responseBlock:resBlock];
            return;
        }
        //检查网络
        
        NSString *method = [[request getMethod] uppercaseString];
        NSString *url = [request getURL];
        NSDictionary *params = [request getParams];
        NSDictionary *headers = [request getHeaders];
        
        AFHTTPSessionManager *manager = [[FXHttpConfig sharedInstance] defaultSessionManager];
        [[FXHttpConfig sharedInstance] createMissionSerializer];
        [[FXHttpConfig sharedInstance] setTimeoutDuration:[request getTimeoutDuration]];
        if ([headers count] > 0) {
            FXLogDebug(@"HTTP Headers:%@",headers);
            NSArray *keys = [headers allKeys];
            for (NSString *key in keys) {
                if ([[headers objectForKey:key] isKindOfClass:[NSString class]]) {
                    [manager.requestSerializer setValue:headers[key] forHTTPHeaderField:key];
                }
            }
        }
        
        if (FX_STRING_EQUAL(method,HTTP_METHOD_GET)) {
            self.resBlock = resBlock;
            self.loading = YES;
            FXLogDebug(@"HTTP GET url:%@ \n params:%@",url,params);
            self.command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
                RACSignal*signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                    self.subscriber=subscriber;
                    self.sessionTask = [manager GET:url parameters:params progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                        [subscriber sendNext:responseObject];
                        [subscriber sendCompleted];
                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                        [subscriber sendError:error];
                    }];
                    return nil;
                }];
                return signal;
            }];
            if (asyn) {
                [self asynExecute:1 responseClass:resClass];
            }else{
                [self synExecute:1 responseClass:resClass];
            }
        }else if (FX_STRING_EQUAL(method, HTTP_METHOD_POST)){
            self.resBlock = resBlock;
            self.loading = YES;
            FXLogDebug(@"HTTP POST url:%@ \n params:%@",url,params);
            self.command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
                RACSignal*signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                    self.subscriber=subscriber;
                    self.sessionTask = [manager POST:url parameters:params progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                        [subscriber sendNext:responseObject];
                        [subscriber sendCompleted];
                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                        [subscriber sendError:error];
                    }];
                    return nil;
                }];
                return signal;
            }];
            if (asyn) {
                [self asynExecute:1 responseClass:resClass];
            }else{
                [self synExecute:1 responseClass:resClass];
            }
        }else{
            FXLogError(@"暂时不支持%@请求",method);
            NSError *error = [NSError errorWithDomain:@"AFFXHttpEngineDomain" code:-1 userInfo:[NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"暂不支持此方法'%@'请求",method] forKey:NSLocalizedDescriptionKey]];
            resBlock(nil, error);
        }
    }else{
        FXLogError(@"HTTP validateParams Fail");
        if (resBlock != NULL) {
            NSError *error = [NSError errorWithDomain:@"AFFXHttpEngineDomain" code:-1 userInfo:[NSDictionary dictionaryWithObject:@"不符合请求条件" forKey:NSLocalizedDescriptionKey]];
            resBlock(nil, error);
        }
    }
}

-(void)asynDownloadByURL:(NSString *)url responseBlock:(FXHttpEngineDownloadResponseBlock)resBlock progress:(FXHttpEngineProgressBlock)progressBlock {
    
    if (FX_STRING_IS_EMPTY(url)) {
        NSError *error = [NSError errorWithDomain:@"AFFXHttpEngineDomain" code:-1 userInfo:[NSDictionary dictionaryWithObject:@"不符合请求条件" forKey:NSLocalizedDescriptionKey]];
        resBlock(nil, error);
        return;
    }
    if ([self hasLoading]) {
        NSError *error = [NSError errorWithDomain:@"AFFXHttpEngineDomain" code:-1 userInfo:[NSDictionary dictionaryWithObject:@"网络忙~" forKey:NSLocalizedDescriptionKey]];
        resBlock(nil, error);
        return;
    }
    self.loading = YES;
    self.progressBlock = progressBlock;
    self.downloadResBlock = resBlock;
    FX_WEAK_REF_TYPE selfObject=self;
    AFHTTPSessionManager *manager = [[FXHttpConfig sharedInstance] defaultSessionManager];
    NSURL *fileURL = [NSURL URLWithString:url];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:fileURL];
    self.sessionTask = [manager downloadTaskWithRequest:urlRequest progress:^(NSProgress * _Nonnull downloadProgress) {
        if (selfObject.progressBlock != NULL) {
            selfObject.progressBlock([downloadProgress fractionCompleted]);
        }
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        NSURL *filePath = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:[response suggestedFilename]]];
        [[NSFileManager defaultManager] removeItemAtURL:filePath error:NULL];
        return filePath;
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if (selfObject.downloadResBlock != NULL) {
            if (error) {
                selfObject.downloadResBlock(nil, error);
            } else {
                selfObject.downloadResBlock(filePath.path, error);
            }
        }
        selfObject.downloadResBlock = NULL;
        selfObject.progressBlock = NULL;
        selfObject.loading = NO;
    }];
    [self.sessionTask resume];
}

/*
 *  同步请求
 */
- (void)synExecute:(int)frequency responseClass:(Class)resClass{
    FX_WEAK_REF_TYPE selfObject=self;
    RACSignal *signal = [self.command execute:@(frequency)];
    [[[signal map:^id _Nullable(id  _Nullable value) {
        id<IFXHttpResponse> response = [resClass parseResult:value];
        return response;
    }] filter:^BOOL(id  _Nullable value) {
        FXLogDebug(@"HTTP Response Filter~");
        selfObject.loading = NO;
        if ([value conformsToProtocol:@protocol(IFXHttpResponse)]) {
            if ([[FXHttpConfig sharedInstance] httpFilter]) {
                return [[[FXHttpConfig sharedInstance] httpFilter] doFilter:value];
            }
        }
        return YES;
    }] subscribeNext:^(id  _Nullable x) {
        FXLogDebug(@"HTTP Response SUCCESS~");
        if (selfObject.resBlock != NULL) {
            selfObject.resBlock(x,nil);
            selfObject.resBlock = NULL;
        }
        dispatch_semaphore_signal(_sem);
    }];
    
    [signal subscribeError:^(NSError * _Nullable error) {
        FXLogDebug(@"HTTP Response Error:%@",error);
        selfObject.loading = NO;
        if (selfObject.resBlock != NULL) {
            selfObject.resBlock(nil,error);
            selfObject.resBlock = NULL;
        }
        dispatch_semaphore_signal(_sem);
    }];
    
    dispatch_semaphore_wait(_sem, DISPATCH_TIME_FOREVER);
}

/**
 *  异步请求
 */
- (void)asynExecute:(int)frequency responseClass:(Class)resClass{
    FX_WEAK_REF_TYPE selfObject=self;
    RACSignal *signal = [self.command execute:@(frequency)];
    [[[signal map:^id _Nullable(id  _Nullable value) {
        id<IFXHttpResponse> response = [resClass parseResult:value];
        return response;
    }] filter:^BOOL(id  _Nullable value) {
        FXLogDebug(@"HTTP Response Filter~");
        selfObject.loading = NO;
        if ([value conformsToProtocol:@protocol(IFXHttpResponse)]) {
            if ([[FXHttpConfig sharedInstance] httpFilter]) {
                return [[[FXHttpConfig sharedInstance] httpFilter] doFilter:value];
            }
        }
        return YES;
    }] subscribeNext:^(id  _Nullable x) {
        FXLogDebug(@"HTTP Response SUCCESS~");
        if (selfObject.resBlock != NULL) {
            selfObject.resBlock(x,nil);
            selfObject.resBlock = NULL;
        }
    }];
    
    [signal subscribeError:^(NSError * _Nullable error) {
        FXLogDebug(@"HTTP Response Error:%@",error);
        selfObject.loading = NO;
        if (selfObject.resBlock != NULL) {
            selfObject.resBlock(nil,error);
            selfObject.resBlock = NULL;
        }
    }];
}

-(void)asynRequestUploadFiles:(id<IFXHttpRequest>)request responseClass:(Class)resClass responseBlock:(FXHttpEngineResponseBlock)resBlock{
    FXLogDebug(@"HTTP Asyn Request");
    [self fxRequestUploadFiles:request responseClass:resClass responseBlock:resBlock Asyn:YES];
}

-(void)synRequestUploadFiles:(id<IFXHttpRequest>)request responseClass:(Class)resClass responseBlock:(FXHttpEngineResponseBlock)resBlock{
    FXLogDebug(@"HTTP Syn Request");
    [self fxRequestUploadFiles:request responseClass:resClass responseBlock:resBlock Asyn:NO];
}

-(void)asynRequest:(id<IFXHttpRequest>)request responseClass:(Class)resClass responseBlock:(FXHttpEngineResponseBlock)resBlock{
    FXLogDebug(@"HTTP Asyn Request");
    [self fxRequest:request responseClass:resClass responseBlock:resBlock Asyn:YES];
}

-(void)synRequest:(id<IFXHttpRequest>)request responseClass:(Class)resClass responseBlock:(FXHttpEngineResponseBlock)resBlock{
    FXLogDebug(@"HTTP Syn Request");
    [self fxRequest:request responseClass:resClass responseBlock:resBlock Asyn:NO];
}

/*
 *  取消请求
 */
-(void)cancel {
    if (_sessionTask && [self hasLoading]) {
        [_sessionTask cancel];
    }
    [self.subscriber sendCompleted];
}

@end
