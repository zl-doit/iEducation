//
//  HttpRequestModel.h
// DataKit
//
//  Created by doit on 15/4/15.
//  Copyright (c) 2015年 doit. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Constants.h"
#import "LocalDataStoreUtil.h"

@interface HttpRequestModel :ZLModel

@property (nonatomic, strong) NSString *module;
@property (nonatomic, strong) NSString *method;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *os;
@property (nonatomic, strong) NSString *platform;
@property (nonatomic, assign) NSNumber *version;
@property (nonatomic, strong) NSDictionary *parms;

+(HttpRequestModel *)getRequestModel:(NSString *)module method:(NSString *)method parms:(NSDictionary *)parms;

@end
