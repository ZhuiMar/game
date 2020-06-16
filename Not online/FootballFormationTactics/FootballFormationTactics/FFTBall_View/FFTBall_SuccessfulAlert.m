//
//  FFTBall_SuccessfulAlert.m
//  FootballFormationTactics
//
//  Created by zy on 2020/5/29.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import "FFTBall_SuccessfulAlert.h"
#import "UIColor+MBBall_color.h"

@interface FFTBall_SuccessfulAlert ()

@property (weak, nonatomic) IBOutlet UILabel *tittle;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@property (copy, nonatomic) FFTBall_SuccessfulAlertBlock cancel;
@property (copy, nonatomic) FFTBall_SuccessfulAlertBlock add;

@end

@implementation FFTBall_SuccessfulAlert

- (instancetype)initWithCancel:(FFTBall_SuccessfulAlertBlock)cancel newAc:(FFTBall_SuccessfulAlertBlock)newAc{
    if(self = [super init]){
        self.cancel = cancel;
        self.add = newAc;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _tittle.font = [UIFont fontWithName:TEXTFONT size:20];
    _content.font = [UIFont fontWithName:TEXTFONT size:15];
    self.cancelBtn.titleLabel.font = [UIFont fontWithName:TEXTFONT size:17];
    self.addBtn.titleLabel.font = [UIFont fontWithName:TEXTFONT size:17];
    [self.cancelBtn setTitleColor:[UIColor FFTBall_colorWithHexString:@"#FFBD56"] forState:UIControlStateNormal];
    
    self.view.layer.cornerRadius = 18;
    self.view.layer.masksToBounds = YES;
}
- (IBAction)addAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.add){
        self.add();
    }
}
- (IBAction)cancelAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.cancel){
        self.cancel();
    }
}

@end
