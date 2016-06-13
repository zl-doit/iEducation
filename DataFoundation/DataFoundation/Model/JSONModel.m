//
//  ModelBase.m
//  Mother-Service-Station
//
//  Created by doit on 15/6/23.
//  Copyright (c) 2015年 ddsl-doit. All rights reserved.
//

#import "JSONModel.h"
#import <objc/runtime.h>

@implementation JSONModel

//-(NSDictionary *)PropertyArray
//{
//    return [self properties_aps];
//}


-(id) initWithDictionary:(NSDictionary*) jsonObject
{
    if((self = [super init]))
    {
        for (NSString *key in jsonObject) {
            id value=[jsonObject objectForKey:key];
            if (!value) {
                value=[NSObject new];
            }
        }
        [self setValuesForKeysWithDictionary:jsonObject];
    }
    return self;
}

#pragma mark - Key Value Coding

- (id)valueForUndefinedKey:(NSString *)key
{
    // subclass implementation should provide correct key value mappings for custom keys
    NSLog(@"%@：获取键值出错，未定义的键：%@", NSStringFromClass([self class]), key);
    return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    // subclass implementation should set the correct key value mappings for custom keys
    NSLog(@"%@：构造模型对象出错，未定义的键：%@", NSStringFromClass([self class]), key);
}

#pragma mark - NSCoding 

-(BOOL) allowsKeyedCoding
{
	return YES;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    return [super init];
}

#pragma mark - NSCopying, NSMutableCopying

- (id)copyWithZone:(NSZone *)zone
{
    return  [[JSONModel allocWithZone:zone] init];
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return  [[JSONModel allocWithZone:zone] init];
}

- (NSDictionary *)properties_aps {
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount;
    int i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i=0;i<outCount;i++)
    {
        objc_property_t property = properties[i];
        const char *xx=property_getName(property);
        
        NSString *propertyName = [NSString stringWithCString:xx encoding:NSUTF8StringEncoding];
        if ([propertyName isEqualToString:@"PropertyArray"])
        {
            continue;
        }
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        if (propertyValue) [props setObject:propertyValue forKey:propertyName];
    }
    free(properties);
    return props;
}


@end
