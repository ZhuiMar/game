//
//  MBNavigteController.m
//  MathematicsBasketball
//
//  Created by zy on 2020/5/25.
//  Copyright © 2020 zhongba. All rights reserved.
//

#import "MBNavigteController.h"

@interface MBNavigteController ()

@end

@implementation MBNavigteController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

+ (void)initialize {
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor MBBallcolorWithHexString:TITTLCOLOR],NSFontAttributeName : [UIFont fontWithName:TEXTFONT size:TITTLESIZE]};
    [navigationBar setTranslucent:true];
    [navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor MBBallcolorWithHexString:TITTLCOLOR]}];
    [navigationBar setTintColor:[UIColor MBBallcolorWithHexString:TITTLCOLOR]];
    [navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:TEXTFONT size:TITTLESIZE],NSForegroundColorAttributeName:[UIColor MBBallcolorWithHexString:TITTLCOLOR]}];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        self.interactivePopGestureRecognizer.delegate = nil;
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = 10;
        UIButton *button = [[UIButton alloc] init];
        
        [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
        
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
    if(self.back){
        self.back();
    }
}

@end
