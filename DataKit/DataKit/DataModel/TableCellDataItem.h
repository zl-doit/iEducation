//
//  TableCellDataItem.h
// DataKit
//
//  Created by doit on 16/3/1.
//  Copyright © 2016年 ddsl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableCellDataItem : NSObject

@property (nonatomic, strong) NSString *icon;//图标
@property (nonatomic, strong) NSString *text;//文字
@property (nonatomic, strong) NSString *detail;//细节
//@property (nonatomic, strong) UIViewController *controller;//跳转的UIViewController
//@property (nonatomic, assign) UITableViewCellAccessoryType accessoryType;
@property (nonatomic, assign) BOOL showSeparatorLine;//是否显示分割线
@property (nonatomic, assign) BOOL enabled;//是否允许点击跳转


@end
