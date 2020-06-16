//
//  CatchBall_HomePageVC.m
//  RushingToCatch
//
//  Created by zy on 2020/6/1.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "CatchBall_HomePageVC.h"
#import <AVFoundation/AVFoundation.h>

@interface CatchBall_HomePageVC ()

@property(nonatomic, strong) UIBarButtonItem *musicItem;
@property(nonatomic, strong) UIButton *musicButtion;
@property(nonatomic, strong) UIBarButtonItem *aboutItem;
@property(nonatomic, strong) UIButton *aboutButtion;
@property (nonatomic,strong) AVAudioPlayer *player;
@property(nonatomic, assign)BOOL isMusic;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *H;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *w;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *BoH;

@end

@implementation CatchBall_HomePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItems = @[self.musicItem,self.aboutItem];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"bgmusic.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player play];
    self.isMusic = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gotoGamePage:) name:@"gotoGamePage" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gotoChallGamePage:) name:@"gotoChallGamePage" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gotoMatchGamePage:) name:@"gotoMatchGamePage" object:nil];
    
    if kiPhone5 {
        self.H.constant = 48;
        self.w.constant = 280;
        self.top.constant = 15;
        self.BoH.constant = 120;
    }
}

- (void)gotoMatchGamePage:(NSNotification *)info{
    CatchBall_MathematicsVC *math = [[CatchBall_MathematicsVC alloc]init];
    [self.navigationController pushViewController:math animated:YES];
}

- (void)gotoChallGamePage:(NSNotification *)info{
    NSNumber *levelNumber = info.object;
    CatchBall_GameCenterPageVC *game = [[CatchBall_GameCenterPageVC alloc]initWithLevel:1 levelNumber:[levelNumber integerValue]];
    [self.navigationController pushViewController:game animated:NO];
}

- (void)gotoGamePage:(NSNotification *)info{
    CatchBall_GameCenterPageVC *game = [[CatchBall_GameCenterPageVC alloc]initWithLevel:2 levelNumber:0];
    [self.navigationController pushViewController:game animated:NO];
}
- (IBAction)challAction:(id)sender {
    CatchBall_GameCenterPageVC *game = [[CatchBall_GameCenterPageVC alloc]initWithLevel:1 levelNumber:1];
    [self.navigationController pushViewController:game animated:YES];
}
- (IBAction)PassAction:(id)sender {
    CatchBall_GameCenterPageVC *game = [[CatchBall_GameCenterPageVC alloc]initWithLevel:2 levelNumber:0];
    [self.navigationController pushViewController:game animated:YES];
}

- (void)musicAction:(UIButton *)button{
    if(self.isMusic == YES){
        [self.musicButtion setImage:[UIImage imageNamed:@"turn_on"] forState:UIControlStateNormal];
       [self.player pause];
    }else{
       [self.musicButtion setImage:[UIImage imageNamed:@"turn_off"] forState:UIControlStateNormal];
       [self.player play];
    }
    self.isMusic = !self.isMusic;
}

- (void)aboutAction:(UIButton *)buttion{
    CatchBall_AboutPageVC *about = [[CatchBall_AboutPageVC alloc]init];
    [self.navigationController pushViewController:about animated:YES];
}
- (IBAction)rankAction:(id)sender {
    CatchBall_RankingView *rank = [[CatchBall_RankingView alloc]init];
    [self.navigationController pushViewController:rank animated:YES];
}
- (IBAction)mathCacthAction:(id)sender {
    CatchBall_MathematicsVC *math = [[CatchBall_MathematicsVC alloc]init];
    [self.navigationController pushViewController:math animated:YES];
}

- (UIButton *)musicButtion{
    if(_musicButtion == nil){
        _musicButtion = [UIButton buttonWithType:UIButtonTypeCustom];
        _musicButtion.frame = CGRectMake(0, 0, 30, 30);
        [_musicButtion setImage:[UIImage imageNamed:@"turn_off"] forState:UIControlStateNormal];
        [_musicButtion addTarget:self action:@selector(musicAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _musicButtion;
}
- (UIBarButtonItem *)musicItem{
    if(_musicItem == nil){
        _musicItem = [[UIBarButtonItem alloc]initWithCustomView:self.musicButtion];
    }
    return _musicItem;
}
- (UIButton *)aboutButtion{
    if(_aboutButtion == nil){
        _aboutButtion = [UIButton buttonWithType:UIButtonTypeCustom];
        _aboutButtion.frame = CGRectMake(0, 0, 30, 30);
        [_aboutButtion setImage:[UIImage imageNamed:@"about"] forState:UIControlStateNormal];
        [_aboutButtion addTarget:self action:@selector(aboutAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _aboutButtion;
}
- (UIBarButtonItem *)aboutItem{
    if(_aboutItem == nil){
        _aboutItem = [[UIBarButtonItem alloc]initWithCustomView:self.aboutButtion];
    }
    return _aboutItem;
}
@end
