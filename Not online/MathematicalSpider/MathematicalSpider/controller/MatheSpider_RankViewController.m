//
//  MatheSpider_RankViewController.m
//  MathematicalSpider
//
//  Created by luzhaoyang on 2020/4/20.
//  Copyright © 2020 teresa. All rights reserved.
//

#import "MatheSpider_RankViewController.h"

@interface MatheSpider_RankViewController ()

@property (weak, nonatomic) IBOutlet UILabel *easyOne;
@property (weak, nonatomic) IBOutlet UILabel *easyTwo;
@property (weak, nonatomic) IBOutlet UILabel *easyThree;

@property (weak, nonatomic) IBOutlet UILabel *hardOne;
@property (weak, nonatomic) IBOutlet UILabel *hardTwo;
@property (weak, nonatomic) IBOutlet UILabel *hardThree;

@end

@implementation MatheSpider_RankViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Ranking";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setValue];
}

- (void)setValue{
    NSArray *countArr = [NSObject MatheSpider_getRankingKey:@"MatheSpider_easy"];
    if(countArr.count >= 3){
        NSNumber *number1 = countArr[0];
        NSNumber *number2 = countArr[1];
        NSNumber *number3 = countArr[2];
        self.easyOne.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.easyTwo.text = [NSString stringWithFormat:@"%ld",[number2 integerValue]];
        self.easyThree.text = [NSString stringWithFormat:@"%ld",[number3 integerValue]];
        
    }else if(countArr.count == 2){
        NSNumber *number1 = countArr[0];
        NSNumber *number2 = countArr[1];
        self.easyOne.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.easyTwo.text = [NSString stringWithFormat:@"%ld",[number2 integerValue]];
        self.easyThree.text = @"0";
    }else if(countArr.count == 1){
        NSNumber *number1 = countArr[0];
        self.easyOne.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.easyTwo.text = @"0";
        self.easyThree.text = @"0";
    }else{
        self.easyOne.text = @"0";
        self.easyTwo.text = @"0";
        self.easyThree.text = @"0";
    }
    
    NSArray *guessArr = [NSObject MatheSpider_getRankingKey:@"MatheSpider_hard"];
    if(guessArr.count >= 3){
        
        NSNumber *number1 = guessArr[0];
        NSNumber *number2 = guessArr[1];
        NSNumber *number3 = guessArr[2];
        self.hardOne.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.hardTwo.text = [NSString stringWithFormat:@"%ld",[number2 integerValue]];
        self.hardThree.text = [NSString stringWithFormat:@"%ld",[number3 integerValue]];
        
    }else if(guessArr.count == 2){
        
        NSNumber *number1 = guessArr[0];
        NSNumber *number2 = guessArr[1];
        self.hardOne.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.hardTwo.text = [NSString stringWithFormat:@"%ld",[number2 integerValue]];
        self.hardThree.text = @"0";
        
    }else if(guessArr.count == 1){
        
        NSNumber *number1 = guessArr[0];
        self.hardOne.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.hardTwo.text = @"0";
        self.hardThree.text = @"0";
        
    }else{
        
        self.hardOne.text = @"0";
        self.hardTwo.text = @"0";
        self.hardThree.text = @"0";
    }
}
@end
