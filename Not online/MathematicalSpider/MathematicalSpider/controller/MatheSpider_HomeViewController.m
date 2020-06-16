//
//  MatheSpider_HomeViewController.m
//  MathematicalSpider
//
//  Created by luzhaoyang on 2020/4/20.
//  Copyright © 2020 teresa. All rights reserved.
//

#import "MatheSpider_HomeViewController.h"

@interface MatheSpider_HomeViewController ()

@property(nonatomic, assign)BOOL isMusic;
@property (nonatomic,strong) AVAudioPlayer *player;
@property (weak, nonatomic) IBOutlet UIButton *musicBtn;

@end

@implementation MatheSpider_HomeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
   
    self.isMusic = YES;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"MatheSpider_bg.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self MatheSpider_playMusic];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jump:) name:@"gameAgain" object:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MatheSpider" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MatheSpider_jumpHomePage:) name:@"MatheSpider_jumpHomePage" object:nil];
}

- (void)jump:(NSNotification *)info{
    NSString *str = info.object;
    if([str isEqualToString:@"1"]){
        MatheSpider_GameViewController *vc = [[MatheSpider_GameViewController alloc]initWithType:1 showTip:NO score:0];
        [self.navigationController pushViewController:vc animated:YES];
    }else if([str isEqualToString:@"2"]){
        MatheSpider_GameViewController *vc = [[MatheSpider_GameViewController alloc]initWithType:2 showTip:NO score:0];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)MatheSpider_jumpHomePage:(NSNotification *)info{
    [NSObject MatheSpider_findFromeController:self];
}

- (void)MatheSpider_playMusic{
  [self.player play];
}
- (void)MatheSpider_pauseMusic{
  [self.player pause];
}

- (IBAction)easyAction:(id)sender {
    MatheSpider_GameViewController *vc = [[MatheSpider_GameViewController alloc]initWithType:1 showTip:YES score:0];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)hardAction:(id)sender {
    MatheSpider_GameViewController *vc = [[MatheSpider_GameViewController alloc]initWithType:2 showTip:YES score:0];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)rankAction:(id)sender {
    MatheSpider_RankViewController *vc = [[MatheSpider_RankViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)desAction:(id)sender {
    MatheSpider_DescriptionViewController *vc = [[MatheSpider_DescriptionViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)musicAction:(id)sender {
    if(self.isMusic == YES){
        [self.musicBtn setBackgroundImage:[UIImage imageNamed:@"1_music_nor"] forState:UIControlStateNormal];
       [self MatheSpider_pauseMusic];
    }else{
       [self.musicBtn setBackgroundImage:[UIImage imageNamed:@"1_music_pre"] forState:UIControlStateNormal];
       [self MatheSpider_playMusic];
    }
    self.isMusic = !self.isMusic;
}



@end
