//
//  SmartDetective_HomeViewController.m
//  SmartDetective
//
//  Created by zy on 2020/5/13.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import "SmartDetective_HomeViewController.h"

@interface SmartDetective_HomeViewController ()

@property(nonatomic, strong) UIBarButtonItem *leftItem;
@property(nonatomic, strong) UIBarButtonItem *rightItem;
@property(nonatomic, strong) UIButton *leftBtn;
@property(nonatomic, strong) UIButton *rightBtn;

@property (nonatomic,strong) AVAudioPlayer *player;
@property(nonatomic, assign)BOOL isMusic;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *weightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerY;


@end

@implementation SmartDetective_HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = self.rightItem;
    
    self.isMusic = YES;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"SmartDetective_bg_music.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player play];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(homeJumpTopGame:) name:@"homeJumpTopGame" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:FontName object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setBackgroundTheme:) name:@"setBackgroundTheme" object:nil];
    
    if kiPhone5 {
        self.heightLayout.constant = 20;
        self.weightLayout.constant = 300;
        self.centerY.constant = 30;
    }
}

- (void)homeJumpTopGame:(NSNotification *)info{
    NSString *str = info.object;
    NSInteger levelNum = [str integerValue];
    SmartDetective_GameViewController *vc = [[SmartDetective_GameViewController alloc]initWithScore:0 life:3 level:levelNum];
    [self.navigationController pushViewController:vc animated:NO];
}

- (void)setBackgroundTheme:(NSNotification *)info{
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.title = @"";
    [NSObject SmartDetective_changeThemeFromeController:self ];
}

- (IBAction)simpleAction:(id)sender {
    SmartDetective_GameViewController *vc = [[SmartDetective_GameViewController alloc]initWithScore:0 life:3 level:1];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)generalAction:(id)sender {
    SmartDetective_GameViewController *vc = [[SmartDetective_GameViewController alloc]initWithScore:0 life:3 level:2];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)diffAction:(id)sender {
    SmartDetective_GameViewController *vc = [[SmartDetective_GameViewController alloc]initWithScore:0 life:3 level:3];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)recordAction:(id)sender {
    SmartDetective_RecordViewController *vc = [[SmartDetective_RecordViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)SmartDetective_aboutAction:(UIButton *)buttion{
    SmartDetective_IntroductionPageVC *vc = [[SmartDetective_IntroductionPageVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)SmartDetective_muiscAction:(UIButton *)buttion{
    if(self.isMusic == YES){
       [buttion setBackgroundImage:[UIImage imageNamed:@"music"] forState:UIControlStateNormal];
        [self.player pause];
    }else{
       [buttion setBackgroundImage:[UIImage imageNamed:@"music_1"] forState:UIControlStateNormal];
       [self.player play];
    }
    self.isMusic = !self.isMusic;
}


- (UIButton *)leftBtn{
    if(_leftBtn == nil){
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftBtn.frame = CGRectMake(0, 0, 30, 30);
        [_leftBtn setBackgroundImage:[UIImage imageNamed:@"music_1"] forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(SmartDetective_muiscAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}
- (UIButton *)rightBtn{
    if(_rightBtn == nil){
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.frame = CGRectMake(0, 0, 30, 30);
        [_rightBtn setBackgroundImage:[UIImage imageNamed:@"introduction"] forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(SmartDetective_aboutAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}
- (UIBarButtonItem *)leftItem{
    if(_leftItem == nil){
        _leftItem = [[UIBarButtonItem alloc]initWithCustomView:self.leftBtn];
    }
    return _leftItem;
}
- (UIBarButtonItem *)rightItem{
    if(_rightItem == nil){
        _rightItem = [[UIBarButtonItem alloc]initWithCustomView:self.rightBtn];
    }
    return _rightItem;
}

@end
