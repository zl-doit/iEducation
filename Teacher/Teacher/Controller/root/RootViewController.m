//
//  RootViewController.m
//  Teacher
//
//  Created by doit on 15/4/8.
//  Copyright (c) 2015年 doit. All rights reserved.
//

#import "RootViewController.h"
#import "HomeViewController.h"
#import "CourseViewController.h"
#import "MineViewController.h"
// #import "SFHFKeychainUtils.h"

@interface RootViewController ()<UITabBarControllerDelegate>
{
    UILabel *mCenterLabel;
    UIButton *mTabBarCenterButton;
}
//-(UINavigationController *)viewControllerWithTabTitle:(NSString *)title image:(UIImage *)image viewController:(UIViewController *)viewController selectedImage:(UIImage *)selectedImage;
-(UIViewController *)viewControllerWithTabTitle:(NSString *)title index:(int)index image:(UIImage *)image viewController:(UIViewController *)viewController selectedImage:(UIImage *)selectedImage;
-(void)addCenterButtonWithImage:(UIImage *)buttonImage highlightImage:(UIImage *)highlightImage;
@end

@implementation RootViewController

static RootViewController *root__=nil;

+(instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        root__=[[RootViewController alloc]initWithNibName:@"RootViewController" bundle:nil];
    });
    return root__;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeViewController *homeCtrl = [[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
    CourseViewController *courseCtrl=[[CourseViewController alloc] initWithNibName:@"CourseViewController" bundle:nil];
    MineViewController *mineViewController = [[MineViewController alloc] initWithNibName:@"MineViewController" bundle:nil];
    
    self.viewControllers = [NSArray arrayWithObjects:
                            [self viewControllerWithTabTitle:@"首页" index:0 image:[UIImage imageNamed:@"home"]  viewController:homeCtrl selectedImage:[UIImage imageNamed:@"home_selected"]],
                            [self viewControllerWithTabTitle:@"课程" index:1 image:[UIImage imageNamed:@"course"]  viewController:courseCtrl selectedImage:[UIImage imageNamed:@"course_selected"]],
                            [self viewControllerWithTabTitle:@"我的" index:3 image:[UIImage imageNamed:@"my"] viewController:mineViewController selectedImage:[UIImage imageNamed:@"my_selected"]]
                            , nil];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

-(UIViewController *)viewControllerWithTabTitle:(NSString *)title index:(int)index image:(UIImage *)image viewController:(UIViewController *)viewController selectedImage:(UIImage *)selectedImage{
    
    //IOS 7以上要设置图片渲染模式
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:image selectedImage:selectedImage];
    CGFloat offset = 5.0;
    viewController.tabBarItem.imageInsets = UIEdgeInsetsMake(offset, 0, -offset, 0);
    viewController.tabBarItem.tag=index;
    
    //设置选中时文本文字颜色
    [viewController.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGBCOLOR(78,197,210),NSForegroundColorAttributeName, nil] forState:UIControlStateHighlighted];
    if(image == nil){
        viewController.tabBarItem.enabled = NO;
    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGRect rect = CGRectMake(0, 0, SCREEN_WIDTH, 1);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context,
                                       RGBCOLOR(235, 235, 235).CGColor);
        CGContextFillRect(context, rect);
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [self.tabBar setShadowImage:img];
        [self.tabBar setBackgroundColor:[UIColor whiteColor]];
        [self.tabBar setBackgroundImage:[[UIImage alloc]init]];
    });
    viewController.title=title;
    viewController.tabBarItem.title=nil;
     UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:viewController];
    return nav;
    
}

-(void)addCenterButtonWithImage:(UIImage *)buttonImage highlightImage:(UIImage *)highlightImage{
    
    mTabBarCenterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    mTabBarCenterButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    mTabBarCenterButton.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
    
    [mTabBarCenterButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [mTabBarCenterButton setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    
    CGPoint center = self.tabBar.center;
    center.y -= (buttonImage.size.height / 2.0);
    mTabBarCenterButton.center = center;
    
    [mTabBarCenterButton addTarget:self action:@selector(centerTouchDown) forControlEvents:UIControlEventTouchDown];
    
    mCenterLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
    mCenterLabel.text = @"订单中心";
    mCenterLabel.font = [UIFont systemFontOfSize:10.0f];
    mCenterLabel.textAlignment = NSTextAlignmentCenter;
    mCenterLabel.textColor = RGBCOLOR(128, 128, 128);
    
    center.y += 40;
    
    mCenterLabel.center = center;
    
    [self.view addSubview:mTabBarCenterButton];
    [self.view addSubview:mCenterLabel];
}


-(void)centerTouchDown{
    [mCenterLabel setTextColor:[UIColor redColor]];
    
//    typeof(self) __weak weakSelf = self;
//    if (!_pop) {
//        _pop= [[PublishPopView alloc] initWithFrame:self.view.bounds];
//        _pop.completedBlock=^(id info) {
//            [weakSelf showCenterBar];
//        };
//    }
//    if (_pop.isShowed) {
//        [_pop dismiss];
//        [self showCenterBar];
//    }
//    else
//    {
//        [_pop show:self.view];
//        [self hiddenCenterBar];
//    }
    
}


-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self setUpNavigationItem];
    });
    
}


-(void) setUpNavigationItem
{
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
}



-(void)showCenterBar
{
    [mCenterLabel setHidden:NO];
    [mTabBarCenterButton setHidden:NO];
}

-(void)hiddenCenterBar
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [mTabBarCenterButton removeFromSuperview];
        [mCenterLabel setHidden:YES];
        [mTabBarCenterButton setHidden:YES];
    });
    
}

//<TabBarCenterButtunDelegate>
#pragma mark-- TabBarCenterButtunDelegate
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
//    NSArray *titles=@[@"母亲电商",@"商城",@"服务订单",@"个人中心"];
//    [mCenterLabel setTextColor:RGBCOLOR(128, 128, 128)];
//    NSString *title= titles[item.tag];
//    self.navigationItem.title= title  ;
}

-(void)hiddenTabBar
{
    self.hidesBottomBarWhenPushed = YES;
    mCenterLabel.hidden=YES;
    mTabBarCenterButton.hidden=YES;
}


-(void)willAppearIn:(UINavigationController *)navigationController
{
    // [self addCenterButtonWithImage:[UIImage imageNamed:@"root_publish_sound"] highlightImage:nil];
    
}


@end
