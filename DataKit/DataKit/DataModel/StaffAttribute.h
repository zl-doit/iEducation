//
//  StaffAttribute.h
// DataKit
//
//  Created by doit on 16/3/23.
//  Copyright © 2016年 ddsl. All rights reserved.
//

#import "ZLModel.h"

@interface StaffAttribute : ZLModel

@property (nonatomic, assign) NSInteger attributeId;
@property (nonatomic, strong) NSString  *attributeName;
@property (nonatomic, assign) NSInteger openAttributeId;
@property (nonatomic, strong) NSString  *priceDesc;
@property (nonatomic, assign) float     *unitPirce;
@property (nonatomic, strong) NSString  *webContent;

@end
