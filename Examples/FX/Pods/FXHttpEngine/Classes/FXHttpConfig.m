//
//  FXHttpConfig.m
//  TTTT
//
//  Created by 张大宗 on 2017/2/15.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import "FXHttpConfig.h"

@interface FXHttpConfig ()

@property (nonatomic, strong) NSMutableSet *cerSet;

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@property (nonatomic, assign) int defaultTimeoutDuration;

@property (nonatomic, strong) id<IFXHttpFilter>filter;

@end

@implementation FXHttpConfig

DEF_SINGLETON_INIT(FXHttpConfig)

- (void)singleInit{
    self.cerSet = [[NSMutableSet alloc] init];
    self.defaultTimeoutDuration=60;
    self.sessionManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //默认并发数
    [[self.sessionManager operationQueue] setMaxConcurrentOperationCount:5];
    //允许无效的SSL证书
    [self.sessionManager.securityPolicy setAllowInvalidCertificates:NO];
}

-(void) setMaxConcurrentCount:(NSInteger) concurrentCount {
    if (concurrentCount > 0) {
        [[self.sessionManager operationQueue] setMaxConcurrentOperationCount:concurrentCount];
    }
}

-(void) setTimeoutDuration:(long) timeoutDuration {
    if (timeoutDuration > 0) {
        [self.sessionManager.requestSerializer setTimeoutInterval:timeoutDuration];
    }else{
        [self.sessionManager.requestSerializer setTimeoutInterval:_defaultTimeoutDuration];
    }
}

-(void) setAllowInvalidCertificates:(BOOL)allow{
    [self.sessionManager.securityPolicy setAllowInvalidCertificates:allow];
}

-(void) addFilter:(id<IFXHttpFilter>)filter{
    if (filter) {
        if ([filter conformsToProtocol:@protocol(IFXHttpFilter)]) {
            self.filter=filter;
        } else {
            NSString *reason = [NSString stringWithFormat:@"%@ 没有实现过滤器协议 IFXHttpFilter",NSStringFromClass([filter class])];
            @throw [NSException exceptionWithName:@"FXHttpEngineException" reason:reason userInfo:nil];
        }
    }
}

- (id<IFXHttpFilter>) httpFilter{
    return _filter;
}

-(void) addCertificater:(NSString*) path {
    if ([[NSFileManager defaultManager] fileExistsAtPath:path] && [[path pathExtension] isEqualToString:@"cer"]) {
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        if (data) {
            [_cerSet addObject:data];
        }
    }
    if ([_cerSet count] > 0) {
        AFSecurityPolicy *afSecurityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:_cerSet];
        [self.sessionManager setSecurityPolicy:afSecurityPolicy];
    }
}

-(AFHTTPSessionManager *)defaultSessionManager {
    return _sessionManager;
}

-(void)createMissionSerializer{
    self.sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    self.sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
}

@end
