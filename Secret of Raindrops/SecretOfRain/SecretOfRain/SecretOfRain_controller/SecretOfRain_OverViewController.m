//
//  SecretOfRain_OverViewController.m
//  SecretOfRain
//
//  Created by zy on 2020/4/27.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "SecretOfRain_OverViewController.h"

@interface SecretOfRain_OverViewController ()

@property (weak, nonatomic) IBOutlet UILabel *scor;

@property (nonatomic, assign) NSInteger level;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, assign) BOOL tip;

@property (nonatomic, copy) SecretOfRain_OverBlcok home;
@property (nonatomic, copy) SecretOfRain_OverBlcok again;
@property (nonatomic, copy) SecretOfRain_OverBlcok card;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *wight;

@end

@implementation SecretOfRain_OverViewController

- (instancetype)initWithScore:(NSInteger)score type:(NSInteger)type isSu:(BOOL)isSu home:(SecretOfRain_OverBlcok)home again:(SecretOfRain_OverBlcok)again card:(SecretOfRain_OverBlcok)card{
    if(self = [super init]){
        self.level = type;
        self.score = score;
        self.tip = isSu;
        self.home = home;
        self.card = card;
        self.again = again;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    self.scor.text = [NSString stringWithFormat:@"%ld",self.score];
    
    if kiPhone5 {
        self.height.constant = 240;
        self.wight.constant = 250;
    }
}

- (IBAction)againAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.again){
        self.again();
    }
}
- (IBAction)cardAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.card){
        self.card();
    }
}
- (IBAction)homeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.home){
        self.home();
    }
}

@end
