//
//  Teacher.h
//  ModelFundation
//
//  Created by doit on 16/6/24.
//  Copyright © 2016年 doit. All rights reserved.
//

#import "BaseDataModel.h"

@interface Teacher : BaseDataModel
@property(nonatomic,assign) int teacherId;
@property(nonatomic,assign) int gender;

@property(nonatomic,strong) NSString *teacherNo;
@property(nonatomic,strong) NSString *trueName;
@property(nonatomic,strong) NSString *phoneNo;
@property(nonatomic,strong) NSString *birthday;
@property(nonatomic,strong) NSString *genderString;
@property(nonatomic,strong) NSString *idCard;
@property(nonatomic,strong) NSString *address;
@property(nonatomic,strong) NSString *major;
@property(nonatomic,strong) NSString *school;
@property(nonatomic,strong) NSString *introduction;

@end
