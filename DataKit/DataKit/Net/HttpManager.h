//
//  HttpManager.h
// DataKit
//
//  Created by doit on 15/12/14.
//  Copyright (c) 2015年 ddsl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebService.h"

@interface HttpManager : NSObject



//=======================================================================================
// 共用模块接口
//=======================================================================================


/**
 * 获取公告
 */
+(void)getNotice:(WSResultBlock)resultBlock;


/**
 *更新客服电话
 *
 */
+(void)updateCustomerServicePhonenum:(WSResultBlock)resultBlock;

@end




