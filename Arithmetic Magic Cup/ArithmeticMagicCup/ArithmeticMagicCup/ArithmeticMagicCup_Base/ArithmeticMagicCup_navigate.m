//
//  ArithmeticMagicCup_navigate.m
//  ArithmeticMagicCup
//
//  Created by luzhaoyang on 2020/4/22.
//  Copyright © 2020 qingmai. All rights reserved.
//

#import "ArithmeticMagicCup_navigate.h"

@interface ArithmeticMagicCup_navigate ()

@end

@implementation ArithmeticMagicCup_navigate

+ (void)initialize {
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor ArithmeticMagicCup_colorWithHexString:TitleColor],NSFontAttributeName : [UIFont systemFontOfSize:TitleSize]};
    [navigationBar setTranslucent:true];
    [navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor ArithmeticMagicCup_colorWithHexString:TitleColor]}];
    [navigationBar setTintColor:[UIColor ArithmeticMagicCup_colorWithHexString:TitleColor]];
    [navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:FontName size:TitleSize],NSForegroundColorAttributeName:[NSObject ArithmeticMagicCup_colorWithHexString:TitleColor]}];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        self.interactivePopGestureRecognizer.delegate = nil;
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = 10;

        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"return"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"return"] forState:UIControlStateHighlighted];
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
