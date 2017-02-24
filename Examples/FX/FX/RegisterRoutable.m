//
//  RegisterRoutable.m
//  FX
//
//  Created by 张大宗 on 2017/2/24.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import "RegisterRoutable.h"
#import "TestViewController.h"
#import "TViewController.h"
#import "FXURLAPI.h"

@implementation RegisterRoutable

+(void)routerURLRegister:(FXRoutable *)routable{
    
    [routable registe:FX_URL_TEST toController:[TestViewController class] withOptions:nil];
    
    [routable registe:FX_URL_T toController:[TViewController class] withOptions:nil];
}

@end
