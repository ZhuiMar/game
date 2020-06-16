//
//  SecretOfRain_ChooseDifficulty.m
//  SecretOfRain
//
//  Created by zy on 2020/4/27.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "SecretOfRain_ChooseDifficulty.h"

@interface SecretOfRain_ChooseDifficulty ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hieght;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *wight;

@end

@implementation SecretOfRain_ChooseDifficulty

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Choose difficulty";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jump:) name:@"gameAgain" object:nil];
}


- (void)jump:(NSNotification *)info{
    NSString *str = info.object;
    if([str isEqualToString:@"1"]){
        SecretOfRain_GameViewController *vc = [[SecretOfRain_GameViewController alloc]initWithLevel:1 score:0 life:3 tip:NO];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if([str isEqualToString:@"2"]){
        SecretOfRain_GameViewController *vc = [[SecretOfRain_GameViewController alloc]initWithLevel:2 score:0 life:3 tip:NO];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if([str isEqualToString:@"3"]){
        SecretOfRain_GameViewController *vc = [[SecretOfRain_GameViewController alloc]initWithLevel:3 score:0 life:3 tip:NO];
        [self.navigationController pushViewController:vc animated:NO];
    }
}


- (IBAction)simpleAction:(id)sender {
    SecretOfRain_GameViewController *vc = [[SecretOfRain_GameViewController alloc]initWithLevel:1 score:0 life:3 tip:YES];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)mediumAction:(id)sender {
    SecretOfRain_GameViewController *vc = [[SecretOfRain_GameViewController alloc]initWithLevel:2 score:0 life:3 tip:YES];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)difficultAction:(id)sender {
    SecretOfRain_GameViewController *vc = [[SecretOfRain_GameViewController alloc]initWithLevel:3 score:0 life:3 tip:YES];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
