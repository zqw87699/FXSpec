//
//  AFFXHttpEngine.h
//  TTTT
//
//  Created by 张大宗 on 2017/2/10.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IFXHttpEngine.h"
#import "FXLogMacros.h"

@interface AFFXHttpEngine : NSObject<IFXHttpEngine>

@property (nonatomic, copy) FXHttpEngineResponseBlock resBlock;
@property (nonatomic, copy) FXHttpEngineNativeResponseBlock nativeResBlock;

@property (nonatomic, copy) FXHttpEngineDownloadResponseBlock downloadResBlock;
@property (nonatomic, copy) FXHttpEngineProgressBlock progressBlock;

@property (atomic, assign) BOOL loading;//是否在加载中

@end
