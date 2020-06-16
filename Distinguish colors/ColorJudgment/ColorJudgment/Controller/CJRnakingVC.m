//
//  CJRnakingVC.m
//  ColorJudgment
//
//  Created by  luzhaoyang on 2020/3/17.
//  Copyright © 2020 haike. All rights reserved.
//

#import "CJRnakingVC.h"

@interface CJRnakingVC ()

@property (weak, nonatomic) IBOutlet UILabel *easy;
@property (weak, nonatomic) IBOutlet UILabel *hard;

@property (weak, nonatomic) IBOutlet UILabel *eOneK;
@property (weak, nonatomic) IBOutlet UILabel *eTwoKey;
@property (weak, nonatomic) IBOutlet UILabel *eThreeKey;

@property (weak, nonatomic) IBOutlet UILabel *eOneV;
@property (weak, nonatomic) IBOutlet UILabel *eTwoV;
@property (weak, nonatomic) IBOutlet UILabel *eThreeV;

@property (weak, nonatomic) IBOutlet UILabel *hOneK;
@property (weak, nonatomic) IBOutlet UILabel *hTwoK;
@property (weak, nonatomic) IBOutlet UILabel *hThreeK;

@property (weak, nonatomic) IBOutlet UILabel *hOneV;
@property (weak, nonatomic) IBOutlet UILabel *hTwoV;
@property (weak, nonatomic) IBOutlet UILabel *hThreeV;


@end

@implementation CJRnakingVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"ranking";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setFont];
    [self setValue];
}

- (void)setFont{
    
    self.easy.font = [UIFont fontWithName:FontName size:24];
    self.hard.font = [UIFont fontWithName:FontName size:24];
    
    self.eOneK.font = [UIFont fontWithName:FontName size:18];
    self.eTwoKey.font = [UIFont fontWithName:FontName size:18];
    self.eThreeKey.font = [UIFont fontWithName:FontName size:18];
    self.eOneV.font = [UIFont fontWithName:FontName size:18];
    self.eTwoV.font = [UIFont fontWithName:FontName size:18];
    self.eThreeV.font = [UIFont fontWithName:FontName size:18];
    
    self.hOneK.font = [UIFont fontWithName:FontName size:18];
    self.hTwoK.font = [UIFont fontWithName:FontName size:18];
    self.hThreeK.font = [UIFont fontWithName:FontName size:18];
    self.hOneV.font = [UIFont fontWithName:FontName size:18];
    self.hTwoV.font = [UIFont fontWithName:FontName size:18];
    self.hThreeV.font = [UIFont fontWithName:FontName size:18];
}

- (void)setValue{
    NSArray *countArr = [NSString getRankingKey:@"CJEasy_type"];
    if(countArr.count >= 3){
        NSNumber *number1 = countArr[0];
        NSNumber *number2 = countArr[1];
        NSNumber *number3 = countArr[2];
        self.eOneV.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.eTwoV.text = [NSString stringWithFormat:@"%ld",[number2 integerValue]];
        self.eThreeV.text = [NSString stringWithFormat:@"%ld",[number3 integerValue]];
        
    }else if(countArr.count == 2){
        NSNumber *number1 = countArr[0];
        NSNumber *number2 = countArr[1];
        self.eOneV.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.eTwoV.text = [NSString stringWithFormat:@"%ld",[number2 integerValue]];
        self.eThreeV.text = @"0";
    }else if(countArr.count == 1){
        NSNumber *number1 = countArr[0];
        self.eOneV.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.eTwoV.text = @"0";
        self.eThreeV.text = @"0";
    }else{
        self.eOneV.text = @"0";
        self.eTwoV.text = @"0";
        self.eThreeV.text = @"0";
    }
    
    NSArray *guessArr = [NSString getRankingKey:@"CJHard_type"];
    if(guessArr.count >= 3){
        
        NSNumber *number1 = guessArr[0];
        NSNumber *number2 = guessArr[1];
        NSNumber *number3 = guessArr[2];
        self.hOneV.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.hTwoV.text = [NSString stringWithFormat:@"%ld",[number2 integerValue]];
        self.hThreeV.text = [NSString stringWithFormat:@"%ld",[number3 integerValue]];
        
    }else if(guessArr.count == 2){
        
        NSNumber *number1 = guessArr[0];
        NSNumber *number2 = guessArr[1];
        self.hOneV.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.hTwoV.text = [NSString stringWithFormat:@"%ld",[number2 integerValue]];
        self.hThreeV.text = @"0";
        
    }else if(guessArr.count == 1){
        
        NSNumber *number1 = guessArr[0];
        self.hOneV.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.hTwoV.text = @"0";
        self.hThreeV.text = @"0";
    }else{
        
        self.hOneV.text = @"0";
        self.hTwoV.text = @"0";
        self.hThreeV.text = @"0";
    }
}

@end
