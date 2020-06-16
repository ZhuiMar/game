//
//  CPNavigation.m
//  ComparePlanes
//
//  Created by luzhaoyang on 2020/4/15.
//  Copyright © 2020 qingxiriver. All rights reserved.
//

#import "CPNavigation.h"

@interface CPNavigation ()

@end

@implementation CPNavigation

- (void)viewDidLoad {
    [super viewDidLoad];
}

+ (void)initialize {
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[NSObject CPcolorWithHexString:TitleColor],NSFontAttributeName : [UIFont fontWithName:FontName size:24]};
    [navigationBar setTranslucent:true];
    [navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[NSObject CPcolorWithHexString:TitleColor]}];
    [navigationBar setTintColor:[NSObject CPcolorWithHexString:TitleColor]];
    [navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:FontName size:24],NSForegroundColorAttributeName:[NSObject CPcolorWithHexString:TitleColor]}];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        self.interactivePopGestureRecognizer.delegate = nil;
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -15;
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"return"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"return"] forState:UIControlStateHighlighted];
        button.frame = CGRectMake(0, 0, 44, 44);
        if (@available(ios 11.0,*)) {
            button.contentEdgeInsets = UIEdgeInsetsMake(0, 0,0, 0);
            button.imageEdgeInsets = UIEdgeInsetsMake(0, 0,0, 0);
        }
        [button addTarget:self action:@selector(backButtonTapClick) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:button];
        viewController.navigationItem.leftBarButtonItems = @[negativeSpacer, backButton];
        
        if([viewController isKindOfClass:[SFSafariViewController class]]){
            [button setHidden:YES];
        }
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
