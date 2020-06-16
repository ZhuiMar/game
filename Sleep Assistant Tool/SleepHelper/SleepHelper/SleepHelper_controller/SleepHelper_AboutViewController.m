//
//  SleepHelper_AboutViewController.m
//  SleepHelper
//
//  Created by zy on 2020/5/18.
//  Copyright © 2020 tianma. All rights reserved.
//

#import "SleepHelper_AboutViewController.h"

@interface SleepHelper_AboutViewController ()

@property (weak, nonatomic) IBOutlet UIView *aboutBg;
@property (weak, nonatomic) IBOutlet UILabel *versonLabel;

@end

@implementation SleepHelper_AboutViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"About";

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.aboutBg.layer.cornerRadius = 20;
    self.aboutBg.layer.masksToBounds = YES;
    self.aboutBg.layer.borderWidth = 1;
    self.aboutBg.layer.borderColor = [NSObject SleepHelper_colorWithHexString:@"#D1DFE2"].CGColor;
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
    self.versonLabel.text = [NSString stringWithFormat:@"V %@",app_Version];
}

@end
