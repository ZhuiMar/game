//
//  SecretOfRain_TipViewController.m
//  SecretOfRain
//
//  Created by zy on 2020/4/27.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "SecretOfRain_TipViewController.h"

@interface SecretOfRain_TipViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *width;

@property(nonatomic, copy) SecretOfRain_OKAction ok;

@end

@implementation SecretOfRain_TipViewController

- (instancetype)initWithOkAction:(SecretOfRain_OKAction)ok{
    if(self = [super init]){
        self.ok = ok;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    
    if kiPhone5 {
        self.width.constant = 300;
        self.height.constant = 350;
    }
}

- (IBAction)OKAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.ok){
        self.ok();
    }
}

@end
