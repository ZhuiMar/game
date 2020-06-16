//
//  SecretOfRain_AboutViewController.m
//  SecretOfRain
//
//  Created by zy on 2020/4/27.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "SecretOfRain_AboutViewController.h"

@interface SecretOfRain_AboutViewController ()

@end

@implementation SecretOfRain_AboutViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"About";
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)goToPrivacy:(id)sender {
    [NSObject SecretOfRain_findFromeController:self];
}

@end
