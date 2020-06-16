//
//  MysteryBoard_HomeVC.m
//  MysteryBoard
//
//  Created by luzhaoyang on 2020/4/22.
//  Copyright © 2020 wansheng. All rights reserved.
//

#import "MysteryBoard_HomeVC.h"

@interface MysteryBoard_HomeVC ()

@property(nonatomic, strong) UIBarButtonItem *musicItem;
@property(nonatomic, strong) UIBarButtonItem *aboutItem;
@property(nonatomic, strong) UIButton *musicBtn;
@property(nonatomic, strong) UIButton *aboutBtn;

@property (nonatomic,strong) AVAudioPlayer *player;
@property(nonatomic, assign)BOOL isMusic;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *width;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height;

@end

@implementation MysteryBoard_HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isMusic = YES;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"MysteryBoard_bg.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player play];
    
    self.navigationItem.leftBarButtonItem = self.aboutItem;
    self.navigationItem.rightBarButtonItem = self.musicItem;

    [[NSNotificationCenter defaultCenter] postNotificationName:@"setBackground" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MysteryBoard_jump:) name:@"MysteryBoard_gameAgain" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MysteryBoard_homePage:) name:@"homePage" object:nil];

    if iPhone5 {
        self.width.constant = 300;
        self.height.constant = 70;
    }
}

- (void)MysteryBoard_homePage:(NSNotification *)info{
    [NSObject MysteryBoard_findFromeController:self];
}


- (void)MysteryBoard_jump:(NSNotification *)info{
    NSString *str = info.object;
    if([str isEqualToString:@"1"]){
        MysteryBoard_GameVC *vc = [[MysteryBoard_GameVC alloc]initWithLevel:1];
        [self.navigationController pushViewController:vc animated:NO];
    }else if([str isEqualToString:@"2"]){
        MysteryBoard_GameVC *vc = [[MysteryBoard_GameVC alloc]initWithLevel:2];
        [self.navigationController pushViewController:vc animated:NO];
    }
}

- (IBAction)flagAction:(id)sender {
    MysteryBoard_FlagStoneVC *vc = [[MysteryBoard_FlagStoneVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)easyAction:(id)sender {
   MysteryBoard_GameVC *vc = [[MysteryBoard_GameVC alloc]initWithLevel:1];
   [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)hardAction:(id)sender {
    MysteryBoard_GameVC *vc = [[MysteryBoard_GameVC alloc]initWithLevel:2];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)MysteryBoard_aboutAction:(UIButton *)buttion{
    MysteryBoard_IntroductionVC *vc = [[MysteryBoard_IntroductionVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)MysteryBoard_muiscAction:(UIButton *)buttion{
    if(self.isMusic == YES){
       [buttion setBackgroundImage:[UIImage imageNamed:@"music"] forState:UIControlStateNormal];
        [self.player pause];
    }else{
       [buttion setBackgroundImage:[UIImage imageNamed:@"music_1"] forState:UIControlStateNormal];
       [self.player play];
    }
    self.isMusic = !self.isMusic;
}

- (UIButton *)musicBtn{
    if(_musicBtn == nil){
        _musicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _musicBtn.frame = CGRectMake(0, 0, 44, 44);
        [_musicBtn setBackgroundImage:[UIImage imageNamed:@"music_1"] forState:UIControlStateNormal];
        [_musicBtn addTarget:self action:@selector(MysteryBoard_muiscAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _musicBtn;
}
- (UIButton *)aboutBtn{
    if(_aboutBtn == nil){
        _aboutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _aboutBtn.frame = CGRectMake(0, 0, 44, 44);
        [_aboutBtn setBackgroundImage:[UIImage imageNamed:@"introduction"] forState:UIControlStateNormal];
        [_aboutBtn addTarget:self action:@selector(MysteryBoard_aboutAction:) forControlEvents:UIControlEventTouchUpInside];
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
