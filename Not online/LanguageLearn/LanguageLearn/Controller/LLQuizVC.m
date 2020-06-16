//
//  LLQuizVC.m
//  LanguageLearn
//
//  Created by  luzhaoyang on 2020/3/19.
//  Copyright © 2020 haike. All rights reserved.
//

#import "LLQuizVC.h"

@interface LLQuizVC ()

@property (weak, nonatomic) IBOutlet UIButton *simpleBtn;
@property (weak, nonatomic) IBOutlet UIButton *generalBtn;
@property (weak, nonatomic) IBOutlet UIButton *difficultBtn;

@end

@implementation LLQuizVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Quiz";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)simpleAction:(id)sender {
    LLSimpleVC *vc = [[LLSimpleVC alloc]initWithType:@"simple"];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)generalAction:(id)sender {
    LLSimpleVC *vc = [[LLSimpleVC alloc]initWithType:@"general"];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)difficultAction:(id)sender {
    LLDifficultVC *vc = [[LLDifficultVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
