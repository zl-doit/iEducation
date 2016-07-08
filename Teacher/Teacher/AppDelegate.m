//
//  AppDelegate.m
//  Teacher
//
//  Created by doit on 16/6/13.
//  Copyright © 2016年 doit. All rights reserved.
//

#import "AppDelegate.h"

//#import "ZLFramework/Test.h"
//#import "ZLFramework/Test.h"
#import "CommonKit.h"
#import "RequestModel.h"
#import <DataKit/ResponseModel.h>
#import "DataKit.h"
#import "AFHTTPSessionManager.h"
#import "RootViewController.h"
#import "TeacherHttpManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self initGlobStyle];
    [self enter];
    
    return YES;
}

-(void)initGlobStyle
{
    //    [[UINavigationBar appearance] setTintColor:NAV_BAR_BG_COLOR];
    //    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    //
    //    [[UINavigationBar appearance] setTranslucent:NO];
    
    //设置NavigationBar背景颜色
    [[UINavigationBar appearance] setBarTintColor:NAV_BAR_BG_COLOR];
    [[UINavigationBar appearance] setTintColor:NAV_BAR_BG_COLOR];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    //    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:[self colorFromHexRGB:@"33cccc"]]
    //                       forBarPosition:UIBarPositionAny
    //                           barMetrics:UIBarMetricsDefault];
    //    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    //      [[UINavigationBar appearance] setBarTintColor:NAV_BAR_BG_COLOR];
    //    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],NSFontAttributeName : [UIFont boldSystemFontOfSize:18]}];//NSFontAttributeName
    
    //自定义返回按钮
    UIImage *backButtonImage = [[UIImage imageNamed:@"sys-back"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 24, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //将返回按钮的文字position设置不在屏幕上显示
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    
    //设置item普通状态
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    attrs[NSForegroundColorAttributeName] = RGBCOLOR(132, 58, 57);
    [[UIBarButtonItem appearance] setTitleTextAttributes:attrs forState:UIControlStateNormal];
}


-(void)enter
{
    [TeacherHttpManager getStationCourseList:@"096220160600001" resultBlock:^(id result, BOOL success, HttpResponseError *error) {
        
    }];
    RootViewController *rootViewController = [RootViewController shareInstance];
    UINavigationController *rootNavController=[[UINavigationController alloc]initWithRootViewController:rootViewController];
    self.window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = rootNavController;
    [self.window makeKeyAndVisible];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
