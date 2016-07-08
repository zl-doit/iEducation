//
//  ZLModel.h
// DataKit
//
//  Created by doit on 15/8/4.
//  Copyright (c) 2015年 ddsl. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface ZLModel : NSObject <NSCoding, NSCopying, NSMutableCopying>
-(id) initWithDictionary:(NSDictionary *) jsonObject;

/**
 调用该方法的model不能使用基础类型，如果int需要使用NSNumber
 **/
-(NSDictionary*)getDic;
@end
