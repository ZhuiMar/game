//
//  SmartDetective_IntroductionPageVC.m
//  SmartDetective
//
//  Created by zy on 2020/5/13.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import "SmartDetective_IntroductionPageVC.h"

@interface SmartDetective_IntroductionPageVC ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *weightLayout;
@property (weak, nonatomic) IBOutlet UIButton *priBtn;

@end

@implementation SmartDetective_IntroductionPageVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Introduction";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if kiPhone5 {
        self.heightLayout.constant = 500;
        self.weightLayout.constant = 300;
    }
    self.priBtn.layer.cornerRadius = 6;
    self.priBtn.layer.masksToBounds = YES;
}
- (IBAction)gotoPrivacy:(id)sender {
    [NSObject SmartDetective_changeThemeFromeController:self];
}

@end
