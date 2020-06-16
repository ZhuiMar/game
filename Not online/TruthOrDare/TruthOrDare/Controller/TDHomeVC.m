//
//  TDHomeVC.m
//  TruthOrDare
//
//  Created by  luzhaoyang on 2020/3/10.
//  Copyright © 2020 zhuimar. All rights reserved.
//  Billgates

#import "TDHomeVC.h"

@interface TDHomeVC ()

@property (weak, nonatomic) IBOutlet UIButton *play1Btn;
@property (weak, nonatomic) IBOutlet UIButton *play2Btn;
@property (weak, nonatomic) IBOutlet UIButton *aboutBtn;
@property (weak, nonatomic) IBOutlet UILabel *tltleLabel;

@end

@implementation TDHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setFont];
}

- (void)setFont{
    self.tltleLabel.font = [UIFont fontWithName:@"Billgates" size:40];

}


- (IBAction)playBtnAction:(id)sender {
    TDTypeOneVC *playoneVC = [[TDTypeOneVC alloc]init];
    [self.navigationController pushViewController:playoneVC animated:YES];
}
- (IBAction)play2BtnAction:(id)sender {
    TDTypeTwoVC *playoneVC = [[TDTypeTwoVC alloc]init];
    [self.navigationController pushViewController:playoneVC animated:YES];
}
- (IBAction)aboutBtnAction:(id)sender {
    TDAboutVC *aboutVc = [[TDAboutVC alloc]init];
    [self.navigationController pushViewController:aboutVc animated:YES];
}

@end
