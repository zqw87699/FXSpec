//
//  IFXUploadFileInfo.h
//  TTTT
//
//  Created by 张大宗 on 2017/2/16.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IFXUploadFileInfo <NSObject>

/**
 *  文件名称
 */
-(NSString*)fileName;

/**
 *  文件路径
 */
-(NSString*)filePath;

/**
 *  文件内容类型
 */
-(NSString*)mimeType;

@end
