//
//  TestHttpAPI.m
//  FX
//
//  Created by 张大宗 on 2017/2/24.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import "TestHttpAPI.h"

@implementation TestHttpRequest

- (NSString*)getURL{
    return @"http://ip.taobao.com/service/getIpInfo.php?";
}

- (NSString*)getMethod{
    return HTTP_METHOD_POST;
}

- (NSDictionary*)getParams{
    return @{@"ip":@"63.223.108.42"};
}

@end

@implementation TestHttpResponse

+(id<IFXHttpResponse>)parseResult:(NSData*)responseData {
    TestHttpResponse *res = nil;
#ifdef DEBUG
    NSString *resString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    FXLogDebug(@"response:%@",resString);
#endif
    @try {
        res = [FXJsonUtiles fromJsonData:responseData class:[TestHttpResponse class]];
    } @catch (NSException *exception) {
        res = [[TestHttpResponse alloc] init];
    }
    return res;
}


@end
