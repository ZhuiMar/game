//
//  LLStudy.m
//  LanguageLearn
//
//  Created by  luzhaoyang on 2020/3/19.
//  Copyright © 2020 haike. All rights reserved.
//

#import "LLStudy.h"

@interface LLStudy ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation LLStudy

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.titleLabel.font = [UIFont fontWithName:FontName size:30];
    self.navigationItem.title = @"Study";
}

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (IBAction)fruitAction:(id)sender {
    LLFruitVC *fruitVC = [[LLFruitVC alloc]initWithType:@"fruit"];
    [self.navigationController pushViewController:fruitVC animated:YES];
}
- (IBAction)animailAction:(id)sender {
    LLFruitVC *fruitVC = [[LLFruitVC alloc]initWithType:@"animail"];
    [self.navigationController pushViewController:fruitVC animated:YES];
}

@end
