//
//  BaseViewController.m
//  CommonKit
//
//  Created by doit on 15/4/8.
//  Copyright (c) 2015年 doit. All rights reserved.
//

#import "BaseViewController.h"
#import "WKAlertView.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

@synthesize navBarHeight;
@synthesize statusBarHieght;

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self=[super initWithCoder:aDecoder];
    
    return self;
}

-(CGFloat)navBarHeight
{
    // 导航栏（navigationbar）
    CGRect rectNav = self.navigationController.navigationBar.frame;
    return rectNav.size.height;
}

-(CGFloat)statusBarHieght
{
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    
    return   rectStatus.size.height ;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
    [self setUpNavigationItem];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    //去除导航栏下方的横线
    [self.navigationController. navigationBar setShadowImage:[UIImage new]];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    //[self.view setBackgroundColor:APP_THEME_COLOR];
    //    [self.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
}

-(void) setUpNavigationItem
{
    //    UIBarButtonItem *backItem =[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"sys-back"] style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    ////    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"sys-back"]] landscapeImagePhone:[UIImage imageNamed:@"sys-back"] style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    //   // backItem.title = @"返回";
    //    [backItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15.f]}  forState:UIControlStateNormal];
    //    self.navigationItem.leftBarButtonItem = backItem;
    //
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    
}

-(void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)login
{

}

/*******************************
 通常情况下这句话能自动实现子类的键盘隐藏
 不过如果子类有使用到uiscrollview的话
 可能不得行哦，请参考
 LoginWithHelpViewController的处理
 *******************************/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void)addDismissKeyBoardTextView:(UITextView *)textView
{
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    [topView setBarStyle:UIBarStyleDefault];
    
    //    UIBarButtonItem * helloButton = [[UIBarButtonItem alloc]initWithTitle:@"Hello" style:UIBarButtonItemStyleBordered target:self action:nil];
    
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard:)];
    
    
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace,doneButton,nil];
    
    [topView setItems:buttonsArray];
    [textView setInputAccessoryView:topView];
}

-(void)addDismissKeyBoardTextField:(UITextField *)textField
{
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    [topView setBarStyle:UIBarStyleDefault];
    
    //    UIBarButtonItem * helloButton = [[UIBarButtonItem alloc]initWithTitle:@"Hello" style:UIBarButtonItemStyleBordered target:self action:nil];
    
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard:)];
    
    
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace,doneButton,nil];
    
    [topView setItems:buttonsArray];
    [textField setInputAccessoryView:topView];
}

-(void)dismissKeyBoard:(UIBarButtonItem *)item
{
    [self.view endEditing:YES];
}

-(void)showAlertWithInfoMessage:(NSString *)msg
{
    __block WKAlertView *sheetWindow = [WKAlertView showAlertViewWithStyle:WKAlertViewStyleSuccess title:@"提示" detail:msg canleButtonTitle:@"确定" okButtonTitle:@"取消" callBlock:^(MyWindowClick buttonIndex) {
        //Window隐藏，并置为nil，释放内存 不能少
        sheetWindow.hidden = YES;
        sheetWindow = nil;
    }];
    
}

-(void)showAlertWithWarnMessage:(NSString *)msg
{
    __block WKAlertView *sheetWindow = [WKAlertView showAlertViewWithStyle:WKAlertViewStyleWaring title:@"警告" detail:msg canleButtonTitle:@"确定" okButtonTitle:@"取消" callBlock:^(MyWindowClick buttonIndex) {
        //Window隐藏，并置为nil，释放内存 不能少
        sheetWindow.hidden = YES;
        sheetWindow = nil;
    }];
    
}

-(void)showAlertWithErrorMessage:(NSString *)msg
{
    __block WKAlertView *sheetWindow = [WKAlertView showAlertViewWithStyle:WKAlertViewStyleFail title:@"错误" detail:msg canleButtonTitle:@"确定" okButtonTitle:@"取消" callBlock:^(MyWindowClick buttonIndex) {
        //Window隐藏，并置为nil，释放内存 不能少
        sheetWindow.hidden = YES;
        sheetWindow = nil;
    }];
    
}

-(void)showAlertWithNetWarn
{
    [self showAlertWithWarnMessage:@"网络不给力"];
}

//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}
//- (BOOL)prefersStatusBarHidden
//{
//    return NO;
//}

@end
