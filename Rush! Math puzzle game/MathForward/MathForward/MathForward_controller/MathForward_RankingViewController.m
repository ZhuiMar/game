//
//  MathForward_RankingViewController.m
//  MathForward
//
//  Created by luzhaoyang on 2020/4/21.
//  Copyright © 2020 teresa. All rights reserved.
//

#import "MathForward_RankingViewController.h"

@interface MathForward_RankingViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lone;
@property (weak, nonatomic) IBOutlet UILabel *ltwo;
@property (weak, nonatomic) IBOutlet UILabel *lthree;

@property (weak, nonatomic) IBOutlet UILabel *eoNE;
@property (weak, nonatomic) IBOutlet UILabel *eTwo;
@property (weak, nonatomic) IBOutlet UILabel *eThree;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *H;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *W;

@end

@implementation MathForward_RankingViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"ranking";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setValue];
    
    if kiPhone5 {
        self.W.constant = 230;
        self.H.constant = 180;
    }
}

- (void)setValue{
    
    NSArray *endless = [NSObject MathForward_getRankingKey:@"MathForward_easy"];
    
    if(endless.count >= 3){
        
        self.lone.text = [NSString stringWithFormat:@"%ld",[endless[0] integerValue]];
        self.ltwo.text = [NSString stringWithFormat:@"%ld",[endless[1] integerValue]];
        self.lthree.text = [NSString stringWithFormat:@"%ld",[endless[2] integerValue]];
        
    }else if (endless.count == 2){
        self.lone.text = [NSString stringWithFormat:@"%@",endless[0]];
        self.ltwo.text = [NSString stringWithFormat:@"%@",endless[1]];
        self.lthree.text = @"0";
    }else if (endless.count == 1){
        self.lone.text = [NSString stringWithFormat:@"%@",endless[0]];
        self.ltwo.text = @"0";
        self.lthree.text = @"0";
    }else{
        self.lone.text = @"0";
        self.ltwo.text = @"0";
        self.lthree.text = @"0";
    }
    
    NSArray *level = [NSObject MathForward_getRankingKey:@"MathForward_hard"];
    
    if(level.count >= 3){
        self.eoNE.text = [NSString stringWithFormat:@"Level %@",level[0]];
        self.eTwo.text = [NSString stringWithFormat:@"Level %@",level[1]];
        self.eThree.text = [NSString stringWithFormat:@"Level %@",level[2]];
        
    }else if (level.count == 2){
        
        self.eoNE.text = [NSString stringWithFormat:@"Level %@",level[0]];
        self.eTwo.text = [NSString stringWithFormat:@"Level %@",level[1]];
        self.eThree.text = @"0";
        
    }else if (level.count == 1){
        
        self.eoNE.text = [NSString stringWithFormat:@"Level %@",level[0]];
        self.eTwo.text = @"0";
        self.eThree.text = @"0";
        
    }else{
        self.eoNE.text = @"0";
        self.eTwo.text = @"0";
        self.eThree.text = @"0";
    }
}

@end
