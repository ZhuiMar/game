//
//  AMPPrivacyPolicyViewController.m
//  AnimalMathParadise
//
//  Created by liping on 2020/6/10.
//  Copyright © 2020 www. All rights reserved.
//

#import "AMPPrivacyPolicyViewController.h"

@interface AMPPrivacyPolicyViewController ()

@end

@implementation AMPPrivacyPolicyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];

}
- (BOOL)shouldAutorotate{
    return NO;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}
- (BOOL)prefersStatusBarHidden{
    return YES;
}

@end
