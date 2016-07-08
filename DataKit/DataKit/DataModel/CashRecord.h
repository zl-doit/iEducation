//
//  CashRecord.h
// DataKit
//
//  Created by doit on 16/3/29.
//  Copyright © 2016年 ddsl. All rights reserved.
//

#import "ZLModel.h"

@interface CashRecord : ZLModel
/**
 * 申请ID
 */
@property (nonatomic, assign) NSInteger applyId;
/**
 * 申请用户(手机号)
 */
@property (nonatomic, strong) NSString  *applyUser;
/**
 * 申请金额
 */
@property (nonatomic, assign) double    applyCash;
/**
 * 申请来源1后台 2客户端
 */
@property (nonatomic, assign) NSInteger applyFrom;
/**
 * 申请时间
 */
@property (nonatomic, assign) NSInteger applyTime;
/**
 * 申请状态
 */
@property (nonatomic, assign) NSInteger status;

@end
