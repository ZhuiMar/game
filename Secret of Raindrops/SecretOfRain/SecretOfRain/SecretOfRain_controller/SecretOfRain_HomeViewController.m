//
//  SecretOfRain_HomeViewController.m
//  SecretOfRain
//
//  Created by zy on 2020/4/27.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "SecretOfRain_HomeViewController.h"

@interface SecretOfRain_HomeViewController ()

@property(nonatomic, strong) UIBarButtonItem *musicItem;
@property(nonatomic, strong) UIBarButtonItem *aboutItem;
@property(nonatomic, strong) UIButton *musicBtn;
@property(nonatomic, strong) UIButton *aboutBtn;

@property (nonatomic,strong) AVAudioPlayer *player;
@property(nonatomic, assign)BOOL isMusic;

@end

@implementation SecretOfRain_HomeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItems = @[self.aboutItem,self.musicItem];
    self.isMusic = YES;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"SecretOfRain_bg.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player play];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SecretOfRain" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SecretOfRain_jumpHomePage:) name:@"SecretOfRain_jumpHomePage" object:nil];
}

- (void)SecretOfRain_jumpHomePage:(NSNotification *)info{
    self.view.backgroundColor = [UIColor whiteColor];
    [NSObject SecretOfRain_findFromeController:self];
}

- (IBAction)collectAction:(id)sender {
    SecretOfRain_ChooseDifficulty *vc = [[SecretOfRain_ChooseDifficulty alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)carAction:(id)sender {
    SecretOfRain_CarViewController *vc = [[SecretOfRain_CarViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)recordAction:(id)sender {
    SecretOfRain_RecordViewController *vc = [[SecretOfRain_RecordViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)SecretOfRain_aboutAction:(UIButton *)buttion{
    SecretOfRain_AboutViewController *vc = [[SecretOfRain_AboutViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)SecretOfRain_muiscAction:(UIButton *)buttion{
    if(self.isMusic == YES){
       [buttion setBackgroundImage:[UIImage imageNamed:@"music1"] forState:UIControlStateNormal];
        [self.player pause];
    }else{
       [buttion setBackgroundImage:[UIImage imageNamed:@"music2"] forState:UIControlStateNormal];
       [self.player play];
    }
    self.isMusic = !self.isMusic;
}
- (UIButton *)musicBtn{
    if(_musicBtn == nil){
        _musicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _musicBtn.frame = CGRectMake(0, 0, 44, 44);
        [_musicBtn setBackgroundImage:[UIImage imageNamed:@"music2"] forState:UIControlStateNormal];
        [_musicBtn addTarget:self action:@selector(SecretOfRain_muiscAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _musicBtn;
}
- (UIButton *)aboutBtn{
    if(_aboutBtn == nil){
        _aboutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _aboutBtn.frame = CGRectMake(0, 0, 44, 44);
        [_aboutBtn setBackgroundImage:[UIImage imageNamed:@"about"] forState:UIControlStateNormal];
        [_aboutBtn addTarget:self action:@selector(SecretOfRain_aboutAction:) forControlEvents:UIControlEventTouchUpInside];
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
