//
//  TestViewModel.h
//  FX
//
//  Created by 张大宗 on 2017/2/24.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import <FXCommon/FXCommon.h>
#import "BaseFXViewModel.h"

@interface TestViewModel : BaseFXViewModel

@property (nonatomic, assign) BOOL canObserve;

- (void)request:(void(^)(BOOL success))block;

@end
