//
//  HttpManager.m
// CommonKit
//
//  Created by doit on 15/12/14.
//  Copyright (c) 2015年 ddsl. All rights reserved.
//

#import "TeacherHttpManager.h"
#import "Constants.h"

//实体
#import "StaffLogin.h"
#import "Notice.h"
#import "StaffInCome.h"
#import "CashRecord.h"
#import "Teacher.h"

#import "NSString+DTUtilities.h"


@implementation TeacherHttpManager

+(void)login:(NSString *)phoneNo password:(NSString *)password resultBlock:(WSResultBlock)resultBlock{
    
    //设备名+系统版本 eg:iPhone6s,IOS9.3
    NSString *clientinfo = [NSString stringWithFormat:@"%@,%@", kDeviceName, kBundleVersion];
    
    NSDictionary *parms = @{@"phoneNo":phoneNo,@"password":[password md5Checksum],@"clientinfo":clientinfo};
    [WebService startWithModuleName:HTTP_MODULE_TEACHER method:@"login" parms:parms modelClass:[Teacher class] resultIsArray:NO resultBlock:resultBlock];

}

+(void)getStationCourseList:(NSString *)teacherNo resultBlock:(WSResultBlock)resultBlock
{
    NSDictionary *parms = @{@"phoneNo":teacherNo};
    [WebService startWithModuleName:HTTP_MODULE_COURSE method:@"getStoreCourse" parms:parms modelClass:[Teacher class] resultIsArray:YES resultBlock:resultBlock];

}
@end
