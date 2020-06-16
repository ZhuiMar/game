//
//  RSSPrivacyPolicyViewController.m
//  RapidSignSelection
//
//  Created by liping on 2020/6/11.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "RSSPrivacyPolicyViewController.h"

@interface RSSPrivacyPolicyViewController ()

@end

@implementation RSSPrivacyPolicyViewController

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
