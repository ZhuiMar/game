//
//  SleepHelper_RootTab.m
//  SleepHelper
//
//  Created by zy on 2020/5/18.
//  Copyright © 2020 tianma. All rights reserved.
//

#import "SleepHelper_RootTab.h"

@interface SleepHelper_RootTab ()<UITabBarControllerDelegate>

@property(nonatomic,strong)SleepHelper_TabbarView *bar;

@end

@implementation SleepHelper_RootTab

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bar = [SleepHelper_TabbarView getTabarView];
    self.bar.frame = CGRectMake(0, 0, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
    if IS_IPHONE_X_orMore {
        self.bar.frame = CGRectMake(0, -32, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
    }
    
    [self.tabBar addSubview:self.bar];
    
    SleepHelper_HomePageVC *game = [[SleepHelper_HomePageVC alloc]init];
    SleepHelper_SleepViewController *sleep = [[SleepHelper_SleepViewController alloc]init];
    SleepHelper_SetViewController *setting = [[SleepHelper_SetViewController alloc]init];
    
    self.viewControllers = @[[[SleepHelper_navigation alloc]initWithRootViewController:game],
                            [[SleepHelper_navigation alloc]initWithRootViewController:sleep],
                            [[SleepHelper_navigation alloc]initWithRootViewController:setting]];
    self.delegate = self;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    if (viewController == self.viewControllers[0]) {
        self.bar.iconsOne.image = [UIImage imageNamed:@"game-select"];
        self.bar.iconsTwo.image = [UIImage imageNamed:@"sleep"];
        self.bar.iconsThree.image = [UIImage imageNamed:@"settings"];
        self.bar.gameLabel.textColor = [NSObject SleepHelper_colorWithHexString:@"#195308"];
        self.bar.sleepLabel.textColor = [NSObject SleepHelper_colorWithHexString:@"#999999"];
        self.bar.settingLabel.textColor = [NSObject SleepHelper_colorWithHexString:@"#999999"];
    }
    else if (viewController == self.viewControllers[1]) {
        self.bar.iconsOne.image = [UIImage imageNamed:@"game"];
        self.bar.iconsTwo.image = [UIImage imageNamed:@"sleep-select"];
        self.bar.iconsThree.image = [UIImage imageNamed:@"settings"];
        self.bar.gameLabel.textColor = [NSObject SleepHelper_colorWithHexString:@"#999999"];
        self.bar.sleepLabel.textColor = [NSObject SleepHelper_colorWithHexString:@"#195308"];
        self.bar.settingLabel.textColor = [NSObject SleepHelper_colorWithHexString:@"#999999"];
    }
    else {
        self.bar.iconsOne.image = [UIImage imageNamed:@"game"];
        self.bar.iconsTwo.image = [UIImage imageNamed:@"sleep"];
        self.bar.iconsThree.image = [UIImage imageNamed:@"settings-select"];
        self.bar.gameLabel.textColor = [NSObject SleepHelper_colorWithHexString:@"#999999"];
        self.bar.sleepLabel.textColor = [NSObject SleepHelper_colorWithHexString:@"#999999"];
        self.bar.settingLabel.textColor = [NSObject SleepHelper_colorWithHexString:@"#195308"];
    }
    return YES;
}

@end
