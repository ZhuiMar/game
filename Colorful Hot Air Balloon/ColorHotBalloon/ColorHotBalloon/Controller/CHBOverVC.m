//
//  CHBOverVC.m
//  ColorHotBalloon
//
//  Created by  luzhaoyang on 2020/3/9.
//  Copyright © 2020 zhuimar. All rights reserved.
//

#import "CHBOverVC.h"
#import "myPch.pch"

@interface CHBOverVC ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *soucreCount;
@property (weak, nonatomic) IBOutlet UIButton *homeBtn;
@property (weak, nonatomic) IBOutlet UIButton *again;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *withLayout;

@property (nonatomic,assign) NSInteger num;

@end

@implementation CHBOverVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if kiPhone5 {
        self.withLayout.constant = 300;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    self.titleLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:37];
    self.subTitleLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:27];
    self.soucreCount.font = [UIFont fontWithName:@"Pangolin-Regular" size:40];
    
    [self.homeBtn setTitle:@"Home" forState:UIControlStateNormal];
    self.homeBtn.titleLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:20];
    
    [self.again setTitle:@"Again" forState:UIControlStateNormal];
    self.again.titleLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:20];
    self.soucreCount.text = [NSString stringWithFormat:@"%ld",self.num];
}

- (IBAction)homeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.delegate homeOverVCAction];
}
- (IBAction)againAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.delegate agianOverVCAction];
}
- (instancetype)initWithSocre:(NSInteger)num{
    self = [super init];
    if(self){
        self.num = num;
    }
    return self;
}

@end
