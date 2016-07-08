//
//  BaseModel.m
// DataKit
//
//  Created by doit on 15/8/4.
//  Copyright (c) 2015年 ddsl. All rights reserved.
//

#import "ZLModel.h"
#import<objc/runtime.h>

@implementation ZLModel

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
    return  [[ZLModel allocWithZone:zone] init];
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return  [[ZLModel allocWithZone:zone] init];
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



-(NSDictionary*)getDic
{
    return [self getDicFromNormalClass:self];
}

-(NSDictionary *) getDicFromNormalClass:(id) classInstance
{
    
    Class clazz = [classInstance class];
    
    u_int count;
    
    objc_property_t* properties = class_copyPropertyList(clazz, &count);
    
    
    
    NSMutableArray* propertyArray = [NSMutableArray arrayWithCapacity:count];
    
    NSMutableArray* valueArray = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count ; i++)
        
    {
        //        property.type
        objc_property_t prop=properties[i];
        
        const char* propertyName = property_getName(prop);
        //        property_getAttributes
        [propertyArray addObject:[NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding]];
        
        const char* propertyAttribute = property_getAttributes(prop);
        NSString *attribute=[NSString  stringWithCString:propertyAttribute encoding:NSUTF8StringEncoding];
        
        
        NSLog(@"%@",attribute);
        
        //        NSLog(@"%@",[NSString stringWithUTF8String:attributeName]);
        
        id value =  [classInstance performSelector:NSSelectorFromString([NSString stringWithUTF8String:propertyName])];
        
        
        if(value ==nil)
        {
            if ([attribute hasPrefix:@"T@\"NSNumber\""])
            {
                [valueArray addObject:@"0"];
            }
            else
            {
                [valueArray addObject:[NSNull null]];
            }
        }
        else
        {
            if ([value respondsToSelector:@selector(class)])
            {
                if ([[value class] isSubclassOfClass:[ZLModel class]])
                {
                    //                    [valueArray addObject:[NSNull null]];
                    [valueArray addObject:[self getDicFromNormalClass:value]];
                }
                else
                {
                    [valueArray addObject:value];
                }
            }
            else
            {
                [valueArray addObject:value];
            }
        }
        
    }
    
    free(properties);
    
    NSDictionary* returnDic = [NSDictionary dictionaryWithObjects:valueArray forKeys:propertyArray];
    
//    NSLog(@"%@", returnDic);
    
    return returnDic;
}

@end
