//
//  HttpManager.m
// DataKit
//
//  Created by doit on 15/12/14.
//  Copyright (c) 2015年 ddsl. All rights reserved.
//

#import "HttpManager.h"
#import "Constants.h"

//实体
#import "StaffLogin.h"
#import "Notice.h"
#import "StaffInCome.h"
#import "CashRecord.h"

#import "NSString+DTUtilities.h"


@implementation HttpManager


+(void)getNotice:(WSResultBlock)resultBlock{
    NSDictionary *parms = @{@"platform":[NSNumber numberWithInt:SYSTEM_PLATFORM_VALUE]};
    
    [WebService startWithModuleName:HTTP_MODULE_APP method:@"getNotice" parms:parms modelClass:[Notice class] resultIsArray:YES resultBlock:resultBlock];
    NSLog(@"%@", parms);
}

+(void)updateCustomerServicePhonenum:(WSResultBlock)resultBlock
{
    NSDictionary *parms = @{@"platform":@64};
    [WebService startWithModuleName:HTTP_MODULE_APP method:@"getSysConfig" parms:parms modelClass:nil resultIsArray:NO resultBlock:resultBlock];
    
}

@end
