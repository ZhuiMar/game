//
//  SleepHelper_SetViewController.m
//  SleepHelper
//
//  Created by zy on 2020/5/18.
//  Copyright © 2020 tianma. All rights reserved.
//

#import "SleepHelper_SetViewController.h"

@interface SleepHelper_SetViewController ()

@property (weak, nonatomic) IBOutlet UIButton *cleanColor;
@property (weak, nonatomic) IBOutlet UIButton *aboutAction;

@property (weak, nonatomic) IBOutlet UIView *cleanBg;
@property (weak, nonatomic) IBOutlet UIView *aboutBg;

@end

@implementation SleepHelper_SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.cleanBg.layer.cornerRadius = 8;
    self.cleanBg.layer.masksToBounds = YES;
    self.cleanBg.layer.borderWidth = 1;
    self.cleanBg.layer.borderColor = [NSObject SleepHelper_colorWithHexString:@"#D5E5E8"].CGColor;

    self.aboutBg.layer.cornerRadius = 8;
    self.aboutBg.layer.masksToBounds = YES;
    self.aboutBg.layer.borderWidth = 1;
    self.aboutBg.layer.borderColor = [NSObject SleepHelper_colorWithHexString:@"#D5E5E8"].CGColor;
    
    
}

- (IBAction)cleanAction:(id)sender {
    SleepHelper_AlertViewController *controller = [[SleepHelper_AlertViewController alloc]initWithCancelBlock:^{
        
    } OkBlock:^{
        
    }];
    [self yc_centerPresentController:controller presentedSize:CGSizeMake(300, 150) completeHandle:nil];
}

- (IBAction)aboutAction:(id)sender {
    SleepHelper_AboutViewController *vc = [[SleepHelper_AboutViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
