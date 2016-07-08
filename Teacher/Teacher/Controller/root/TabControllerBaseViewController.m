//
//  TabControllerBaseViewController.m
//  Mother-Service-Station
//
//  Created by doit on 15/12/15.
//  Copyright © 2015年 ddsl-doit. All rights reserved.
//

#import "TabControllerBaseViewController.h"
#import "RootViewController.h"

@interface TabControllerBaseViewController ()

@end

@implementation TabControllerBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    [RootViewController shareInstance].tabBar.hidden=NO;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSArray *ary=self.navigationController.childViewControllers;
    if (ary.count>1) {
        [RootViewController shareInstance].tabBar.hidden=YES;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
