//
//  Task.h
// DataKit
//
//  Created by doit on 16/2/23.
//  Copyright © 2016年 ddsl. All rights reserved.
//

#import "ZLModel.h"

@interface Task : ZLModel
/**
 * 任务ID
 */
@property (nonatomic, assign) NSInteger  taskId;
/**
 * 任务编号
 */
@property (nonatomic, strong) NSString   *taskNo;
/**
 * 任务类型
 */
@property (nonatomic, assign) NSInteger  taskType;
/**
 * 服务ID
 */
@property (nonatomic, assign) NSInteger  catId;
/**
 * 服务图标
 */
@property (nonatomic, strong) NSString   *icon;
/**
 * 服务名称
 */
@property (nonatomic, strong) NSString   *catName;

/**
 * 发布者
 */
@property (nonatomic, strong) NSString   *publisher;
/**
 * 发布时间
 */
@property (nonatomic, assign) NSInteger  publishTime;
/**
 * 声音来源
 */
@property (nonatomic, strong) NSString   *sound;
/**
 * 任务费用
 */
@property (nonatomic, strong) NSString   *fee;
/**
 * 要求时间
 */
@property (nonatomic, strong) NSString   *requireTime;
/**
 * 地址
 */
@property (nonatomic, strong) NSString   *address;
/**
 * 发布者昵称
 */
@property (nonatomic, strong) NSString   *nickName;
/**
 * 任务特殊要求
 */
@property (nonatomic, strong) NSString   *taskRequire;
/**
 * 任务状态
 */
@property (nonatomic, assign) NSInteger  status;
/**
 * 服务者
 */
@property (nonatomic, strong) NSString   *receiver;
/**
 * 接受服务时间
 */
@property (nonatomic, assign) NSInteger  receiveTime;
/**
 * 任务结束时间
 */
@property (nonatomic, assign) NSInteger  overTime;
/**
 * 地区ID
 */
@property (nonatomic, assign) NSInteger  regionId;
/**
 * 地区名称
 */
@property (nonatomic, strong) NSString   *regionName;
/**
 * 任务联系电话
 */
@property (nonatomic, strong) NSString   *contactNumber;
/**
 * 用户经度
 */
@property (nonatomic, assign) double     lon;
/**
 * 用户纬度
 */
@property (nonatomic, assign) double     lat;
/**
 * 任务支付状态
 */
@property (nonatomic, assign) NSInteger  payStatus;
/**
 * 任务属性ID
 */
@property (nonatomic, assign) NSInteger  attributeId;
/**
 * 任务属性名称
 */
@property (nonatomic, strong) NSString   *attributeName;
/**
 * 任务属性数量
 */
@property (nonatomic, assign) NSInteger  attCount;
/**
 * 包月任务完成时间
 */
@property (nonatomic, assign) NSInteger  finishedTime;
/**
 *
 */
@property (nonatomic, strong) NSDictionary *attrList;
/**
 *预约订单剩余天数
 */
@property (nonatomic, assign) NSInteger leftDay;
@end
