//
//  ArithmeticMagicCup_OverVC.m
//  ArithmeticMagicCup
//
//  Created by zy on 2020/4/24.
//  Copyright © 2020 qingmai. All rights reserved.
//

#import "ArithmeticMagicCup_OverVC.h"

@interface ArithmeticMagicCup_OverVC ()

@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UIButton *againBtn;
@property (weak, nonatomic) IBOutlet UIButton *homebtn;

@property(nonatomic, copy)ArithmeticMagicCup_Over home;
@property(nonatomic, copy)ArithmeticMagicCup_Over again;
@property(nonatomic, assign)NSInteger state;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;

@end

@implementation ArithmeticMagicCup_OverVC

- (instancetype)initWithState:(NSInteger)state home:(ArithmeticMagicCup_Over)home again:(ArithmeticMagicCup_Over)again{
    if(self = [super init]){
        self.home = home;
        self.again = again;
        self.state = state;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    
    self.homebtn.layer.cornerRadius = 10;
    self.homebtn.layer.masksToBounds = YES;
    self.againBtn.layer.cornerRadius = 10;
    self.againBtn.layer.masksToBounds = YES;
    
    self.stateLabel.text = [NSString stringWithFormat:@"Stage %ld",self.state];
    if kiPhone5 {
        self.topLayout.constant = 40;
    }
}

- (IBAction)againActin:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if (self.again) {
        self.again();
    }
}
- (IBAction)homeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.home){
        self.home();
    }
}

@end
