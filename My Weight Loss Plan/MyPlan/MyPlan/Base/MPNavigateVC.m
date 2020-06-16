//
//  MPNavigateVC.m
//  MyPlan
//
//  Created by  luzhaoyang on 2020/3/20.
//  Copyright © 2020 yunxi. All rights reserved.
//

#import "MPNavigateVC.h"

@interface MPNavigateVC ()

@end

@implementation MPNavigateVC

- (void)viewDidLoad {
    [super viewDidLoad];
}
 
+ (void)initialize {
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#284962"],NSFontAttributeName : [UIFont fontWithName:FontName size:30]};
    [navigationBar setTranslucent:true];
    [navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#284962"]}];
    [navigationBar setTintColor:[UIColor colorWithHexString:@"#284962"]];
    [navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:FontName size:30],NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#284962"]}];
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
