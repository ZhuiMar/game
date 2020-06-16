//
//  CHBGuessVC.m
//  ColorHotBalloon
//
//  Created by  luzhaoyang on 2020/3/9.
//  Copyright © 2020 zhuimar. All rights reserved.
//

#import "CHBGuessVC.h"
#import "UIColor+hex.h"
#import "myPch.pch"
#import <AVFoundation/AVFoundation.h>
#import "CHBOverVC.h"
#import "UIViewController+YCPopover.h"
#import "NSString+record.h"
#import "CHBTipsVC.h"

@interface CHBGuessVC ()<CHBOverVCDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *balloon1;
@property (weak, nonatomic) IBOutlet UIImageView *balloon2;
@property (weak, nonatomic) IBOutlet UIImageView *balloon3;
@property (weak, nonatomic) IBOutlet UIImageView *balloon4;

@property (weak, nonatomic) IBOutlet UILabel *gongshi1;
@property (weak, nonatomic) IBOutlet UILabel *gongshi2;
@property (weak, nonatomic) IBOutlet UILabel *gonshi3;
@property (weak, nonatomic) IBOutlet UILabel *gongshi4;

@property (weak, nonatomic) IBOutlet UILabel *secondsLabel;
@property (weak, nonatomic) IBOutlet UILabel *defenLabel;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;

@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *middleBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightxBtn;

@property(nonatomic,assign) NSInteger firstCount;
@property(nonatomic,assign) NSInteger secondCount;
@property(nonatomic,assign) NSInteger symbol;
@property(nonatomic,assign) NSInteger resultsNum;
@property(nonatomic,assign) NSInteger defen;
@property(nonatomic,assign) NSInteger timerNumber;
@property(nonatomic,strong) NSTimer *timer;

@property(nonatomic,strong) AVAudioPlayer *player1;
@property(nonatomic,strong) AVAudioPlayer *player2;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttomLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayout;

@end


@implementation CHBGuessVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if kiPhone6 {
        self.topLayout.constant = 25;
        self.topLayout2.constant = 25;
    }else if kiPhone6Plus {
        self.topLayout.constant = 25;
        self.topLayout2.constant = 25;
    }else if kiPhone5 {
        self.topLayout.constant = 10;
        self.topLayout2.constant = 25;
        self.buttomLayout.constant = 25;
        self.heightLayout.constant = 160;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setFont];
    [self setUi];
    
    CHBTipsVC *tipsVC = [[CHBTipsVC alloc]initWithType:@"guess"];
    [self yc_bottomPresentController:tipsVC presentedHeight:Iphone_Height completeHandle:^(BOOL presented) {
        if(presented == NO){
            self.timerNumber = 120;
            self.defen = 0;
            self.defenLabel.text = [NSString stringWithFormat:@"%ld",self.defen];
            self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerChange) userInfo:nil repeats:YES];
            [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
        }
    }];
}

