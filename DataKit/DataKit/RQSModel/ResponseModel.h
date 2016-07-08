//
//  ResponseModel.h
//  Mother-Service-Station
//
//  Created by doit on 15/6/23.
//  Copyright (c) 2015年 ddsl-doit. All rights reserved.
//

#import "ZLModel.h"
#import "RequestModel.h"

@interface ResponseError : ZLModel
@property (nonatomic, assign)   NSString    *type;
@property (nonatomic, assign)   NSString    *code;
@property (nonatomic, strong)   NSString    *message;
@end

@interface ResponseModel :ZLModel

@property (nonatomic, assign)   BOOL            success;
@property (nonatomic, strong)   id              result;
@property (nonatomic, strong)   ResponseError   *error;
@property (nonatomic, strong)    NSString        *module;
@property (nonatomic, strong)    NSString        *method;

@end
