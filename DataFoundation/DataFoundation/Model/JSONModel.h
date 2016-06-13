//
//  ModelBase.h
//  Mother-Service-Station
//
//  Created by doit on 15/6/23.
//  Copyright (c) 2015年 ddsl-doit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONModel : NSObject <NSCoding, NSCopying, NSMutableCopying>

-(id) initWithDictionary:(NSDictionary *) jsonObject;

//@property(nonatomic, strong)NSDictionary *PropertyArray;
@end
