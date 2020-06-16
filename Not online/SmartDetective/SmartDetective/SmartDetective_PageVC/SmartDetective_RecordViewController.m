//
//  SmartDetective_RecordViewController.m
//  SmartDetective
//
//  Created by zy on 2020/5/13.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import "SmartDetective_RecordViewController.h"

@interface SmartDetective_RecordViewController ()

@property (weak, nonatomic) IBOutlet UILabel *simScore;
@property (weak, nonatomic) IBOutlet UILabel *generalScore;
@property (weak, nonatomic) IBOutlet UILabel *difficultScore;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *weightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayout;

@end

@implementation SmartDetective_RecordViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Record";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setValue];
    
    if kiPhone5 {
        self.weightLayout.constant = 290;
        self.heightLayout.constant = 150;
    }
}

- (void)setValue{
    NSArray *arr1 = [NSObject SmartDetective_getRankingKey:@"MathForward_simple"];
    NSArray *arr2 = [NSObject SmartDetective_getRankingKey:@"MathForward_general"];
    NSArray *arr3 = [NSObject SmartDetective_getRankingKey:@"MathForward_difficult"];
    self.simScore.text = [NSString stringWithFormat:@"%@",arr1.firstObject?arr1.firstObject:@(0)];
    self.generalScore.text = [NSString stringWithFormat:@"%@",arr2.firstObject?arr2.firstObject:@(0)];
    self.difficultScore.text = [NSString stringWithFormat:@"%@",arr3.firstObject?arr3.firstObject:@(0)];
}

@end
