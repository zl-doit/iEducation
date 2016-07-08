//
//  WebService.h
//  xhz
//
//  Created by doit on 15/4/15.
//  Copyright (c) 2015年 doit. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "NSError+Message.h"
//#import "NSString+Utils.h"
#import "HttpRequestModel.h"
#import "HttpResponseModel.h"
//AFNetworking 3.0+
#import "AFNetworking.h"

//#define IS_DEBUG YES//测试版
#ifndef EDU_DEBUG
#define EDU_DEBUG 1
#endif
#if EDU_DEBUG
#define HOST_URL @"http://139.129.194.164:8086/request"
#else
#define HOST_URL  @"http://service.dudusulian.com/request"
#endif

#define SYSTEM_CRPTY_KEY @"edu_system"

//
typedef void(^WSResultBlock) (id result, BOOL success, HttpResponseError *error);
//
typedef void(^WSCompleteHandlerBlock) (HttpResponseModel *responseModel, BOOL success, NSError *error);

@interface WebService : NSObject

/** 针对系统协议实现的网络统一请求方法(不含文件上传)
 * @param module 模块名称
 * @param method 调用方法名称
 * @param parms 调用方法参数
 * @param modelClass 响应实体类
 * @param resultIsArray 响应结果是否为实体数组
 * @param resultBlock 返回回调Block
 */
+(void)startWithModuleName:(NSString *)module method:(NSString *)method parms:(NSDictionary *)parms modelClass:(Class)modelClass resultIsArray:(BOOL)resultIsArray resultBlock:(WSResultBlock)resultBlock;

/** 针对系统协议实现的网络统一请求方法(含文件上传)
 * @param module 模块名称
 * @param method 调用方法名称
 * @param parms 调用方法参数
 * @param fileUrl 上传文件地址
 * @param modelClass 响应实体类
 * @param resultIsArray 响应结果是否为实体数组
 * @param resultBlock 返回回调Block
 */
+(void)startWithModuleNameAndFile:(NSString *)module method:(NSString *)method parms:(NSDictionary *)parms fileName:(NSString *)fileName modelClass:(Class)modelClass resultIsArray:(BOOL)resultIsArray resultBlock:(WSResultBlock)resultBlock;

@end
