//
//  CHBrecordVC.m
//  ColorHotBalloon
//
//  Created by  luzhaoyang on 2020/3/9.
//  Copyright © 2020 zhuimar. All rights reserved.
//

#import "CHBrecordVC.h"
#import "NSString+record.h"
#import "myPch.pch"

@interface CHBrecordVC ()

@property (weak, nonatomic) IBOutlet UILabel *count;
@property (weak, nonatomic) IBOutlet UILabel *countRanking;
@property (weak, nonatomic) IBOutlet UILabel *countScore;

@property (weak, nonatomic) IBOutlet UILabel *guess;
@property (weak, nonatomic) IBOutlet UILabel *guessRanking;
@property (weak, nonatomic) IBOutlet UILabel *guessScore;

@property (weak, nonatomic) IBOutlet UILabel *countKey1;
@property (weak, nonatomic) IBOutlet UILabel *countKey2;
@property (weak, nonatomic) IBOutlet UILabel *countKey3;

@property (weak, nonatomic) IBOutlet UILabel *countValu1;
@property (weak, nonatomic) IBOutlet UILabel *countValu2;
@property (weak, nonatomic) IBOutlet UILabel *countValu3;

@property (weak, nonatomic) IBOutlet UILabel *guessKey1;
@property (weak, nonatomic) IBOutlet UILabel *guessKey2;
@property (weak, nonatomic) IBOutlet UILabel *guessKey3;

@property (weak, nonatomic) IBOutlet UILabel *guessValue1;
@property (weak, nonatomic) IBOutlet UILabel *guessValu3;
@property (weak, nonatomic) IBOutlet UILabel *guessValu2;
@property (weak, nonatomic) IBOutlet UILabel *buttomLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *middleLayout;

@end

@implementation CHBrecordVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"My record";
    
    if kiPhone5 {
        self.topLayout.constant = 70;
        self.bottomLayout.constant = 10;
        self.middleLayout.constant = 10;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setFont];
    [self setValue];
}

- (void)setValue{
    NSArray *countArr = [NSString getRankingKey:@"Count_type"];
    if(countArr.count >= 3){
        NSNumber *number1 = countArr[0];
        NSNumber *number2 = countArr[1];
        NSNumber *number3 = countArr[2];
        self.countValu1.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.countValu2.text = [NSString stringWithFormat:@"%ld",[number2 integerValue]];
        self.countValu3.text = [NSString stringWithFormat:@"%ld",[number3 integerValue]];
        
    }else if(countArr.count == 2){
        NSNumber *number1 = countArr[0];
        NSNumber *number2 = countArr[1];
        self.countValu1.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.countValu2.text = [NSString stringWithFormat:@"%ld",[number2 integerValue]];
        self.countValu3.text = @"0";
    }else if(countArr.count == 1){
        NSNumber *number1 = countArr[0];
        self.countValu1.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.countValu2.text = @"0";
        self.countValu3.text = @"0";
    }else{
        self.countValu1.text = @"0";
        self.countValu2.text = @"0";
        self.countValu3.text = @"0";
    }
    
    NSArray *guessArr = [NSString getRankingKey:@"Guess_type"];
    if(guessArr.count >= 3){
        
        NSNumber *number1 = guessArr[0];
        NSNumber *number2 = guessArr[1];
        NSNumber *number3 = guessArr[2];
        self.guessValue1.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.guessValu2.text = [NSString stringWithFormat:@"%ld",[number2 integerValue]];
        self.guessValu3.text = [NSString stringWithFormat:@"%ld",[number3 integerValue]];
        
    }else if(guessArr.count == 2){
        
        NSNumber *number1 = guessArr[0];
        NSNumber *number2 = guessArr[1];
        self.guessValue1.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.guessValu2.text = [NSString stringWithFormat:@"%ld",[number2 integerValue]];
        self.guessValu3.text = @"0";
        
    }else if(guessArr.count == 1){
        
        NSNumber *number1 = guessArr[0];
        self.guessValue1.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.guessValu2.text = @"0";
        self.guessValu3.text = @"0";
    }else{
        
        self.guessValue1.text = @"0";
        self.guessValu2.text = @"0";
        self.guessValu3.text = @"0";
    }
}

- (void)setFont{
    
    self.count.font = [UIFont fontWithName:@"Pangolin-Regular" size:27];
    self.guess.font = [UIFont fontWithName:@"Pangolin-Regular" size:27];
    self.countRanking.font = [UIFont fontWithName:@"Pangolin-Regular" size:24];
    self.guessRanking.font = [UIFont fontWithName:@"Pangolin-Regular" size:24];
    self.countScore.font = [UIFont fontWithName:@"Pangolin-Regular" size:24];
    self.guessScore.font = [UIFont fontWithName:@"Pangolin-Regular" size:24];
    
    self.countKey1.font = [UIFont fontWithName:@"Pangolin-Regular" size:24];
    self.countKey2.font = [UIFont fontWithName:@"Pangolin-Regular" size:24];
    self.countKey3.font = [UIFont fontWithName:@"Pangolin-Regular" size:24];
    self.guessKey1.font = [UIFont fontWithName:@"Pangolin-Regular" size:24];
    self.guessKey2.font = [UIFont fontWithName:@"Pangolin-Regular" size:24];
    self.guessKey3.font = [UIFont fontWithName:@"Pangolin-Regular" size:24];

    self.guessValue1.font = [UIFont fontWithName:@"Pangolin-Regular" size:24];
    self.guessValu2.font = [UIFont fontWithName:@"Pangolin-Regular" size:24];
    self.guessValu3.font = [UIFont fontWithName:@"Pangolin-Regular" size:24];
    self.countValu1.font = [UIFont fontWithName:@"Pangolin-Regular" size:24];
    self.countValu2.font = [UIFont fontWithName:@"Pangolin-Regular" size:24];
    self.countValu3.font = [UIFont fontWithName:@"Pangolin-Regular" size:24];
    
    self.buttomLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:24];
}

@end
