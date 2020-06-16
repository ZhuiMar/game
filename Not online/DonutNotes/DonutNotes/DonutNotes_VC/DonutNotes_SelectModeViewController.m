//
//  DonutNotes_SelectModeViewController.m
//  DonutNotes
//
//  Created by luzhaoyang on 2020/4/18.
//  Copyright © 2020 willows. All rights reserved.
//

#import "DonutNotes_SelectModeViewController.h"

@interface DonutNotes_SelectModeViewController ()

@end

@implementation DonutNotes_SelectModeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Learn notes";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jump:) name:@"gameAgain" object:nil];
}
- (void)jump:(NSNotification *)info{
    NSString *str = info.object;
    if([str isEqualToString:@"1"]){
        DonutNotes_GameViewController *vc = [[DonutNotes_GameViewController alloc]initWithLevel:1 score:0 showTip:NO];
        [self.navigationController pushViewController:vc animated:NO];
    }else if([str isEqualToString:@"2"]){
        DonutNotes_GameViewController *vc = [[DonutNotes_GameViewController alloc]initWithLevel:2 score:0 showTip:NO];
        [self.navigationController pushViewController:vc animated:NO];
    }else{
        DonutNotes_GameViewController *vc = [[DonutNotes_GameViewController alloc]initWithLevel:3 score:0 showTip:NO];
        [self.navigationController pushViewController:vc animated:NO];
    }
}

- (IBAction)findName:(id)sender {
    DonutNotes_GameViewController *vc = [[DonutNotes_GameViewController alloc]initWithLevel:1 score:0 showTip:YES];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)findBeat:(id)sender {
    DonutNotes_GameViewController *vc = [[DonutNotes_GameViewController alloc]initWithLevel:2 score:0 showTip:YES];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)findStars:(id)sender {
    DonutNotes_GameViewController *vc = [[DonutNotes_GameViewController alloc]initWithLevel:3 score:0 showTip:YES];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
