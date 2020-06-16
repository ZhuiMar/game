//
//  CHBCountVC.m
//  ColorHotBalloon
//
//  Created by  luzhaoyang on 2020/3/9.
//  Copyright © 2020 zhuimar. All rights reserved.
//

#import "CHBCountVC.h"
#import "UIColor+hex.h"
#import <AVFoundation/AVFoundation.h>
#import "myPch.pch"
#import "CHBTipsVC.h"
#import "UIViewController+YCPopover.h"
#import "NSString+record.h"
#import "CHBOverVC.h"

@interface CHBCountVC ()<CHBOverVCDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLayout;

@property (weak, nonatomic) IBOutlet UILabel *secondsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *midleBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIView *bollerView;

@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@property(nonatomic,assign) NSInteger firstCount;
@property(nonatomic,assign) NSInteger secondCount;
@property(nonatomic,assign) NSInteger symbol;

@property(nonatomic,assign) NSInteger resultsNum;
@property(nonatomic,assign) NSInteger defen;

@property(nonatomic,assign) NSInteger timerNumber;
@property(nonatomic,strong) NSTimer *timer;

@property(nonatomic,strong) AVAudioPlayer *player1;
@property(nonatomic,strong) AVAudioPlayer *player2;

@end

@implementation CHBCountVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if kiPhone6 {
        self.topLayout.constant = 30;
    }else if kiPhone6Plus {
        self.topLayout.constant = 30;
    }else if kiPhone5 {
        self.topLayout2.constant = 15;
        self.topLayout.constant = 30;
        self.bottomLayout.constant = 25;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setFont];
    [self getFormula];
    [self setResultsBtn];
    
    CHBTipsVC *tipsVC = [[CHBTipsVC alloc]initWithType:@"count"];
    [self yc_bottomPresentController:tipsVC presentedHeight:Iphone_Height completeHandle:^(BOOL presented) {
        if(presented == NO){
            self.timerNumber = 120;
            self.defen = 0;
            self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.defen];
            self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerChange) userInfo:nil repeats:YES];
            [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
        }
    }];
}

- (void)timerChange{
    if(self.timerNumber == 0 || self.timerNumber < 0){
        [self.timer invalidate];
        self.timer = nil;
        [NSString saveScore:self.defen key:@"Count_type"];
        CHBOverVC *gameOver = [[CHBOverVC alloc]initWithSocre:self.defen];
        gameOver.delegate = self;
        [self yc_bottomPresentController:gameOver presentedHeight:Iphone_Height completeHandle:^(BOOL presented) {
        }];
    }else{
        self.timerNumber = self.timerNumber - 1;
        self.secondsLabel.text = [NSString stringWithFormat:@"%lds",self.timerNumber];
    }
}

- (void)homeOverVCAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)agianOverVCAction{
    [self getFormula];
    [self setResultsBtn];
    self.timerNumber = 120;
    self.defen = 0;
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.defen];
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerChange) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void)dealloc{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)setFont{
    self.secondsLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:25];
    self.scoreLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:25];
    self.scoreLabel.textColor = [UIColor colorWithHexString:@"#FF6D33"];
    self.titleLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:25];
    self.leftBtn.titleLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:25];
    self.midleBtn.titleLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:25];
    self.rightBtn.titleLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:25];
    self.countLabel.layer.cornerRadius = 4;
    self.countLabel.layer.masksToBounds = YES;
    self.countLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:17];
}

