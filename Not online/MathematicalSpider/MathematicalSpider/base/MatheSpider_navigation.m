//
//  MatheSpider_navigation.m
//  MathematicalSpider
//
//  Created by luzhaoyang on 2020/4/20.
//  Copyright © 2020 teresa. All rights reserved.
//

#import "MatheSpider_navigation.h"

@interface MatheSpider_navigation ()

@end

@implementation MatheSpider_navigation

- (void)viewDidLoad {
    [super viewDidLoad];

}

+ (void)initialize {
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[NSObject MatheSpider_colorWithHexString:TitleColor],NSFontAttributeName : [UIFont fontWithName:FontName size:TitleSize]};
    [navigationBar setTranslucent:true];
    [navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[NSObject MatheSpider_colorWithHexString:TitleColor]}];
    [navigationBar setTintColor:[NSObject MatheSpider_colorWithHexString:TitleColor]];
    [navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:FontName size:TitleSize],NSForegroundColorAttributeName:[NSObject MatheSpider_colorWithHexString:TitleColor]}];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        self.interactivePopGestureRecognizer.delegate = nil;
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -15;
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"3_return_btn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"3_return_btn"] forState:UIControlStateHighlighted];
        button.frame = CGRectMake(0, 0, 44, 44);
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
