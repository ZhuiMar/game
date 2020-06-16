//
//  MBBall_HomePageVC.m
//  MathematicsBasketball
//
//  Created by zy on 2020/5/26.
//  Copyright © 2020 zhongba. All rights reserved.
//

#import "MBBall_HomePageVC.h"
#import <AVFoundation/AVFoundation.h>
#import "MBBall_DifficultyPageVC.h"
#import "MBBall_RecordPageVC.h"
#import "MBBall_AboutPageVC.h"

@interface MBBall_HomePageVC ()

@property(nonatomic, strong) UIBarButtonItem *musicBottonItem;
@property(nonatomic, strong) UIButton *musicBottom;

@property (nonatomic,strong) AVAudioPlayer *player;
@property(nonatomic, assign)BOOL isMusic;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *weightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;

@end

@implementation MBBall_HomePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isMusic = YES;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"bgmusic.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    self.navigationItem.rightBarButtonItem = self.musicBottonItem;
    [self.player play];
    
    if kiPhone5 {
        self.heightLayout.constant = 60;
        self.weightLayout.constant = 320;
        self.topLayout.constant = 100;
    }
}

- (void)muiscAction:(UIButton *)button{
    if(self.isMusic == YES){
       [button setBackgroundImage:[UIImage imageNamed:@"music"] forState:UIControlStateNormal];
        [self.player pause];
    }else{
       [button setBackgroundImage:[UIImage imageNamed:@"music_1"] forState:UIControlStateNormal];
       [self.player play];
    }
    self.isMusic = !self.isMusic;
}

- (IBAction)startAction:(id)sender {
    MBBall_DifficultyPageVC *diffVC = [[MBBall_DifficultyPageVC alloc]init];
    [self.navigationController pushViewController:diffVC animated:YES];
}
- (IBAction)recordAction:(id)sender {
    MBBall_RecordPageVC *recordtVC = [[MBBall_RecordPageVC alloc]init];
    [self.navigationController pushViewController:recordtVC animated:YES];
}
- (IBAction)introductionAction:(id)sender {
    MBBall_AboutPageVC *aboutVC = [[MBBall_AboutPageVC alloc]init];
    [self.navigationController pushViewController:aboutVC animated:YES];
}

- (UIButton *)musicBottom{
    if(_musicBottom == nil){
        _musicBottom = [UIButton buttonWithType:UIButtonTypeCustom];
        _musicBottom.frame = CGRectMake(0, 0, 30, 30);
        [_musicBottom setBackgroundImage:[UIImage imageNamed:@"music_1"] forState:UIControlStateNormal];
        [_musicBottom addTarget:self action:@selector(muiscAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _musicBottom;
}
- (UIBarButtonItem *)musicBottonItem{
    if(_musicBottonItem == nil){
        _musicBottonItem = [[UIBarButtonItem alloc]initWithCustomView:self.musicBottom];
    }
    return _musicBottonItem;
}

@end
