//
//  HWGHomeVC.m
//  HandWrittenGothic
//
//  Created by  luzhaoyang on 2020/3/18.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import "HWGHomeVC.h"

@interface HWGHomeVC ()

@property (weak, nonatomic) IBOutlet UIButton *oneBtn;
@property (weak, nonatomic) IBOutlet UIButton *twoBtn;
@property (weak, nonatomic) IBOutlet UIButton *threeBtn;
@property (weak, nonatomic) IBOutlet UIButton *fourBtn;

@property (nonatomic,strong) AVAudioPlayer *player;
@property(nonatomic, assign) BOOL isMusice;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *typingTopLayout;

@property(nonatomic, strong) UIBarButtonItem *musicItem;
@property(nonatomic, strong) UIBarButtonItem *aboutItem;
@property(nonatomic, strong) UIButton *musicBtn;
@property(nonatomic, strong) UIButton *aboutBtn;

@end

@implementation HWGHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isMusice = YES;
    [self setMusic];
    
    if kiPhone5 {
        self.bottomTop.constant = 200;
        self.typingTopLayout.constant = 20;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:FontName object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setBackground:) name:@"setBackgroundTheme" object:nil];
    self.navigationItem.rightBarButtonItems = @[self.musicItem,self.aboutItem];
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

- (void)setBackground:(NSNotification *)info{
    self.view.backgroundColor = [UIColor whiteColor];
    [NSString changeThemeFromeController:self];
}

- (IBAction)oneBtnAction:(id)sender {
    HWGJieShaoVC *jieshaoVC = [[HWGJieShaoVC alloc]init];
    [self.navigationController pushViewController:jieshaoVC animated:YES];
}
- (IBAction)twoBtnAction:(id)sender {
    HWGChooseVC *chooseVC = [[HWGChooseVC alloc]init];
    [self.navigationController pushViewController:chooseVC animated:YES];
}
- (IBAction)threeBtnAction:(id)sender {
    HWGTypingVC *typingVC = [[HWGTypingVC alloc]init];
    [self.navigationController pushViewController:typingVC animated:YES];
}
- (IBAction)fourBtnAction:(id)sender {
    HWGWordsVC *wordsVC = [[HWGWordsVC alloc]init];
    [self.navigationController pushViewController:wordsVC animated:YES];
}

- (UIButton *)musicBtn{
    if(_musicBtn == nil){
        _musicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _musicBtn.frame = CGRectMake(0, 0, 30, 30);
        [_musicBtn setImage:[UIImage imageNamed:@"2_music_pre"] forState:UIControlStateNormal];
        [_musicBtn addTarget:self action:@selector(muiscAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _musicBtn;
}
- (UIButton *)aboutBtn{
    if(_aboutBtn == nil){
        _aboutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _aboutBtn.frame = CGRectMake(0, 0, 30, 30);
        [_aboutBtn setImage:[UIImage imageNamed:@"2_rules_btn"] forState:UIControlStateNormal];
        [_aboutBtn addTarget:self action:@selector(aboutAction:) forControlEvents:UIControlEventTouchUpInside];
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

- (void)muiscAction:(UIButton *)buttion{
    if(self.isMusice == YES){
        [self pauseMusic];
        [self.musicBtn setImage:[UIImage imageNamed:@"2_music_nor"] forState:UIControlStateNormal];
    }else{
        [self.musicBtn setImage:[UIImage imageNamed:@"2_music_pre"] forState:UIControlStateNormal];
        [self playMusic];
    }
    self.isMusice = !self.isMusice;
}

- (void)aboutAction:(UIButton *)buttion{
    HWGDescribeVC *descrinbeVC = [[HWGDescribeVC alloc]init];
    [self.navigationController pushViewController:descrinbeVC animated:YES];
}

@end
