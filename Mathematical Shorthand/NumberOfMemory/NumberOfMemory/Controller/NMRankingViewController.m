//
//  NMRankingViewController.m
//  NumberOfMemory
//
//  Created by  luzhaoyang on 2020/4/2.
//  Copyright © 2020 huadu. All rights reserved.
//

#import "NMRankingViewController.h"

@interface NMRankingViewController ()

@property (weak, nonatomic) IBOutlet UILabel *easy;
@property (weak, nonatomic) IBOutlet UILabel *hard;

@property (weak, nonatomic) IBOutlet UILabel *EoneK;
@property (weak, nonatomic) IBOutlet UILabel *EtwoK;
@property (weak, nonatomic) IBOutlet UILabel *EthreeK;
@property (weak, nonatomic) IBOutlet UILabel *EfourK;
@property (weak, nonatomic) IBOutlet UILabel *EfiveK;

@property (weak, nonatomic) IBOutlet UILabel *EoneV;
@property (weak, nonatomic) IBOutlet UILabel *EtwoV;
@property (weak, nonatomic) IBOutlet UILabel *EthreeV;
@property (weak, nonatomic) IBOutlet UILabel *EfourV;
@property (weak, nonatomic) IBOutlet UILabel *EfiveV;


@property (weak, nonatomic) IBOutlet UILabel *HoneK;
@property (weak, nonatomic) IBOutlet UILabel *HtwoK;
@property (weak, nonatomic) IBOutlet UILabel *HthreeK;
@property (weak, nonatomic) IBOutlet UILabel *HfourK;
@property (weak, nonatomic) IBOutlet UILabel *HfiveK;

@property (weak, nonatomic) IBOutlet UILabel *HoneV;
@property (weak, nonatomic) IBOutlet UILabel *HtwoV;
@property (weak, nonatomic) IBOutlet UILabel *HthreeV;
@property (weak, nonatomic) IBOutlet UILabel *HfourV;
@property (weak, nonatomic) IBOutlet UILabel *HfiveV;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *easyTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hardTop;


@end

@implementation NMRankingViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Ranking";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setFont];
    [self setValue];
    
    if kiPhone5 {
        self.easyTop.constant = 25;
        self.hardTop.constant = 25;
    }
}

- (void)setFont{
    
    self.easy.font = [UIFont fontWithName:FontName size:30];
    self.hard.font = [UIFont fontWithName:FontName size:30];
    
    self.EoneK.font = [UIFont fontWithName:FontName size:25];
    self.EtwoK.font = [UIFont fontWithName:FontName size:25];
    self.EthreeK.font = [UIFont fontWithName:FontName size:25];
    self.EfourK.font = [UIFont fontWithName:FontName size:25];
    self.EfiveK.font = [UIFont fontWithName:FontName size:25];
    self.EoneV.font = [UIFont fontWithName:FontName size:25];
    self.EtwoV.font = [UIFont fontWithName:FontName size:25];
    self.EthreeV.font = [UIFont fontWithName:FontName size:25];
    self.EfourV.font = [UIFont fontWithName:FontName size:25];
    self.EfiveV.font = [UIFont fontWithName:FontName size:25];
    
    self.HoneK.font = [UIFont fontWithName:FontName size:25];
    self.HtwoK.font = [UIFont fontWithName:FontName size:25];
    self.HthreeK.font = [UIFont fontWithName:FontName size:25];
    self.HfourK.font = [UIFont fontWithName:FontName size:25];
    self.HfiveK.font = [UIFont fontWithName:FontName size:25];
    self.HoneV.font = [UIFont fontWithName:FontName size:25];
    self.HtwoV.font = [UIFont fontWithName:FontName size:25];
    self.HthreeV.font = [UIFont fontWithName:FontName size:25];
    self.HfourV.font = [UIFont fontWithName:FontName size:25];
    self.HfiveV.font = [UIFont fontWithName:FontName size:25];
}

- (void)setValue{

    NSNumber *number = [[NSUserDefaults standardUserDefaults] objectForKey:@"easy_ranking"];
    NSInteger num = [number integerValue];
    
    if(num >= 5){
    
        self.EoneV.text = @"Level1";
        self.EtwoV.text = @"Level2";
        self.EthreeV.text = @"Level3";
        self.EfourV.text = @"Level4";
        self.EfiveV.text = @"Level5";
    }
    else if (num == 4){
        self.EoneV.text = @"Level1";
        self.EtwoV.text = @"Level2";
        self.EthreeV.text = @"Level3";
        self.EfourV.text = @"Level4";
        self.EfiveV.text = @"0";
    }
    else if(num == 3){
        self.EoneV.text = @"Level1";
        self.EtwoV.text = @"Level2";
        self.EthreeV.text = @"Level3";
        self.EfourV.text = @"0";
        self.EfiveV.text = @"0";
    }
    else if(num == 2){
        self.EoneV.text = @"Level1";
        self.EtwoV.text = @"Level2";
        self.EthreeV.text = @"0";
        self.EfourV.text = @"0";
        self.EfiveV.text = @"0";
    }
    else if(num == 1){
        self.EoneV.text = @"Level1";
        self.EtwoV.text = @"0";
        self.EthreeV.text = @"0";
        self.EfourV.text = @"0";
        self.EfiveV.text = @"0";
    }
    else{
        self.EoneV.text = @"0";
        self.EtwoV.text = @"0";
        self.EthreeV.text = @"0";
        self.EfourV.text = @"0";
        self.EfiveV.text = @"0";
    }
    
    NSNumber *number1 = [[NSUserDefaults standardUserDefaults] objectForKey:@"hard_ranking"];
    NSInteger num1 = [number1 integerValue];
    
    if(num1 >= 5){
       
        self.HoneV.text = @"Level1";
        self.HtwoV.text = @"Level2";
        self.HthreeV.text = @"Level3";
        self.HfourV.text = @"Level4";
        self.HfiveV.text = @"Level5";
    }
    else if (num1 == 4){
        self.HoneV.text = @"Level1";
        self.HtwoV.text = @"Level2";
        self.HthreeV.text = @"Level3";
        self.HfourV.text = @"Level4";
        self.HfiveV.text = @"0";
    }
    else if(num1 == 3){
        
        self.HoneV.text = @"Level1";
        self.HtwoV.text = @"Level2";
        self.HthreeV.text = @"Level3";
        self.HfourV.text = @"0";
        self.HfiveV.text = @"0";
        
    }else if(num1 == 2){
        
        self.HoneV.text = @"Level1";
        self.HtwoV.text = @"Level2";
        self.HthreeV.text = @"0";
        self.HfourV.text = @"0";
        self.HfiveV.text = @"0";
        
    }else if(num1 == 1){
        
        self.HoneV.text = @"Level1";
        self.HtwoV.text = @"0";
        self.HthreeV.text = @"0";
        self.HfourV.text = @"0";
        self.HfiveV.text = @"0";
        
    }else{
       self.HoneV.text = @"0";
       self.HtwoV.text = @"0";
       self.HthreeV.text = @"0";
       self.HfourV.text = @"0";
       self.HfiveV.text = @"0";
    }
}

@end
