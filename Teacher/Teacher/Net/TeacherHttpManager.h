//
//  TeacherHttpManager.h
//  Teacher
//
//  Created by doit on 15/12/14.
//  Copyright (c) 2015年 ddsl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebService.h"
#import "Constants.h"
#import <DataKit/HttpManager.h>

@interface TeacherHttpManager : HttpManager



//=======================================================================================
// 用户模块接口
//=======================================================================================

/**
 *登录
 */
+(void)login:(NSString* )phoneNo password:(NSString* )password resultBlock:(WSResultBlock) resultBlock;
+(void)getStationCourseList:(NSString*)teacherNo resultBlock:(WSResultBlock) resultBlock;
@end




