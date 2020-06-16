//
//  CPHomeVC.m
//  ComparePlanes
//
//  Created by luzhaoyang on 2020/4/15.
//  Copyright © 2020 qingxiriver. All rights reserved.
//

#import "CPHomeVC.h"

@interface CPHomeVC ()

@property (weak, nonatomic) IBOutlet UIButton *mussicBtn;
@property (weak, nonatomic) IBOutlet UIButton *aboutBtn;

@property (nonatomic,strong) AVAudioPlayer *player;
@property(nonatomic, assign)BOOL isMusic;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *middleLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toplayout;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *Tm;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *Bm;

@end

@implementation CPHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isMusic = YES;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"cp_bg_music.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self playMusic];

    if kiPhone5 {
        self.middleLayout.constant = 90;
        self.Tm.constant = 20;
        self.Bm.constant = 20;
    }
    if kiPhone6 {
        self.middleLayout.constant = 90;
    }
    if kiPhone6Plus {
        self.middleLayout.constant = 90;
    }
    if IS_IPHONE_X_orMore {
        self.middleLayout.constant = 90;
        self.toplayout.constant = 88;
    }

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clcikJump:) name:@"jumpToRanking" object:nil];
}

- (void)playMusic{
    [self.player play];
}
- (void)pauseMusic{
    [self.player pause];
}

- (IBAction)numbersAction:(id)sender {
    CPChooseVC *vc = [[CPChooseVC alloc]initWithType:1];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)SortingAction:(id)sender {
    CPChooseVC *vc = [[CPChooseVC alloc]initWithType:2];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)myRecordAction:(id)sender {
    CPRankingVC *vc = [[CPRankingVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)musidAction:(id)sender {
    if(self.isMusic == YES){
       [self.mussicBtn setBackgroundImage:[UIImage imageNamed:@"music-no"] forState:UIControlStateNormal];
       [self pauseMusic];
    }else{
       [self.mussicBtn setBackgroundImage:[UIImage imageNamed:@"music"] forState:UIControlStateNormal];
       [self playMusic];
    }
    self.isMusic = !self.isMusic;
}

- (IBAction)anoutAction:(id)sender {
    CPAboutVC *vc = [[CPAboutVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)clcikJump:(NSNotification *)info{
    [CPScoreManagee shareManager].dict = [[NSUserDefaults standardUserDefaults] objectForKey:@"SavePlan_Tool"];
    [NSObject jumpToViewController:self];
}


@end
