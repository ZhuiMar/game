//
//  RSSNavigateController.m
//  RapidSignSelection
//
//  Created by zy on 2020/6/4.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "RSSNavigateController.h"
#import "UIColor+colors.h"

@interface RSSNavigateController ()

@end

@implementation RSSNavigateController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

+ (void)initialize {
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor RSScolorWithHexString:TITTLCOLOR],NSFontAttributeName : [UIFont fontWithName:TEXTFONT size:TITTLESIZE]};
    [navigationBar setTranslucent:true];
    [navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor RSScolorWithHexString:TITTLCOLOR]}];
    [navigationBar setTintColor:[UIColor RSScolorWithHexString:TITTLCOLOR]];
    [navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:TEXTFONT size:TITTLESIZE],NSForegroundColorAttributeName:[UIColor RSScolorWithHexString:TITTLCOLOR]}];
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
    if(self.back){
        self.back();
    }
}


@end