- (IBAction)leftAction:(UIButton *)sender {
    NSString *btnTitle = [sender titleForState:UIControlStateNormal];
    if(self.resultsNum == [btnTitle integerValue]){
        self.defen = self.defen + 5;
        self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.defen];
        
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"correct_music.mp3" withExtension:nil];
        self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player1 play];
        
    }else{
        self.timerNumber = self.timerNumber - 5;
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"error_music.mp3" withExtension:nil];
        self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player2 play];
    }
    [self getFormula];
    [self setResultsBtn];
}
- (IBAction)midelAction:(UIButton *)sender {
    NSString *btnTitle = [sender titleForState:UIControlStateNormal];
    if(self.resultsNum == [btnTitle integerValue]){
        self.defen = self.defen + 5;
        
        self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.defen];
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"correct_music.mp3" withExtension:nil];
        self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player1 play];
    }else{
        self.timerNumber = self.timerNumber - 5;
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"error_music.mp3" withExtension:nil];
        self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player2 play];
    }
    [self getFormula];
    [self setResultsBtn];
}
- (IBAction)rightAction:(UIButton *)sender {
    NSString *btnTitle = [sender titleForState:UIControlStateNormal];
    if(self.resultsNum == [btnTitle integerValue]){
        self.defen = self.defen + 5;
        self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.defen];
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"correct_music.mp3" withExtension:nil];
        self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player1 play];
    }else{
        self.timerNumber = self.timerNumber - 5;
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"error_music.mp3" withExtension:nil];
        self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player2 play];
    }
    [self getFormula];
    [self setResultsBtn];
}

- (void)getFormula{
    self.firstCount = [self getFirstNumber];
    self.symbol = [self getSymbolNumber];
    if(self.symbol == 0){ // jian
        self.secondCount = [self getSecondNumberWithCount:self.firstCount];
        self.countLabel.text = [NSString stringWithFormat:@"%ld-%ld=?",self.firstCount,self.secondCount];
        self.resultsNum = self.firstCount - self.secondCount;
    }else{ // jia
        self.secondCount = [self getSecondNumberWithCount:25];
        self.countLabel.text = [NSString stringWithFormat:@"%ld+%ld=?",self.firstCount,self.secondCount];
        self.resultsNum = self.firstCount + self.secondCount;
    }
}

- (void)setResultsBtn{
    NSInteger num = [self getRandomNumber:0 to:2];
    if(num == 0){
        [self.leftBtn setTitle:[NSString stringWithFormat:@"%ld",self.resultsNum] forState:UIControlStateNormal];
        [self.midleBtn setTitle:[NSString stringWithFormat:@"%ld",[self getRandomNumber:self.resultsNum + 1 to:49]] forState:UIControlStateNormal];
        [self.rightBtn setTitle:[NSString stringWithFormat:@"%ld",[self getRandomNumber:0 to:self.resultsNum - 1]] forState:UIControlStateNormal];
        
    }else if (num == 1){
        [self.midleBtn setTitle:[NSString stringWithFormat:@"%ld",self.resultsNum] forState:UIControlStateNormal];
        [self.leftBtn setTitle:[NSString stringWithFormat:@"%ld",[self getRandomNumber:self.resultsNum + 1 to:49]] forState:UIControlStateNormal];
        [self.rightBtn setTitle:[NSString stringWithFormat:@"%ld",[self getRandomNumber:0 to:self.resultsNum - 1]] forState:UIControlStateNormal];
        
    }else if (num == 2){
        [self.rightBtn setTitle:[NSString stringWithFormat:@"%ld",self.resultsNum] forState:UIControlStateNormal];
        [self.midleBtn setTitle:[NSString stringWithFormat:@"%ld",[self getRandomNumber:self.resultsNum + 1 to:49]] forState:UIControlStateNormal];
        [self.leftBtn setTitle:[NSString stringWithFormat:@"%ld",[self getRandomNumber:0 to:self.resultsNum - 1]] forState:UIControlStateNormal];
    }
}

- (NSInteger)getRandomNumber:(NSInteger)from to:(NSInteger)to{
    if(from < 0 || to < 0 || from >= to){
        return [self getRandomNumber:0 to:50];
    }
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}
- (NSInteger)getFirstNumber{
    return [self getRandomNumber:0 to:25];
}
- (NSInteger)getSecondNumberWithCount:(NSInteger)count{
    return [self getRandomNumber:0 to:count];
}
- (NSInteger)getSymbolNumber{
    return [self getRandomNumber:0 to:1];
}

@end
