//
//  CJHomeVC.m
//  ColorJudgment
//
//  Created by  luzhaoyang on 2020/3/17.
//  Copyright © 2020 haike. All rights reserved.
//

#import "CJHomeVC.h"

@interface CJHomeVC ()

@property (weak, nonatomic) IBOutlet UIButton *musicBtn;
@property (weak, nonatomic) IBOutlet UIButton *aboutBtn;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UIButton *easyBtn;
@property (weak, nonatomic) IBOutlet UIButton *hardBtn;
@property (weak, nonatomic) IBOutlet UIButton *recordBtn;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lefyMideLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightTopLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightMiddleLayout;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;

@property (nonatomic,strong) AVAudioPlayer *player;
@property(nonatomic, assign) BOOL isMusice;

@end

@implementation CJHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.isMusice = YES;
    [self setMusic];
    
    if kiPhone5 {
        self.topLayout.constant = 150;
        self.lefyMideLayout.constant = 20;
        self.rightTopLayout.constant = 220;
        self.rightMiddleLayout.constant = 20;
        self.top.constant = 64;
    }
}

- (IBAction)aboutAction:(id)sender {
    CJAboutVC *aboutVC = [[CJAboutVC alloc]init];
    [self.navigationController pushViewController:aboutVC animated:YES];
}
- (IBAction)musicAction:(id)sender {
    if(self.isMusice == YES){
        [self pauseMusic];
        [self.musicBtn setBackgroundImage:[UIImage imageNamed:@"music_off"] forState:UIControlStateNormal];
    }else{
        [self.musicBtn setBackgroundImage:[UIImage imageNamed:@"music_on"] forState:UIControlStateNormal];
        [self playMusic];
    }
    self.isMusice = !self.isMusice;
}

- (void)setMusic{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"bgMusic.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self playMusic];
}

- (void)playMusic{
    [self.player play];
}
- (void)pauseMusic{
    [self.player pause];
}

- (IBAction)ganTanAction:(id)sender {
    CJAboutVC *aboutVC = [[CJAboutVC alloc]init];
    [self.navigationController pushViewController:aboutVC animated:YES];
}
- (IBAction)startAction:(id)sender {
    CJHowToVC *howToVC = [[CJHowToVC alloc]init];
    [self.navigationController pushViewController:howToVC animated:YES];
}
- (IBAction)easyAction:(id)sender {
    CJGameCenterVC *gameCenterVC = [[CJGameCenterVC alloc]init];
    [self.navigationController pushViewController:gameCenterVC animated:YES];
}
- (IBAction)hardAction:(id)sender {
    CJGameHardVC *gameHardVC = [[CJGameHardVC alloc]init];
    [self.navigationController pushViewController:gameHardVC animated:YES];
}
- (IBAction)recordAction:(id)sender {
    CJRnakingVC *rankingVC = [[CJRnakingVC alloc]init];
    [self.navigationController pushViewController:rankingVC animated:YES];
}
@end
