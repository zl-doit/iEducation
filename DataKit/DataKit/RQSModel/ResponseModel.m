//
//  ResponseModel.m
//  Mother-Service-Station
//
//  Created by doit on 15/6/23.
//  Copyright (c) 2015年 ddsl-doit. All rights reserved.
//

#import "ResponseModel.h"

@implementation ResponseError


@end

@implementation ResponseModel
-(void)setValue:(id)value forKey:(NSString *)key
{
    if ([@"error" isEqualToString:key]) {
        self.error=[[ResponseError alloc]initWithDictionary:value];
    }
    else
    {
        [super setValue:value forKey:key];
    }
}
@end
