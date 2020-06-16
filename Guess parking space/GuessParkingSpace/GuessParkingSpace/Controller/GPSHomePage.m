//
//  GPSHomePage.m
//  GuessParkingSpace
//
//  Created by luzhaoyang on 2020/4/9.
//  Copyright © 2020 xiangjia. All rights reserved.
//

#import "GPSHomePage.h"

@interface GPSHomePage ()
@property (weak, nonatomic) IBOutlet UIButton *musicBtn;

@property (nonatomic,strong) AVAudioPlayer *player;
@property(nonatomic, assign)BOOL isMusic;

@end

@implementation GPSHomePage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isMusic = YES;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"gps_bg.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self playMusic];
}

- (void)playMusic{
    [self.player play];
}
- (void)pauseMusic{
    [self.player pause];
}

- (IBAction)startAc:(id)sender {
    GPSChoosePage *choosePage = [[GPSChoosePage alloc]init];
    [self.navigationController pushViewController:choosePage animated:YES];
}
- (IBAction)recordAc:(id)sender {
    GPSRcordPage *recordPage = [[GPSRcordPage alloc]init];
    [self.navigationController pushViewController:recordPage animated:YES];
}
- (IBAction)aboutAc:(id)sender {
    GPSAboutAppPage *aboutPage = [[GPSAboutAppPage alloc]init];
    [self.navigationController pushViewController:aboutPage animated:YES];
}
- (IBAction)playMusic:(id)sender {
    if(self.isMusic == YES){
       [self.musicBtn setBackgroundImage:[UIImage imageNamed:@"music_on"] forState:UIControlStateNormal];
       [self pauseMusic];
    }else{
       [self.musicBtn setBackgroundImage:[UIImage imageNamed:@"music_off"] forState:UIControlStateNormal];
       [self playMusic];
    }
    self.isMusic = !self.isMusic;
}

@end
