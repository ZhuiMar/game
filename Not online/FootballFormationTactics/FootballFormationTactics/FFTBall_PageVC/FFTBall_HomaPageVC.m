//
//  FFTBall_HomaPageVC.m
//  FootballFormationTactics
//
//  Created by zy on 2020/5/27.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import "FFTBall_HomaPageVC.h"
#import "UIFont+MBBall_fontName.h"
#import "FFTBall_AboutPageVC.h"
#import <AVFoundation/AVFoundation.h>
#import "FFTBall_AddPageVC.h"
#import "FFTBall_MyFormationPageVC.h"

@interface FFTBall_HomaPageVC ()

@property (weak, nonatomic) IBOutlet UIButton *musicBtn;

@property (nonatomic,strong) AVAudioPlayer *player;
@property(nonatomic, assign)BOOL isMusic;

@end

@implementation FFTBall_HomaPageVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goToNew:) name:@"NewMycomplation" object:nil];
}

- (void)goToNew:(NSNotification *)info{
    FFTBall_AddPageVC *vc = [[FFTBall_AddPageVC alloc]init];
    [self.navigationController pushViewController:vc animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"football_bg_music.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player play];
    self.isMusic = YES;
}
- (IBAction)newAction:(id)sender {
    FFTBall_AddPageVC *vc = [[FFTBall_AddPageVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)myAction:(id)sender {
    FFTBall_MyFormationPageVC *vc = [[FFTBall_MyFormationPageVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)aboutAction:(id)sender {
    FFTBall_AboutPageVC *vc = [[FFTBall_AboutPageVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)musicActin:(UIButton *)button {
    if(self.isMusic == YES){
       [button setBackgroundImage:[UIImage imageNamed:@"music_on"] forState:UIControlStateNormal];
       [self.player pause];
    }else{
       [button setBackgroundImage:[UIImage imageNamed:@"music_off"] forState:UIControlStateNormal];
       [self.player play];
    }
    self.isMusic = !self.isMusic;
}

@end
