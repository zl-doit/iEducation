//
//  BaseViewController.h
//  CommonKit
//
//  Created by doit on 15/4/8.
//  Copyright (c) 2015年 doit. All rights reserved.
//

#import <UIKit/UIKit.h>
//通用block
typedef void(^CtrlBlock)(id info);

@interface BaseViewController : UIViewController
@property(assign,nonatomic)CGFloat navBarHeight;
@property(assign,nonatomic)CGFloat statusBarHieght;
-(void)login;
-(void)showAlertWithInfoMessage:(NSString *)msg;
-(void)showAlertWithWarnMessage:(NSString *)msg;
-(void)showAlertWithErrorMessage:(NSString *)msg;
-(void)showAlertWithNetWarn;
-(void) setUpNavigationItem;
-(void)addDismissKeyBoardTextView:(UITextView *)textView;
-(void)addDismissKeyBoardTextField:(UITextField *)textField;
@property(nonatomic,copy) CtrlBlock block;
@end

