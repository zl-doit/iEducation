//
//  HttpResponseModel.h
// DataKit
//
//  Created by doit on 15/4/15.
//  Copyright (c) 2015年 doit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLModel.h"

@interface HttpResponseError : ZLModel
@property (nonatomic, assign)   NSString    *type;
@property (nonatomic, assign)   NSString    *code;
@property (nonatomic, strong)   NSString    *message;
@end


@interface HttpResponseModel : ZLModel

@property (nonatomic, assign)   BOOL            success;
@property (nonatomic, strong)   id              result;
@property (nonatomic, strong)   HttpResponseError   *error;
@property (nonatomic, strong)    NSString        *module;
@property (nonatomic, strong)    NSString        *method;

@end
