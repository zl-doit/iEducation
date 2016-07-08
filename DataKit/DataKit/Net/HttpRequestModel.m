//
//  HttpRequestModel.m
// DataKit
//
//  Created by doit on 15/4/15.
//  Copyright (c) 2015年 doit. All rights reserved.
//

#import "HttpRequestModel.h"

@implementation HttpRequestModel

+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{};
}

-(void)setToken:(NSString *)token{
    _token = token;
    if(token == nil){
        _token = @"";
    }
}

-(void)setParms:(NSDictionary *)parms{
    _parms = parms;
    if(parms == nil){
        _parms = @{};
    }
}

+(HttpRequestModel *)getRequestModel:(NSString *)module method:(NSString *)method parms:(NSDictionary *)parms{
    
    NSParameterAssert(module);
    NSParameterAssert(method);
    NSParameterAssert(parms);
    
    HttpRequestModel *requestModel = [[HttpRequestModel alloc]init];
    requestModel.module = module;
    requestModel.method = method;
    requestModel.token = [LocalDataStoreUtil getToken];
    requestModel.os = SYSTEMNAME;
    requestModel.platform = @"client";
    requestModel.parms = parms;
    requestModel.version = @(SERVICE_VERSION);
    
    return requestModel;
    
}

@end
