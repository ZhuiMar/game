//
//  SleepHelper_navigation.m
//  SleepHelper
//
//  Created by zy on 2020/5/18.
//  Copyright © 2020 tianma. All rights reserved.
//

#import "SleepHelper_navigation.h"

@interface SleepHelper_navigation ()

@end

@implementation SleepHelper_navigation

+ (void)initialize {
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[NSObject SleepHelper_colorWithHexString:@"#195308"],NSFontAttributeName : [UIFont systemFontOfSize:TitleSize]};
    [navigationBar setTranslucent:true];
    [navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[NSObject SleepHelper_colorWithHexString:@"#195308"]}];
    [navigationBar setTintColor:[NSObject SleepHelper_colorWithHexString:@"#195308"]];
    [navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:FontName size:TitleSize],NSForegroundColorAttributeName:[NSObject SleepHelper_colorWithHexString:@"#195308"]}];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        self.interactivePopGestureRecognizer.delegate = nil;
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = 10;
        UIButton *button = [[UIButton alloc] init];
        
        if ([viewController isKindOfClass:[SleepHelper_SheepViewController class]]) {
            [button setImage:[UIImage imageNamed:@"return"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"return"] forState:UIControlStateHighlighted];
        }
        else if ([viewController isKindOfClass:[SleepHelper_PopViewController class]]) {
            [button setImage:[UIImage imageNamed:@"return"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"return"] forState:UIControlStateHighlighted];
        }
        else if ([viewController isKindOfClass:[SleepHelper_StarViewController class]]) {
            [button setImage:[UIImage imageNamed:@"return"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"return"] forState:UIControlStateHighlighted];
        }
        else{
            [button setImage:[UIImage imageNamed:@"backBtn"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"backBtn"] forState:UIControlStateHighlighted];
        }
        
        button.frame = CGRectMake(0, 0, 20, 20);
        if (@available(ios 11.0,*)) {
            button.contentEdgeInsets = UIEdgeInsetsMake(0, 0,0, 0);
            button.imageEdgeInsets = UIEdgeInsetsMake(0, 0,0, 0);
        }
        [button addTarget:self action:@selector(backButtonTapClick) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:button];
        viewController.navigationItem.leftBarButtonItems = @[negativeSpacer, backButton];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)backButtonTapClick{
    [self popViewControllerAnimated:YES];
    if(self.returnBlock){
        self.returnBlock();
    }
}


@end
