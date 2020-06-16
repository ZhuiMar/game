//
//  SmartNumber_HomePageVC.m
//  SmartNumberOff
//
//  Created by zy on 2020/4/29.
//  Copyright © 2020 ximan. All rights reserved.
//

#import "SmartNumber_HomePageVC.h"

@interface SmartNumber_HomePageVC ()

@property (weak, nonatomic) IBOutlet UIButton *musicBtn;

@property (nonatomic,strong) AVAudioPlayer *player;
@property(nonatomic, assign)BOOL isMusic;

@end

@implementation SmartNumber_HomePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.isMusic = YES;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"SmartNumber_bg.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player play];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SmartNumber_jumpHomePageToGame:) name:@"SmartNumber_jumpHomePageToGame" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SmartNumberOffSetTheme" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SmartNumber_againJump:) name:@"SmartNumber_againJump" object:nil];
}

- (void)SmartNumber_againJump:(NSNotification *)info{
    NSString *string = info.object;
    NSInteger level = [string integerValue];
    SmartNumber_GameViewController *vc = [[SmartNumber_GameViewController alloc]initWithLevel:level score:0 life:3 showTip:NO];
    [self.navigationController pushViewController:vc animated:NO];
}


- (IBAction)musicAction:(id)sender {
    if(self.isMusic == YES){
       [self.musicBtn setBackgroundImage:[UIImage imageNamed:@"music_on"] forState:UIControlStateNormal];
        [self.player play];
    }else{
       [self.musicBtn setBackgroundImage:[UIImage imageNamed:@"music_off"] forState:UIControlStateNormal];
        [self.player pause];
    }
    self.isMusic = !self.isMusic;
}

- (void)SmartNumber_jumpHomePageToGame:(NSNotification *)info{
    [NSObject SmartNumber_findFromeController:self];
}

- (IBAction)gantanAction:(id)sender {
    SmartNumber_AboutViewController *vc = [[SmartNumber_AboutViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)simpleAction:(id)sender {
    SmartNumber_GameViewController *vc = [[SmartNumber_GameViewController alloc]initWithLevel:1 score:0 life:3 showTip:YES];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)generalAction:(id)sender {
    SmartNumber_GameViewController *vc = [[SmartNumber_GameViewController alloc]initWithLevel:2 score:0 life:3 showTip:YES];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)difficultAction:(id)sender {
    SmartNumber_GameViewController *vc = [[SmartNumber_GameViewController alloc]initWithLevel:3 score:0 life:3 showTip:YES];
    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)recordAction:(id)sender {
    SmartNumber_RecordViewController *vc = [[SmartNumber_RecordViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