- (void)setUi{
    NSMutableArray *arr = [NSMutableArray new];
    do {
        NSInteger num = [self getRandomNumber:1 to:4];
        NSNumber *number = @(num);
        if([arr containsObject:number] == NO){
            [arr addObject:@(num)];
        }
    }while (arr.count < 4); {
        NSMutableArray *nameArr = [NSMutableArray new];
        for (NSNumber *number in arr) {
            NSString *imageName = [NSString stringWithFormat:@"balloon_%ld",[number integerValue]];
            [nameArr addObject:imageName];
        }
        if(nameArr.count == 4){
            self.balloon1.image = [UIImage imageNamed:nameArr[0]];
            self.balloon2.image = [UIImage imageNamed:nameArr[1]];
            self.balloon3.image = [UIImage imageNamed:nameArr[2]];
            self.balloon4.image = [UIImage imageNamed:nameArr[3]];
        }
        
        // balloon2
        NSInteger index = [nameArr indexOfObject:@"balloon_2"];
        
        if(arr.count == 4 && index == 0){
            
            self.firstCount = [self getFirstNumber];
            self.symbol = [self getSymbolNumber];
            if(self.symbol == 0){ // jian
                self.secondCount = [self getSecondNumberWithCount:self.firstCount];
                self.gongshi1.text = [NSString stringWithFormat:@"%ld-%ld=?",self.firstCount,self.secondCount];
                self.resultsNum = self.firstCount - self.secondCount;
            }else{ // jia
                self.secondCount = [self getSecondNumberWithCount:25];
                self.gongshi1.text = [NSString stringWithFormat:@"%ld+%ld=?",self.firstCount,self.secondCount];
                self.resultsNum = self.firstCount + self.secondCount;
            }
            self.gongshi2.text = [self puTongGongShi];
            self.gonshi3.text = [self puTongGongShi];
            self.gongshi4.text = [self puTongGongShi];
            [self setResultsBtn];
        }
        
        else if (arr.count == 4 && index == 1){
            
            self.gongshi1.text = [self puTongGongShi];
            self.firstCount = [self getFirstNumber];
            self.symbol = [self getSymbolNumber];
            if(self.symbol == 0){ // jian
                self.secondCount = [self getSecondNumberWithCount:self.firstCount];
                self.gongshi2.text = [NSString stringWithFormat:@"%ld-%ld=?",self.firstCount,self.secondCount];
                self.resultsNum = self.firstCount - self.secondCount;
            }else{ // jia
                self.secondCount = [self getSecondNumberWithCount:25];
                self.gongshi2.text = [NSString stringWithFormat:@"%ld+%ld=?",self.firstCount,self.secondCount];
                self.resultsNum = self.firstCount + self.secondCount;
            }
            self.gonshi3.text = [self puTongGongShi];
            self.gongshi4.text = [self puTongGongShi];
            [self setResultsBtn];
        }
        
        else if (arr.count == 4 && index == 2){
            
            self.gongshi1.text = [self puTongGongShi];
            self.gongshi2.text = [self puTongGongShi];
            self.firstCount = [self getFirstNumber];
            self.symbol = [self getSymbolNumber];
            if(self.symbol == 0){ // jian
                self.secondCount = [self getSecondNumberWithCount:self.firstCount];
                self.gonshi3.text = [NSString stringWithFormat:@"%ld-%ld=?",self.firstCount,self.secondCount];
                self.resultsNum = self.firstCount - self.secondCount;
            }else{ // jia
                self.secondCount = [self getSecondNumberWithCount:25];
                self.gonshi3.text = [NSString stringWithFormat:@"%ld+%ld=?",self.firstCount,self.secondCount];
                self.resultsNum = self.firstCount + self.secondCount;
            }
            self.gongshi4.text = [self puTongGongShi];
            [self setResultsBtn];
        }
        
        else if (arr.count == 4 && index == 3){
            
            self.gongshi1.text = [self puTongGongShi];
            self.gongshi2.text = [self puTongGongShi];
            self.gonshi3.text = [self puTongGongShi];
            self.firstCount = [self getFirstNumber];
            self.symbol = [self getSymbolNumber];
            if(self.symbol == 0){ // jian
                self.secondCount = [self getSecondNumberWithCount:self.firstCount];
                self.gongshi4.text = [NSString stringWithFormat:@"%ld-%ld=?",self.firstCount,self.secondCount];
                self.resultsNum = self.firstCount - self.secondCount;
            }else{ // jia
                self.secondCount = [self getSecondNumberWithCount:25];
                self.gongshi4.text = [NSString stringWithFormat:@"%ld+%ld=?",self.firstCount,self.secondCount];
                self.resultsNum = self.firstCount + self.secondCount;
            }
            [self setResultsBtn];
        }
    }
}


- (void)timerChange{
    if(self.timerNumber == 0 || self.timerNumber < 0){
        [self.timer invalidate];
        self.timer = nil;
        [NSString saveScore:self.defen key:@"Guess_type"];
        CHBOverVC *gameOver = [[CHBOverVC alloc]initWithSocre:self.defen];
        gameOver.delegate = self;
        [self yc_bottomPresentController:gameOver presentedHeight:Iphone_Height completeHandle:^(BOOL presented) {
        }];
    }else{
        self.timerNumber = self.timerNumber - 1;
        self.secondsLabel.text = [NSString stringWithFormat:@"%lds",self.timerNumber];
    }
}


- (void)setFont{
    self.secondsLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:25];
    self.defenLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:25];
    self.defenLabel.textColor = [UIColor colorWithHexString:@"#FF6D33"];
    self.titlelabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:23];
    self.leftBtn.titleLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:25];
    self.middleBtn.titleLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:25];
    self.rightxBtn.titleLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:25];
    self.gongshi1.layer.cornerRadius = 2;
    self.gongshi1.layer.masksToBounds = YES;
    self.gongshi1.font = [UIFont fontWithName:@"Pangolin-Regular" size:13];
    self.gongshi2.layer.cornerRadius = 2;
    self.gongshi2.layer.masksToBounds = YES;
    self.gongshi2.font = [UIFont fontWithName:@"Pangolin-Regular" size:13];
    self.gonshi3.layer.cornerRadius = 2;
    self.gonshi3.layer.masksToBounds = YES;
    self.gonshi3.font = [UIFont fontWithName:@"Pangolin-Regular" size:13];
    self.gongshi4.layer.cornerRadius = 2;
    self.gongshi4.layer.masksToBounds = YES;
    self.gongshi4.font = [UIFont fontWithName:@"Pangolin-Regular" size:13];
}

