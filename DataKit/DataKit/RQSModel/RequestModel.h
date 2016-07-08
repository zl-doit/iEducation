//
//  RequestModel.h
//  Mother-Service-Station
//
//  Created by doit on 15/6/23.
//  Copyright (c) 2015年 ddsl-doit. All rights reserved.
//

#import "ZLModel.h"

/*
 public class RequestParameter
 {
 /// <summary>
 /// 参数名称
 /// </summary>
 public string Key { set; get; }
 /// <summary>
 /// 参数值
 /// </summary>
 public object Value { set; get; }
 }
 */


@interface RequestModel : ZLModel
/*
 /// <summary>
 /// 会话Key
 /// </summary>
 public string Token { set; get; }
 /// <summary>
 /// RequestHandler类型名称
 /// </summary>
 public string TypeName { set; get; }
 /// <summary>
 /// 调用RequestHandler中的方法名称
 /// </summary>
 public string Method { set; get; }
 
 /// <summary>
 /// 调用RequestHandler中的方法所需要的参数集
 /// </summary>
 public RequestParameter[] Parms { set; get; }
 /// <summary>
 /// 请求结果格式:json或xml,默认为json
 /// </summary>
 public string Foramt { set; get; }
 */

@property (nonatomic,strong)NSString *module,*method,*os,*uid,*platform,*token;
@property (nonatomic,strong)NSDictionary  *parms;
@property (assign,nonatomic)NSNumber *version;
@end

/********************
 *****好nx的分割线*****
 *********************/
@interface LoginRqModel : NSObject
@property (nonatomic, strong)NSString   *userId,*password;
@end
