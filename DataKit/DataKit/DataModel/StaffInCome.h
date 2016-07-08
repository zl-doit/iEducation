//
//  StaffInCome.h
// DataKit
//
//  Created by doit on 16/3/23.
//  Copyright © 2016年 ddsl. All rights reserved.
//

#import "ZLModel.h"

/**
 * 从业人员收入实体
 */
@interface StaffInCome : ZLModel

@property (nonatomic, assign) double totalIncome;
@property (nonatomic, assign) double withdrawCash;
@property (nonatomic, assign) double applyCash;
@property (nonatomic, assign) double balance;

@end
