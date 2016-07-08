//
//  Notice.h
// DataKit
//
//  Created by doit on 16/3/8.
//  Copyright © 2016年 ddsl. All rights reserved.
//

#import "ZLModel.h"

/**
 * 公告实体
 */
@interface Notice : ZLModel

@property (nonatomic, assign) NSInteger noticeId;
@property (nonatomic, assign) NSInteger noticeType;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* brief;
@property (nonatomic, strong) NSString* content;

@end
