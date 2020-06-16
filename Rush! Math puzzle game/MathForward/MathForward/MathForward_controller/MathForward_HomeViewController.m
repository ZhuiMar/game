//
//  MathForward_HomeViewController.m
//  MathForward
//
//  Created by luzhaoyang on 2020/4/21.
//  Copyright © 2020 teresa. All rights reserved.
//

#import "MathForward_HomeViewController.h"

@interface MathForward_HomeViewController ()

@property(nonatomic, assign)BOOL isMusic;
@property (nonatomic,strong) AVAudioPlayer *player;

@property (weak, nonatomic) IBOutlet UIButton *musicBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *wOne;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hOne;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *wTwo;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hTwo;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *wThree;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hThree;

@end

@implementation MathForward_HomeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jump:) name:@"gameAgain" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MathForward" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MysteryBoard_jumpHomePage:) name:@"MysteryBoard_jumpHomePage" object:nil];
    
    self.isMusic = YES;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"MathForward_bg.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self MathForward_playMusic];
    
    if kiPhone5 {
        self.wOne.constant = 130;
        self.hOne.constant = 60;
        self.wTwo.constant = 130;
        self.hTwo.constant = 60;
        self.wThree.constant = 130;
        self.hThree.constant = 60;
    }
}

- (void)MathForward_playMusic{
  [self.player play];
}
- (void)MathForward_pauseMusic{
  [self.player pause];
}

- (void)MysteryBoard_jumpHomePage:(NSNotification *)info{
    self.view.backgroundColor = [UIColor greenColor];
    [NSObject MathForward_findFromeController:self];
}
- (void)jump:(NSNotification *)info{
    
    NSString *str = info.object;
    NSArray *arr = [str componentsSeparatedByString:@"="];

    if(arr.count == 5){
        NSInteger level = [arr[0] integerValue];
        NSInteger life = [arr[1] integerValue];
        NSInteger tip = [arr[2] integerValue];
        NSInteger sore = [arr[3] integerValue];
        NSInteger renwu = [arr[4] integerValue];
        MathForward_GameViewController *vc = [[MathForward_GameViewController alloc]initWithLevel:level life:life isTip:tip score:sore renwu:renwu];
        [self.navigationController pushViewController:vc animated:NO];
    }
}

- (IBAction)aboutAction:(id)sender {
    MathForward_AboutViewController *vc = [[MathForward_AboutViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)levelAction:(id)sender {
    MathForward_GameViewController *vc = [[MathForward_GameViewController alloc]initWithLevel:1 life:3 isTip:YES score:0 renwu:0];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)endleAction:(id)sender {
    MathForward_GameViewController *vc = [[MathForward_GameViewController alloc]initWithLevel:2 life:3 isTip:YES score:0 renwu:0];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)rankingAction:(id)sender {
    MathForward_RankingViewController *vc = [[MathForward_RankingViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)musicAction:(id)sender {
    if(self.isMusic == YES){
        [self.musicBtn setBackgroundImage:[UIImage imageNamed:@"music_on"] forState:UIControlStateNormal];
       [self MathForward_playMusic];
    }else{
       [self.musicBtn setBackgroundImage:[UIImage imageNamed:@"music_off"] forState:UIControlStateNormal];
       [self MathForward_pauseMusic];
    }
    self.isMusic = !self.isMusic;
}

@end
