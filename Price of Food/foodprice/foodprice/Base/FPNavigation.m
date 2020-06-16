//
//  FPNavigation.m
//  foodprice
//
//  Created by  luzhaoyang on 2020/4/1.
//  Copyright © 2020 lijingshuxiang.foodprice. All rights reserved.
//

#import "FPNavigation.h"

@interface FPNavigation ()

@end

@implementation FPNavigation

+ (void)initialize {
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#A92924"],NSFontAttributeName : [UIFont systemFontOfSize:24]};
    [navigationBar setTranslucent:true];
    [navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#A92924"]}];
    [navigationBar setTintColor:[UIColor colorWithHexString:@"#A92924"]];
    [navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:FontName size:24],NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#A92924"]}];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        self.interactivePopGestureRecognizer.delegate = nil;
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -15;

        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"back_0"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"back_0"] forState:UIControlStateHighlighted];
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
    if(self.backBlock){
        self.backBlock();
    }
}


@end
