//
//  TestViewModel.m
//  FX
//
//  Created by 张大宗 on 2017/2/24.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import "TestViewModel.h"
#import "AFFXHttpEngine.h"
#import "TestHttpAPI.h"

@interface TestViewModel()

@property (nonatomic, strong)AFFXHttpEngine *httpEngine;

@end

@implementation TestViewModel

-(instancetype)init{
    self = [super init];
    if (self) {
        self.httpEngine = [[AFFXHttpEngine alloc] init];
    }
    return self;
}

- (void)request:(void (^)(BOOL))block{
    if (![_httpEngine hasLoading]) {
        TestHttpRequest *request = [[TestHttpRequest alloc] init];
        [_httpEngine asynRequest:request responseClass:[TestHttpResponse class] responseBlock:^(id<IFXHttpResponse> res, NSError *error) {
            if (error) {
                FXLogError(@"%@",error.userInfo[NSLocalizedDescriptionKey]);
                block(NO);
            }else{
                TestHttpResponse *response = (TestHttpResponse*)res;
                FXLogDebug(@" \n \n %@ \n \n",[response data]);
                self.canObserve = YES;
                block(YES);
            }
        }];
    }
}

@end