- (void)homeOverVCAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)agianOverVCAction{
    [self setUi];
    [self setResultsBtn];
    self.timerNumber = 120;
    self.defen = 0;
    self.defenLabel.text = [NSString stringWithFormat:@"%ld",self.defen];
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerChange) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void)getFormula1{
    self.firstCount = [self getFirstNumber];
    self.symbol = [self getSymbolNumber];
    if(self.symbol == 0){ // jian
        self.secondCount = [self getSecondNumberWithCount:self.firstCount];
        self.gongshi2.text = [NSString stringWithFormat:@"%ld-%ld=?",self.firstCount,self.secondCount];
        self.resultsNum = self.firstCount - self.secondCount;
    }else{ // jia
        self.secondCount = [self getSecondNumberWithCount:25];
        self.gongshi2.text = [NSString stringWithFormat:@"%ld+%ld=?",self.firstCount,self.secondCount];
        self.resultsNum = self.firstCount + self.secondCount;
    }
}

- (NSString *)puTongGongShi{
    NSString *gongshi = [[NSString alloc]init];
    self.symbol = [self getSymbolNumber];
    if(self.symbol == 0){ // jian
        gongshi = [NSString stringWithFormat:@"%ld-%ld=?",[self getFirstNumber],[self getSecondNumberWithCount:[self getFirstNumber]]];
    }else{ // jia
        self.secondCount = [self getSecondNumberWithCount:25];
        gongshi = [NSString stringWithFormat:@"%ld+%ld=?",[self getFirstNumber],[self getSecondNumberWithCount:[self getFirstNumber]]];
    }
    return gongshi;
}

- (void)setResultsBtn{
    NSInteger num = [self getRandomNumber:0 to:2];
    if(num == 0){
        [self.leftBtn setTitle:[NSString stringWithFormat:@"%ld",self.resultsNum] forState:UIControlStateNormal];
        [self.middleBtn setTitle:[NSString stringWithFormat:@"%ld",[self getRandomNumber:self.resultsNum + 1 to:49]] forState:UIControlStateNormal];
        [self.rightxBtn setTitle:[NSString stringWithFormat:@"%ld",[self getRandomNumber:0 to:self.resultsNum - 1]] forState:UIControlStateNormal];
        
    }else if (num == 1){
        [self.middleBtn setTitle:[NSString stringWithFormat:@"%ld",self.resultsNum] forState:UIControlStateNormal];
        [self.leftBtn setTitle:[NSString stringWithFormat:@"%ld",[self getRandomNumber:self.resultsNum + 1 to:49]] forState:UIControlStateNormal];
        [self.rightxBtn setTitle:[NSString stringWithFormat:@"%ld",[self getRandomNumber:0 to:self.resultsNum - 1]] forState:UIControlStateNormal];
        
    }else if (num == 2){
        [self.rightxBtn setTitle:[NSString stringWithFormat:@"%ld",self.resultsNum] forState:UIControlStateNormal];
        [self.middleBtn setTitle:[NSString stringWithFormat:@"%ld",[self getRandomNumber:self.resultsNum + 1 to:49]] forState:UIControlStateNormal];
        [self.leftBtn setTitle:[NSString stringWithFormat:@"%ld",[self getRandomNumber:0 to:self.resultsNum - 1]] forState:UIControlStateNormal];
    }
}

- (NSInteger)getRandomNumber:(NSInteger)from to:(NSInteger)to{
    if(from < 0 || to < 0){
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



- (IBAction)leftAction:(id)sender {
    NSString *btnTitle = [sender titleForState:UIControlStateNormal];
    if(self.resultsNum == [btnTitle integerValue]){
        self.defen = self.defen + 5;
        self.defenLabel.text = [NSString stringWithFormat:@"%ld",self.defen];
        
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"correct_music.mp3" withExtension:nil];
        self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player1 play];
        
    }else{
        self.timerNumber = self.timerNumber - 5;
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"error_music.mp3" withExtension:nil];
        self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player2 play];
    }
    [self setUi];
    [self setResultsBtn];
    
}
- (IBAction)middleAction:(id)sender {
    NSString *btnTitle = [sender titleForState:UIControlStateNormal];
    if(self.resultsNum == [btnTitle integerValue]){
        self.defen = self.defen + 5;
        
        self.defenLabel.text = [NSString stringWithFormat:@"%ld",self.defen];
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"correct_music.mp3" withExtension:nil];
        self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player1 play];
    }else{
        self.timerNumber = self.timerNumber - 5;
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"error_music.mp3" withExtension:nil];
        self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player2 play];
    }
    [self setUi];
    [self setResultsBtn];
}
- (IBAction)rightAction:(id)sender {
    
    NSString *btnTitle = [sender titleForState:UIControlStateNormal];
    if(self.resultsNum == [btnTitle integerValue]){
        self.defen = self.defen + 5;
        self.defenLabel.text = [NSString stringWithFormat:@"%ld",self.defen];
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"correct_music.mp3" withExtension:nil];
        self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player1 play];
    }else{
        self.timerNumber = self.timerNumber - 5;
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"error_music.mp3" withExtension:nil];
        self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player2 play];
    }
    [self setUi];
    [self setResultsBtn];
}

@end
