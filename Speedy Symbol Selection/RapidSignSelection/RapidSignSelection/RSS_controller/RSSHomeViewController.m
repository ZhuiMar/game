//
//  RSSHomeViewController.m
//  RapidSignSelection
//
//  Created by zy on 2020/6/4.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "RSSHomeViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "UIFont+fonts.h"
#import "RSSAboutViewController.h"
#import "RSSRecodViewController.h"
#import "RSSGameViewController.h"

@interface RSSHomeViewController ()

@property(nonatomic, strong) UIBarButtonItem *musicItem;
@property(nonatomic, strong) UIBarButtonItem *aboutItem;
@property(nonatomic, strong) UIButton *musicBtn;
@property(nonatomic, strong) UIButton *aboutBtn;

@property (nonatomic,strong) AVAudioPlayer *bgPlayer;
@property(nonatomic, assign)BOOL isMusic;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toplayout;



@end

@implementation RSSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isMusic = YES;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"RSS_BGMISIC.mp3" withExtension:nil];
    self.bgPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.bgPlayer play];
    self.navigationItem.leftBarButtonItem = self.aboutItem;
    self.navigationItem.rightBarButtonItem = self.musicItem;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(RapidSignSelection_jump:) name:@"RapidSignSelection_gameAgain" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(RapidSignSelectionSetBackgroundView:) name:@"RapidSignSelectionSetBackgroundView" object:nil];
    

    [[NSNotificationCenter defaultCenter] postNotificationName:DEFAULTFIGHTERNAME object:nil];
    
    if kiPhone5 {
        self.toplayout.constant = 60;
    }
}

- (void)RapidSignSelectionSetBackgroundView:(NSNotification *)infdata{
    self.view.backgroundColor = [UIColor whiteColor];
    [Reachability setPrivacyPolicyBackgrountColor:self index:1];
}

- (void)RapidSignSelection_jump:(NSNotification *)info{
    NSNumber *level = info.object;
    RSSGameViewController *gameOver = [[RSSGameViewController alloc]initWithLevel:[level integerValue] isTip:NO];
    [self.navigationController pushViewController:gameOver animated:NO];
}

- (void)RSS_muiscAction:(UIButton *)buttion{
   if(self.isMusic == YES){
      [buttion setBackgroundImage:[UIImage imageNamed:@"music1"] forState:UIControlStateNormal];
       [self.bgPlayer pause];
   }else{
      [buttion setBackgroundImage:[UIImage imageNamed:@"music2"] forState:UIControlStateNormal];
      [self.bgPlayer play];
   }
   self.isMusic = !self.isMusic;
}

- (void)RSS_aboutAction:(UIButton *)buttion{
    RSSAboutViewController *about = [[RSSAboutViewController alloc]init];
    [self.navigationController pushViewController:about animated:YES];
}

- (IBAction)simpleAction:(id)sender {
    RSSGameViewController *gameOver = [[RSSGameViewController alloc]initWithLevel:1 isTip:YES];
    [self.navigationController pushViewController:gameOver animated:YES];
}
- (IBAction)medilAction:(id)sender {
    RSSGameViewController *gameOver = [[RSSGameViewController alloc]initWithLevel:2 isTip:YES];
    [self.navigationController pushViewController:gameOver animated:YES];
}
- (IBAction)diffcultAction:(id)sender {
    RSSGameViewController *gameOver = [[RSSGameViewController alloc]initWithLevel:3 isTip:YES];
    [self.navigationController pushViewController:gameOver animated:YES];
}
- (IBAction)recodeAction:(id)sender {
    RSSRecodViewController *rcode = [[RSSRecodViewController alloc]init];
    [self.navigationController pushViewController:rcode animated:YES];
}

- (UIButton *)musicBtn{
    if(_musicBtn == nil){
        _musicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _musicBtn.frame = CGRectMake(0, 0, 44, 44);
        [_musicBtn setBackgroundImage:[UIImage imageNamed:@"music2"] forState:UIControlStateNormal];
        [_musicBtn addTarget:self action:@selector(RSS_muiscAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _musicBtn;
}
- (UIButton *)aboutBtn{
    if(_aboutBtn == nil){
        _aboutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _aboutBtn.frame = CGRectMake(0, 0, 44, 44);
        [_aboutBtn setBackgroundImage:[UIImage imageNamed:@"about"] forState:UIControlStateNormal];
        [_aboutBtn addTarget:self action:@selector(RSS_aboutAction:) forControlEvents:UIControlEventTouchUpInside];
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
