//
//  DonutNotes_HomeViewController.m
//  DonutNotes
//
//  Created by luzhaoyang on 2020/4/18.
//  Copyright © 2020 willows. All rights reserved.
//

#import "DonutNotes_HomeViewController.h"

@interface DonutNotes_HomeViewController ()

@property(nonatomic, strong) UIBarButtonItem *musicItem;
@property(nonatomic, strong) UIBarButtonItem *aboutItem;
@property(nonatomic, strong) UIButton *musicBtn;
@property(nonatomic, strong) UIButton *aboutBtn;

@property (nonatomic,strong) AVAudioPlayer *player;
@property(nonatomic, assign)BOOL isMusic;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *W;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *H;

@end

@implementation DonutNotes_HomeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.leftBarButtonItems = @[self.musicItem,self.aboutItem];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if kiPhone5 {
        self.H.constant = 40;
        self.W.constant = 280;
    }
    
    self.isMusic = YES;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"DonutNotes_bg.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self DonutNotes_playMusic];
}

- (void)DonutNotes_playMusic{
    [self.player play];
}
- (void)DonutNotes_pauseMusic{
    [self.player pause];
}

- (void)DonutNotes_aboutAction:(UIButton *)buttion{
    DonutNotes_AboutViewController *vc = [[DonutNotes_AboutViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)learningAction:(id)sender {
    DonutNotes_LearnViewController *vc = [[DonutNotes_LearnViewController alloc]init];
       [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)FindAction:(id)sender {
    DonutNotes_SelectModeViewController *vc = [[DonutNotes_SelectModeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)achievementAction:(id)sender {
    DonutNotes_RecordViewController *vc = [[DonutNotes_RecordViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)DonutNotes_muiscAction:(UIButton *)buttion{
    if(self.isMusic == YES){
       [buttion setBackgroundImage:[UIImage imageNamed:@"open"] forState:UIControlStateNormal];
       [self DonutNotes_pauseMusic];
    }else{
       [buttion setBackgroundImage:[UIImage imageNamed:@"turn_off"] forState:UIControlStateNormal];
       [self DonutNotes_playMusic];
    }
    self.isMusic = !self.isMusic;
}

- (UIButton *)musicBtn{
    if(_musicBtn == nil){
        _musicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _musicBtn.frame = CGRectMake(0, 0, 44, 44);
        [_musicBtn setBackgroundImage:[UIImage imageNamed:@"turn_off"] forState:UIControlStateNormal];
        [_musicBtn addTarget:self action:@selector(DonutNotes_muiscAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _musicBtn;
}
- (UIButton *)aboutBtn{
    if(_aboutBtn == nil){
        _aboutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _aboutBtn.frame = CGRectMake(0, 0, 44, 44);
        [_aboutBtn setBackgroundImage:[UIImage imageNamed:@"about"] forState:UIControlStateNormal];
        [_aboutBtn addTarget:self action:@selector(DonutNotes_aboutAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _aboutBtn;
}
- (UIBarButtonItem *)aboutItem{
    if(_aboutItem == nil){
        _aboutItem = [[UIBarButtonItem alloc]initWithCustomView:self.aboutBtn];
    }
    return _aboutItem;
}
- (UIBarButtonItem *)musicItem{
    if(_musicItem == nil){
        _musicItem = [[UIBarButtonItem alloc]initWithCustomView:self.musicBtn];
    }
    return _musicItem;
}
@end
