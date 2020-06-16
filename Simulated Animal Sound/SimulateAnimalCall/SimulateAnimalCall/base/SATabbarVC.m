//
//  SATabbarVC.m
//  SimulateAnimalCall
//
//  Created by luzhaoyang on 2020/4/8.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "SATabbarVC.h"

@interface SATabbarVC ()<UITabBarControllerDelegate>

@end

@implementation SATabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SAHomePageVC *home = [[SAHomePageVC alloc]init];
    SAMineVC *mine = [[SAMineVC alloc]init];
   
    SANavigationViewController *homeNa = [[SANavigationViewController alloc]initWithRootViewController:home];
    homeNa.tabBarItem.image = [[UIImage imageNamed:@"1_home_nor"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeNa.tabBarItem.selectedImage = [[UIImage imageNamed:@"1_home_pre"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeNa.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    SANavigationViewController *lookNavi = [[SANavigationViewController alloc]initWithRootViewController:mine];
    lookNavi.tabBarItem.image = [[UIImage imageNamed:@"setting_nor"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    lookNavi.tabBarItem.selectedImage = [[UIImage imageNamed:@"setting_pre"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    lookNavi.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    self.viewControllers = @[homeNa,lookNavi];
    self.delegate = self;

    UIImage *tabbarImage = [self imageWithColor:[NSObject colorWithHexString:@"#413D5B"]];
    self.tabBar.backgroundImage = tabbarImage;
    self.tabBar.shadowImage = tabbarImage;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    return YES;
}

- (UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
