//
//  FFTBall_AboutPageVC.m
//  FootballFormationTactics
//
//  Created by zy on 2020/5/27.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import "FFTBall_AboutPageVC.h"
#import "UIColor+MBBall_color.h"

@interface FFTBall_AboutPageVC ()

@property (weak, nonatomic) IBOutlet UIView *aboutBg;

@end

@implementation FFTBall_AboutPageVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.aboutBg.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    self.aboutBg.layer.borderColor = [UIColor whiteColor].CGColor;
    self.aboutBg.layer.borderWidth = 2.5;
    self.navigationItem.title = @"About";
}

@end

