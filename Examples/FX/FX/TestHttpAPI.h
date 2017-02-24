//
//  TestHttpAPI.h
//  FX
//
//  Created by 张大宗 on 2017/2/24.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import <FXCommon/FXCommon.h>
#import "BaseFXHttpRequest.h"
#import "BaseFXHttpResponse.h"
#import "TestData.h"

@interface TestHttpRequest : BaseFXHttpRequest

@end

@interface TestHttpResponse : BaseFXHttpResponse

@property (nonatomic, strong)TestData*data;

@end
