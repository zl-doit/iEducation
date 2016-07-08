//
//  Enums.h
// DataKit
//
//  Created by doit on 16/3/8.
//  Copyright © 2016年 ddsl. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 新订单类型
 */
typedef NS_ENUM(NSInteger, TaskType) {
    /**
     * 及时订单
     */
    TaskTypeRealTime=1,
    /**
     * 实时订单
     */
    TaskTypeBook = 2,
    /**
     * 指派订单
     */
    TaskTypeP2P = 4
};

/**
 * 订单状态
 */
typedef NS_ENUM(NSInteger, OrderStatus) {
    /**
     * 已发布
     */
    OrderStatusPublish      = 1,
    /**
     * 已接受
     */
    OrderStatusReceive      = 2,
    /**
     * 服务中
     */
    OrderStatusWorking      = 4,
    /**
     * 已完成
     */
    OrderStatusFinish       = 8,
    /**
     * 服务人员消单
     */
    OrderStatusStaffCancel  = 16,
    /**
     * 客户端消单
     */
    OrderStatusClientCancel = 32,
    /**
     * 订单超时
     */
    OrderStatusTimeOut      = 64,
    /**
     * 客户端删除
     */
    OrderStatusClientDelete = -1,
    /**
     * 其他状态
     */
    OrderStatusOther        = -1024
    
};

/**
 * 从业人员状态
 */
typedef NS_ENUM(NSInteger, StaffStatus){
    /**
     * 离线
     */
    StaffStatusOff=1,
    /**
     * 在线
     */
    StaffStatusOn=2,
    /**
     * 服务中
     */
    StaffStatusWork=4
};

/**
 * 任务状态
 */
typedef NS_ENUM(NSInteger, TaskStatus){
    /**
     * 全部
     */
    TaskStatusAll = 0,
    /**
     * 已发布
     */
    TaskStatusPublish=1,
    /**
     * 已接单
     */
    TaskStatusReceive = 2,
    /**
     * 服务中
     */
    TaskStatusDistribution = 4,
    /**
     * 完成
     */
    TaskStatusFinish = 8,
    /**
     * 服务人员取消
     */
    TaskStatusStaffCancel = 16,
    /**
     * 用户取消
     */
    TaskStatusClientCancel = 32,
    /**
     * 用户取消已退款
     */
    TaskStatusClientCancelRefund = 64,
    /**
     * 超时
     */
    TaskStatusTimeOut = 128,
    /**
     * 用户客户端删除
     */
    TaskStatusClientDelete = -1,
    /**
     * 其他
     */
    TaskStatusOthers = -1024
};

/**
 * 提现状态
 */
typedef NS_ENUM(NSUInteger, CashStatus){
    /**
     * 申请
     */
    CashStatusApply=1,
    /**
     * 正在审核
     */
    CashStatusAudit=2,
    /**
     * 提现成功
     */
    CashStatusSuccess=4,
    /**
     * 提现失败
     */
    CashStatusFail=8,
};
