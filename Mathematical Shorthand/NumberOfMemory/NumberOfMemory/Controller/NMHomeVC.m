//
//  NMHomeVC.m
//  NumberOfMemory
//
//  Created by  luzhaoyang on 2020/4/2.
//  Copyright © 2020 huadu. All rights reserved.
//

#import "NMHomeVC.h"

@interface NMHomeVC ()

@property (nonatomic,strong) AVAudioPlayer *player;

@property (weak, nonatomic) IBOutlet UIButton *introduceBtn;
@property (weak, nonatomic) IBOutlet UIButton *musicBtn;
@property (weak, nonatomic) IBOutlet UIButton *rankingBtn;

@property (weak, nonatomic) IBOutlet UIButton *studyBtn;
@property (weak, nonatomic) IBOutlet UIButton *easyBtn;
@property (weak, nonatomic) IBOutlet UIButton *hardBtn;

@property(nonatomic, assign)BOOL isMusic;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;

@end

@implementation NMHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isMusic = YES;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"bgm.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self playMusic];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(againAction:) name:@"gameAction" object:nil];
    
    if kiPhone5 {
        self.topLayout.constant = 34;
    }
}

- (void)againAction:(NSNotification *)info{
    NSString *string = info.object;
    NSArray *arr = [string componentsSeparatedByString:@"-"];
    NSInteger one = [arr[0] integerValue];
    NSInteger two = [arr[1] integerValue];
    NMGameCenterViewController *vc = [[NMGameCenterViewController alloc]initWithType:one level:two];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)playMusic{
    [self.player play];
}
- (void)pauseMusic{
    [self.player pause];
}

- (IBAction)introducceAction:(id)sender {
    NMIntroduceViewController *vc = [[NMIntroduceViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)rankingAction:(id)sender {
    NMRankingViewController *rankingVc = [[NMRankingViewController alloc]init];
    [self.navigationController pushViewController:rankingVc animated:YES];
}
- (IBAction)musicAction:(id)sender {
    if(self.isMusic == YES){
        [self.musicBtn setBackgroundImage:[UIImage imageNamed:@"music"] forState:UIControlStateNormal];
        [self pauseMusic];
    }else{
        [self.musicBtn setBackgroundImage:[UIImage imageNamed:@"music_1"] forState:UIControlStateNormal];
        [self playMusic];
    }
    self.isMusic = !self.isMusic;
}
- (IBAction)studyAction:(id)sender {
    NMStudyViewController *vc = [[NMStudyViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)easyAction:(id)sender {
    NMGameCenterViewController *vc = [[NMGameCenterViewController alloc]initWithType:0 level:1];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)hardAction:(id)sender {
    NMGameCenterViewController *vc = [[NMGameCenterViewController alloc]initWithType:1 level:1];
    [self.navigationController pushViewController:vc animated:YES];
}
@end

