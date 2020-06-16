//
//  MPTabbarVC.m
//  MyPlan
//
//  Created by  luzhaoyang on 2020/3/20.
//  Copyright © 2020 yunxi. All rights reserved.
//

#import "MPTabbarVC.h"

@interface MPTabbarVC ()<UITabBarControllerDelegate>

@end

@implementation MPTabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MPHomeVC *homeVC = [[MPHomeVC alloc]init];
    MPWeightVC *weightVC = [[MPWeightVC alloc]init];
    MPMineVC *mineVC  = [[MPMineVC alloc]init];
    
    MPNavigateVC *homeNavi = [[MPNavigateVC alloc]initWithRootViewController:homeVC];
    homeNavi.tabBarItem.image = [[UIImage imageNamed:@"diet"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeNavi.tabBarItem.selectedImage = [[UIImage imageNamed:@"diet-select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeNavi.tabBarItem.title = @"diet";
    
    MPNavigateVC *weightNavi = [[MPNavigateVC alloc]initWithRootViewController:weightVC];
    weightNavi.tabBarItem.image = [[UIImage imageNamed:@"weight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    weightNavi.tabBarItem.selectedImage = [[UIImage imageNamed:@"weight-select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    weightNavi.tabBarItem.title = @"weight";
    
    MPNavigateVC *userNavi = [[MPNavigateVC alloc]initWithRootViewController:mineVC];
    userNavi.tabBarItem.image = [[UIImage imageNamed:@"my"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    userNavi.tabBarItem.selectedImage = [[UIImage imageNamed:@"my-select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    userNavi.tabBarItem.title = @"my";
    
    self.viewControllers = @[homeNavi,weightNavi,userNavi];
    self.delegate = self;
    
    self.tabBar.translucent = NO;
    self.tabBar.tintColor = [UIColor colorWithHexString:@"#C03329"];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    return YES;
}

@end
