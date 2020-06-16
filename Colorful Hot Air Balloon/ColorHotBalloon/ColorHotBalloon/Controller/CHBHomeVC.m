//
//  CHBHomeVC.m
//  ColorHotBalloon
//
//  Created by  luzhaoyang on 2020/3/9.
//  Copyright © 2020 zhuimar. All rights reserved.
//


#import "CHBHomeVC.h"
#import "CHBCountVC.h"
#import "CHBGuessVC.h"
#import "CHBrecordVC.h"
#import "CHBAboutVC.h"
#import "myPch.pch"
#import <AVFoundation/AVFoundation.h>

@interface CHBHomeVC ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;
@property (weak, nonatomic) IBOutlet UIButton *musicBtn;

@property (nonatomic,strong) AVAudioPlayer *player;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLayout;
@property(nonatomic, assign) BOOL isMusice;

@end

@implementation CHBHomeVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if IS_IPHONE_Xr {
        self.topLayout.constant = 50;
    } else if IS_IPHONE_Xs_Max {
        self.topLayout.constant = 50;
    } else if IS_IPHONE_Xr {
        self.topLayout.constant = 50;
    } else if kiPhone5 {
        self.bottomLayout.constant = 50;
    } 
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isMusice = YES;
    [self setMusic];
}

- (void)setMusic{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"background_music.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self playMusic];
}
- (void)playMusic{
    [self.player play];
}
- (void)pauseMusic{
    [self.player pause];
}

- (IBAction)notVoiceBtnAction:(id)sender {
    if(self.isMusice == YES){
        [self pauseMusic];
        [self.musicBtn setBackgroundImage:[UIImage imageNamed:@"turn_off"] forState:UIControlStateNormal];
    }else{
        [self.musicBtn setBackgroundImage:[UIImage imageNamed:@"open"] forState:UIControlStateNormal];
        [self playMusic];
    }
    self.isMusice = !self.isMusice;
}

- (IBAction)ganTanBtnAction:(id)sender {
    CHBAboutVC *aboutVC = [[CHBAboutVC alloc]init];
    [self.navigationController pushViewController:aboutVC animated:YES];
}

- (IBAction)countAction:(id)sender {
    CHBCountVC *countVc = [[CHBCountVC alloc]init];
    [self.navigationController pushViewController:countVc animated:YES];
}

- (IBAction)guessAction:(id)sender {
    CHBGuessVC *guessVc = [[CHBGuessVC alloc]init];
    [self.navigationController pushViewController:guessVc animated:YES];
}

- (IBAction)recordingAction:(id)sender {
    CHBrecordVC *recordVc = [[CHBrecordVC alloc]init];
    [self.navigationController pushViewController:recordVc animated:YES];
}


@end
