//
//  Staff.h
// DataKit
//
//  Created by doit on 16/2/23.
//  Copyright © 2016年 ddsl. All rights reserved.
//

#import "ZLModel.h"

@interface Staff : ZLModel

@property (nonatomic, assign)  NSInteger catId;
@property (nonatomic, copy)    NSString  *catName;
@property (nonatomic, assign)  BOOL      enabled;
@property (nonatomic, assign)  BOOL      isFixedWork;
@property (nonatomic, assign)  double    lat;
@property (nonatomic, assign)  double    lon;
@property (nonatomic, copy)    NSString  *name;
@property (nonatomic, copy)    NSString  *phone;
@property (nonatomic, assign)  NSInteger region;
@property (nonatomic, copy)    NSString  *regionName;
@property (nonatomic, assign)  BOOL      sex;
@property (nonatomic, assign)  NSInteger staffId;
@property (nonatomic, assign)  NSInteger stationId;
@property (nonatomic, copy)    NSString  *stationName;
@property (nonatomic, assign)  NSInteger status;//1:下线；2:准备接单；3:接单中
@property (nonatomic, copy)    NSString  *token;
@property (nonatomic, assign)  NSInteger star;
@property (nonatomic, copy)    NSString  *picture;
@property (nonatomic, copy)    NSString  *remark;
@property (nonatomic, copy)    NSString  *services;//
@property (nonatomic, copy)    NSString  *attName;
@property (nonatomic, assign)  double    balance;
@property (nonatomic, assign)  NSInteger lastOnlineTime;
@property (nonatomic, assign)  NSInteger onlineDuration;
@property (nonatomic, strong)  NSDictionary *attribute;

@end
