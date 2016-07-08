//
//  StaffLogin.h
// DataKit
//
//  Created by doit on 16/2/23.
//  Copyright © 2016年 ddsl. All rights reserved.
//

#import "ZLModel.h"
#import "Staff.h"
#import "Task.h"

@interface StaffLogin : ZLModel

@property (nonatomic, assign)   NSInteger onlinStaffCount;
@property (nonatomic, assign)   NSInteger taskCount;
@property (nonatomic, copy)     NSString  *token;
@property (nonatomic, strong)   NSDictionary     *staff;
@property (nonatomic, strong)   NSDictionary      *lastTask;

@end
