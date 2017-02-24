//
//  IFXLogger.h
//  TTTT
//
//  Created by 张大宗 on 2017/2/10.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IFXLogger <NSObject>

/**
 *  error 级别日志
 */
-(void) error:(NSString*) func format:(NSString*) format, ...;

/**
 *  warn 级别日志
 */
-(void) warn:(NSString*) func format:(NSString*) format, ...;

/**
 *  info 级别日志
 */
-(void) info:(NSString*) func format:(NSString*) format, ...;

/**
 *  debug 级别日志
 */
-(void) debug:(NSString*) func format:(NSString*) format, ...;

/**
 *  verbose 级别日志
 */
-(void) verbose:(NSString*) func format:(NSString*) format, ...;

@end
