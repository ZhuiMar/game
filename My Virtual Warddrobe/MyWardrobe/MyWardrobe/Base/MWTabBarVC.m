//
//  MWTabBarVC.m
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/16.
//  Copyright © 2020 honghai. All rights reserved.
//

#import "MWTabBarVC.h"

@interface MWTabBarVC ()<UITabBarControllerDelegate>

@end

@implementation MWTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MWWardrobeVC *wardrobeVC = [[MWWardrobeVC alloc]init];
    MWLooksVC *lookVC = [[MWLooksVC alloc]init];
    MWUserVC *userVC  = [[MWUserVC alloc]init];
    
    MWNavigateVC *wardrobeNavi = [[MWNavigateVC alloc]initWithRootViewController:wardrobeVC];
    wardrobeNavi.tabBarItem.image = [[UIImage imageNamed:@"wardrobe_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    wardrobeNavi.tabBarItem.selectedImage = [[UIImage imageNamed:@"wardrobe_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    wardrobeNavi.tabBarItem.title = @"Wardrobe";
    
    MWNavigateVC *lookNavi = [[MWNavigateVC alloc]initWithRootViewController:lookVC];
    lookVC.tabBarItem.image = [[UIImage imageNamed:@"looks_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    lookVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"looks_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    lookVC.tabBarItem.title = @"Looks";
    
    MWNavigateVC *userNavi = [[MWNavigateVC alloc]initWithRootViewController:userVC];
    userVC.tabBarItem.image = [[UIImage imageNamed:@"user_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    userVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"user_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    userVC.tabBarItem.title = @"User";
    
    self.viewControllers = @[wardrobeNavi,lookNavi,userNavi];
    self.delegate = self;
    
    self.tabBar.translucent = NO;
    self.tabBar.tintColor = [UIColor colorWithHexString:@"#C03329"];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    return YES;
}

@end
