//
//  FXLogger.m
//  TTTT
//
//  Created by 张大宗 on 2017/2/10.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import "FXLogger.h"

@implementation FXLogger

-(void) error:(NSString*) func format:(NSString*) format, ... {
    va_list args;
    if (format) {
        va_start(args, format);
        NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
        DDLogError(@"[ERROR] %@ %@",func, message);
        va_end(args);
    }
}

-(void) warn:(NSString*) func format:(NSString*) format, ... {
    va_list args;
    if (format) {
        va_start(args, format);
        NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
        DDLogWarn(@"[WARN] %@ %@",func, message);
        va_end(args);
    }
}

-(void) info:(NSString*) func format:(NSString*) format, ... {
    va_list args;
    if (format) {
        va_start(args, format);
        NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
        DDLogInfo(@"[INFO] %@ %@",func, message);
        va_end(args);
    }
}

-(void) debug:(NSString*) func format:(NSString*) format, ... {
    va_list args;
    if (format) {
        va_start(args, format);
        NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
        DDLogDebug(@"[DEBUG] %@ %@",func, message);
        va_end(args);
    }
}

-(void) verbose:(NSString*) func format:(NSString*) format, ... {
    va_list args;
    if (format) {
        va_start(args, format);
        NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
        DDLogVerbose(@"[VERBOSE] %@ %@",func, message);
        va_end(args);
    }
}

@end
