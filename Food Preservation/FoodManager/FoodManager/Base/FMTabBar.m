//
//  FMTabBar.m
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/13.
//  Copyright © 2020 guanhua. All rights reserved.
//

#import "FMTabBar.h"

@interface FMTabBar ()<UITabBarControllerDelegate>

@property(nonatomic,strong) FMTabbarView *bar;

@end

@implementation FMTabBar

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bar = [FMTabbarView getFMTabbarView];
    self.bar.frame = CGRectMake(0, 0, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
    [self.tabBar addSubview:self.bar];
    
    FMHomeVC *home = [[FMHomeVC alloc]init];
    FMClassificationVC *class = [[FMClassificationVC alloc]init];
    FMAboutVC *about = [[FMAboutVC alloc]init];
    
    self.viewControllers = @[[[FMNavigateVC alloc]initWithRootViewController:home],
                            [[FMNavigateVC alloc]initWithRootViewController:class],
                            [[FMNavigateVC alloc]initWithRootViewController:about]];
    self.delegate = self;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    if (viewController == self.viewControllers[0]) {
        self.bar.homeBtn.backgroundColor = [UIColor clearColor];
        self.bar.classBtn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        self.bar.aboutBtn.backgroundColor =  [[UIColor blackColor] colorWithAlphaComponent:0.5];
    }
    else if (viewController == self.viewControllers[1]) {
        self.bar.homeBtn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        self.bar.classBtn.backgroundColor = [UIColor clearColor];
        self.bar.aboutBtn.backgroundColor =  [[UIColor blackColor] colorWithAlphaComponent:0.5];
    }
    else {
        self.bar.homeBtn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        self.bar.classBtn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        self.bar.aboutBtn.backgroundColor = [UIColor clearColor];
    }
    return YES;
}


@end
