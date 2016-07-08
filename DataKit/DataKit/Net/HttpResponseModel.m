//
//  HttpResponseModel.m
// DataKit
//
//  Created by doit on 15/4/15.
//  Copyright (c) 2015年 doit. All rights reserved.
//

#import "HttpResponseModel.h"

@implementation HttpResponseError


@end


@implementation HttpResponseModel

-(void)setValue:(id)value forKey:(NSString *)key
{
    if ([@"error" isEqualToString:key]) {
        self.error=[[HttpResponseError alloc]initWithDictionary:value];
    }
    else
    {
        [super setValue:value forKey:key];
    }
}

@end
