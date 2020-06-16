//
//  CJRulesVC.m
//  ColorJudgment
//
//  Created by  luzhaoyang on 2020/3/17.
//  Copyright © 2020 haike. All rights reserved.
//

#import "CJRulesVC.h"

@interface CJRulesVC ()

@property (weak, nonatomic) IBOutlet UIButton *okBtn;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;

@end

@implementation CJRulesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
}

- (IBAction)okBtnAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.delegate okAction];
}

- (IBAction)startBtnAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.delegate startAction];
}

@end
