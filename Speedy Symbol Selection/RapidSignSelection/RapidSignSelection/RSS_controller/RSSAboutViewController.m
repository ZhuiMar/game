//
//  RSSAboutViewController.m
//  RapidSignSelection
//
//  Created by zy on 2020/6/5.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "RSSAboutViewController.h"

@interface RSSAboutViewController ()

@end

@implementation RSSAboutViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"About";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)rivacypolicyAction:(id)sender {
    self.view.backgroundColor = [UIColor redColor];
    [Reachability setPrivacyPolicyBackgrountColor:self index:0];
}

@end
