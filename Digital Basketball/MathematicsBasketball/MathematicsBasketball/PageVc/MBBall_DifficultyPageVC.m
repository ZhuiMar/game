//
//  MBBall_DifficultyPageVC.m
//  MathematicsBasketball
//
//  Created by zy on 2020/5/26.
//  Copyright © 2020 zhongba. All rights reserved.
//

#import "MBBall_DifficultyPageVC.h"
#import "MBBall_GamePageVC.h"

@interface MBBall_DifficultyPageVC ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *weightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;

@end

@implementation MBBall_DifficultyPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpToGame:) name:@"jumpToGame" object:nil];
    
    if kiPhone5 {
        self.weightLayout.constant = 280;
        self.topLayout.constant = 90;
    }
}

- (void)jumpToGame:(NSNotification *)info{
    NSString *string = info.object;
    MBBall_GamePageVC *game = [[MBBall_GamePageVC alloc]initWitleve:[string integerValue]];
    [self.navigationController pushViewController:game animated:NO];
}

- (IBAction)simpleAction:(id)sender {
    MBBall_GamePageVC *game = [[MBBall_GamePageVC alloc]initWitleve:1];
    [self.navigationController pushViewController:game animated:YES];
}

- (IBAction)generalAction:(id)sender {
    MBBall_GamePageVC *game = [[MBBall_GamePageVC alloc]initWitleve:2];
    [self.navigationController pushViewController:game animated:YES];
}

- (IBAction)difficult:(id)sender {
    MBBall_GamePageVC *game = [[MBBall_GamePageVC alloc]initWitleve:3];
    [self.navigationController pushViewController:game animated:YES];
}

@end
