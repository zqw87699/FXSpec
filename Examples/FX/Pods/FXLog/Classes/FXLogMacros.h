//
//  FXLogMacros.h
//  TTTT
//
//  Created by 张大宗 on 2017/2/10.
//  Copyright © 2017年 张大宗. All rights reserved.
//

/**
 * 日志入口
 * error > warn > info > debug > verbose
 */

#import "IFXLogger.h"
#import "FXLogFactory.h"

#define FXLogError(frmt, ...) \
[[FXLogFactory getLogger] error:[NSString stringWithFormat:@"%s line:%d",__func__,__LINE__] format:frmt, ##__VA_ARGS__]

#define FXLogWarn(frmt, ...) \
[[FXLogFactory getLogger] warn:[NSString stringWithFormat:@"%s line:%d",__func__,__LINE__] format:frmt, ##__VA_ARGS__]

#define FXLogInfo(frmt, ...) \
[[FXLogFactory getLogger] info:[NSString stringWithFormat:@"%s line:%d",__func__,__LINE__] format:frmt, ##__VA_ARGS__]

#define FXLogDebug(frmt, ...) \
[[FXLogFactory getLogger] debug:[NSString stringWithFormat:@"%s line:%d",__func__,__LINE__] format:frmt, ##__VA_ARGS__]

#define FXLogVerbose(frmt, ...) \
[[FXLogFactory getLogger] verbose:[NSString stringWithFormat:@"%s line:%d",__func__,__LINE__] format:frmt, ##__VA_ARGS__]
