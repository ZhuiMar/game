//
//  ArithmeticMagicCup_CupVC.m
//  ArithmeticMagicCup
//
//  Created by zy on 2020/4/23.
//  Copyright © 2020 qingmai. All rights reserved.
//

#import "ArithmeticMagicCup_CupVC.h"

@interface ArithmeticMagicCup_CupVC ()

@property (weak, nonatomic) IBOutlet UIButton *cupOne;
@property (weak, nonatomic) IBOutlet UIButton *cupTwo;
@property (weak, nonatomic) IBOutlet UIButton *cupThree;

@property (weak, nonatomic) IBOutlet UIButton *onebtn;
@property (weak, nonatomic) IBOutlet UIButton *twoBtn;
@property (weak, nonatomic) IBOutlet UIButton *threeBtn;

@property (weak, nonatomic) IBOutlet UIView *onebgView;
@property (weak, nonatomic) IBOutlet UIImageView *twoBgView;
@property (weak, nonatomic) IBOutlet UIView *threeBgView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *H;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *W;

@end

@implementation ArithmeticMagicCup_CupVC


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Cup";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:FontName size:TitleSize],NSForegroundColorAttributeName:[UIColor blackColor]}];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.onebgView.layer.cornerRadius = 20;
    self.onebgView.layer.masksToBounds = YES;
    self.twoBgView.layer.cornerRadius = 20;
    self.twoBgView.layer.masksToBounds = YES;
    self.threeBgView.layer.cornerRadius = 20;
    self.threeBgView.layer.masksToBounds = YES;
    
    NSNumber *number = [[NSUserDefaults standardUserDefaults] objectForKey:@"Cup_useing"];
    NSInteger numberType = [number integerValue];
    if(numberType == 1){
        self.onebgView.layer.borderColor = [NSObject ArithmeticMagicCup_colorWithHexString:@"#FF834C"].CGColor;
        self.onebgView.layer.borderWidth = 5;
    }
    if (numberType == 2){
        self.twoBgView.layer.borderColor = [NSObject ArithmeticMagicCup_colorWithHexString:@"#FF834C"].CGColor;
        self.twoBgView.layer.borderWidth = 5;
    }
    if (numberType == 3){
        self.threeBgView.layer.borderColor = [NSObject ArithmeticMagicCup_colorWithHexString:@"#FF834C"].CGColor;
        self.threeBgView.layer.borderWidth = 5;
    }
    
    NSArray *hard = [NSObject ArithmeticMagicCup_getRankingKey:@"ArithmeticMagicCup_hard"];
    NSArray *easy = [NSObject ArithmeticMagicCup_getRankingKey:@"ArithmeticMagicCup_easy"];
    
    NSNumber *one = easy.firstObject;
    NSNumber *two = hard.firstObject;
    
    NSInteger big = 0;
    if([one integerValue] > [two integerValue]){
        big = [one integerValue];
    }else{
        big = [two integerValue];
    }
    
    if(big >= 10){
        [self.cupTwo setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
    if(big >= 20){
        [self.cupTwo setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [self.cupThree setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
    
    if kiPhone5 {
        self.W.constant = 160;
    }
}

- (IBAction)oneActio:(id)sender {
    [[NSUserDefaults standardUserDefaults] setObject:@(1) forKey:@"Cup_useing"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.onebgView.layer.borderColor = [NSObject ArithmeticMagicCup_colorWithHexString:@"#FF834C"].CGColor;
    self.onebgView.layer.borderWidth = 5;
    
    self.twoBgView.layer.borderWidth = 0;
    self.threeBgView.layer.borderWidth = 0;
}

- (IBAction)twoAction:(id)sender {
    
    NSArray *hard = [NSObject ArithmeticMagicCup_getRankingKey:@"ArithmeticMagicCup_hard"];
    NSArray *easy = [NSObject ArithmeticMagicCup_getRankingKey:@"ArithmeticMagicCup_easy"];
    
    NSNumber *one = easy.firstObject;
    NSNumber *two = hard.firstObject;
    
    NSInteger big = 0;
    if([one integerValue] > [two integerValue]){
        big = [one integerValue];
    }else{
        big = [two integerValue];
    }
    
    if(big >= 10){
        [[NSUserDefaults standardUserDefaults] setObject:@(2) forKey:@"Cup_useing"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        self.twoBgView.layer.borderColor = [NSObject ArithmeticMagicCup_colorWithHexString:@"#FF834C"].CGColor;
        self.twoBgView.layer.borderWidth = 5;
        
        self.onebgView.layer.borderWidth = 0;
        self.threeBgView.layer.borderWidth = 0;
    }
}
- (IBAction)threeAction:(id)sender {
    
    NSArray *hard = [NSObject ArithmeticMagicCup_getRankingKey:@"ArithmeticMagicCup_hard"];
    NSArray *easy = [NSObject ArithmeticMagicCup_getRankingKey:@"ArithmeticMagicCup_easy"];
    
    NSNumber *one = easy.firstObject;
    NSNumber *two = hard.firstObject;
    
    NSInteger big = 0;
    if([one integerValue] > [two integerValue]){
        big = [one integerValue];
    }else{
        big = [two integerValue];
    }
    
    if(big >= 20){
        [[NSUserDefaults standardUserDefaults] setObject:@(3) forKey:@"Cup_useing"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        self.threeBgView.layer.borderColor = [NSObject ArithmeticMagicCup_colorWithHexString:@"#FF834C"].CGColor;
        self.threeBgView.layer.borderWidth = 5;
        
        self.onebgView.layer.borderWidth = 0;
        self.twoBgView.layer.borderWidth = 0;
    }
}
@end
