//
//  MBBall_GamePageVC.m
//  MathematicsBasketball
//
//  Created by zy on 2020/5/26.
//  Copyright © 2020 zhongba. All rights reserved.
//

#import "MBBall_GamePageVC.h"
#import "MBBall_ReadyPageVC.h"
#import "NSString+MBBall_rammd.h"
#import "NSArray+MBBall_rank.h"
#import <AVFoundation/AVFoundation.h>
#import "MBBall_GameOverPageVC.h"
#import "MBNavigteController.h"

#define angle2Radian(angle) ((angle) / 180.0 * M_PI)

@interface MBBall_GamePageVC ()

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIImageView *ballOne;
@property (weak, nonatomic) IBOutlet UIImageView *ballTwo;
@property (weak, nonatomic) IBOutlet UIImageView *ballThree;

@property (weak, nonatomic) IBOutlet UIImageView *stateImage;
@property (weak, nonatomic) IBOutlet UILabel *defenLabel;

@property (weak, nonatomic) IBOutlet UIButton *gongshitext;
@property (weak, nonatomic) IBOutlet UILabel *tishiLabel;

@property (weak, nonatomic) IBOutlet UIButton *answerOne;
@property (weak, nonatomic) IBOutlet UIButton *answerTwo;
@property (weak, nonatomic) IBOutlet UIButton *answerThree;

@property (nonatomic,strong) UIImageView *lanImageView;
@property (nonatomic,strong) UIImageView *lanBallImageView;

@property (nonatomic, strong) NSTimer *lanTimer;
@property (nonatomic, strong) NSTimer *moveBallTimer;
@property (nonatomic, strong) NSTimer *findLanQiuTimer;

@property (nonatomic, assign) BOOL isRight;

@property (nonatomic, assign) NSInteger score;
@property (nonatomic, assign) NSInteger life;
@property (nonatomic, assign) NSInteger level;

@property (nonatomic, assign) NSInteger rightNum;

@property (weak, nonatomic) IBOutlet UIImageView *bballOne;
@property (weak, nonatomic) IBOutlet UIImageView *bballTwo;
@property (weak, nonatomic) IBOutlet UIImageView *bballThree;

@property (nonatomic,strong) AVAudioPlayer *rightPlayer;
@property (nonatomic,strong) AVAudioPlayer *wrongPlayer;

@property (nonatomic, assign) NSInteger cishu;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lifeTop;

@end

@implementation MBBall_GamePageVC

- (instancetype)initWitleve:(NSInteger)level{
    if(self = [super init]){
        self.level = level;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)setFonts{
    self.gongshitext.titleLabel.font = [UIFont fontWithName:TEXTFONT size:30];
    self.answerOne.titleLabel.font = [UIFont fontWithName:TEXTFONT size:24];
    self.answerTwo.titleLabel.font = [UIFont fontWithName:TEXTFONT size:24];
    self.answerThree.titleLabel.font = [UIFont fontWithName:TEXTFONT size:24];
    self.defenLabel.font = [UIFont fontWithName:TEXTFONT size:50];
    self.scoreLabel.font = [UIFont fontWithName:TEXTFONT size:30];
    self.tishiLabel.font = [UIFont fontWithName:TEXTFONT size:24];
    self.defenLabel.font = [UIFont fontWithName:TEXTFONT size:45];
    
    if kiPhone5 {
         self.tishiLabel.font = [UIFont fontWithName:TEXTFONT size:20];
    }
    if IS_IPHONE_X_orMore {
        self.lifeTop.constant = 55;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.defenLabel setHidden:YES];
    [self.stateImage setHidden:YES];
    
    self.score = 0;
    self.life = 3;
    [self setSelfLiftWithLife:self.life];
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.score];
    self.isRight = YES;
    
    [self setFonts];
    MBBall_ReadyPageVC *vc = [[MBBall_ReadyPageVC alloc]init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:NO completion:^{
    }];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gameStart) name:@"ReadyGo" object:nil];
    [self.view addSubview:self.lanImageView];
    [self.view addSubview:self.lanBallImageView];
    
    MBNavigteController *navigate = (MBNavigteController *)self.navigationController;
    navigate.back = ^{
        if(self.lanTimer != nil){
            [self.lanTimer invalidate];
            self.lanTimer = nil;
        }
        if(self.moveBallTimer != nil){
            [self.moveBallTimer invalidate];
            self.moveBallTimer = nil;
        }
        if(self.findLanQiuTimer != nil){
            [self.findLanQiuTimer invalidate];
            self.findLanQiuTimer = nil;
        }
        [self saveAction];
    };
}

- (void)dealloc{
    if(self.lanTimer != nil){
        [self.lanTimer invalidate];
        self.lanTimer = nil;
    }
    if(self.moveBallTimer != nil){
        [self.moveBallTimer invalidate];
        self.moveBallTimer = nil;
    }
    if(self.findLanQiuTimer != nil){
        [self.findLanQiuTimer invalidate];
        self.findLanQiuTimer = nil;
    }
}

- (void)gameStart{
    [self random];
    self.lanTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(moveLan) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.lanTimer forMode:NSDefaultRunLoopMode];
}

- (IBAction)oneAction:(UIButton *)button {
    NSString *string = [button titleForState:UIControlStateNormal];
    [self judgeWrongOrRight:[string integerValue]];
}
- (IBAction)twoAction:(UIButton *)button {
    NSString *string = [button titleForState:UIControlStateNormal];
    [self judgeWrongOrRight:[string integerValue]];
}
- (IBAction)threeAction:(UIButton *)button {
    NSString *string = [button titleForState:UIControlStateNormal];
    [self judgeWrongOrRight:[string integerValue]];
}

- (void)judgeWrongOrRight:(NSInteger)number{
    if(self.rightNum == number){
        [self loopBasecAnimation];
        self.moveBallTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(moveBallAction) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.moveBallTimer forMode:NSDefaultRunLoopMode];
        self.findLanQiuTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(findLanQiuAction) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.findLanQiuTimer forMode:NSDefaultRunLoopMode];
        
    }else{
        [self wrongMusic];
    }
    [self random];
}

- (void)loopBasecAnimation{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2.0];
    rotationAnimation.duration = 0.9;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = ULLONG_MAX;
    [self.lanBallImageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}
- (void)stopLoopAnimation{
    [self.lanBallImageView.layer removeAllAnimations];
}

- (void)moveBallAction{
    CGRect frame = self.lanBallImageView.frame;
    CGFloat y = frame.origin.y - 2;
    self.lanBallImageView.frame = CGRectMake(Iphone_Width/2-22.5, y, 55, 55);
}

- (void)pauseTimer{
    [self.lanTimer setFireDate:[NSDate distantFuture]];
}
- (void)continueTimer{
    [self.lanTimer setFireDate:[NSDate distantPast]];
}

- (void)douDong:(UIImageView *)view{
    CAKeyframeAnimation  *keyAnima = [CAKeyframeAnimation animation];
    keyAnima.keyPath = @"transform.rotation";
    keyAnima.values = @[@(-angle2Radian(16)), @(angle2Radian(16)), @(-angle2Radian(16))];
    keyAnima.removedOnCompletion = NO;
    keyAnima.fillMode = kCAFillModeForwards;
    keyAnima.duration = 0.01;
    keyAnima.repeatCount = 50;
    [view.layer addAnimation:keyAnima forKey:nil];
}

- (void)findLanQiuAction{
    
    CGFloat y = self.lanBallImageView.frame.origin.y;
    if(y <= 115){
        if(self.moveBallTimer != nil){
            [self.moveBallTimer invalidate];
            self.moveBallTimer = nil;
        }
        
        if(self.findLanQiuTimer != nil){
            [self.findLanQiuTimer invalidate];
            self.findLanQiuTimer = nil;
            [self stopLoopAnimation];
        }
        
        CGFloat centerX = self.lanBallImageView.center.x;
        CGFloat centerY = self.lanBallImageView.center.y;
        
        if(centerX>self.lanImageView.frame.origin.x && centerX < self.lanImageView.frame.origin.x + 80 && centerY>self.lanImageView.frame.origin.y &&  centerY<self.lanImageView.frame.origin.y + 94){
            [self rightMusic];

            [self.defenLabel setHidden:NO];
            [self.stateImage setHidden:NO];
            self.stateImage.image = [UIImage imageNamed:@"awesome"];
            self.defenLabel.text = @"+10";
            
            [UIView animateWithDuration:0.5 animations:^{
                self.defenLabel.transform = CGAffineTransformMakeScale(1.5, 1.5);
                self.stateImage.transform = CGAffineTransformMakeScale(1.5, 1.5);
            } completion:^(BOOL finished) {
                self.defenLabel.transform = CGAffineTransformIdentity;
                self.stateImage.transform = CGAffineTransformIdentity;
            }];
            
            [self pauseTimer];
            self.lanBallImageView.frame = self.lanBallImageView.frame;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self continueTimer];
                [self.defenLabel setHidden:YES];
                [self.stateImage setHidden:YES];
                self.lanBallImageView.frame = CGRectMake(Iphone_Width/2-22.5, Iphone_Height-158-55, 55, 55);
            });
        }else{
            [self wrongMusic];
            [self.defenLabel setHidden:NO];
            [self.stateImage setHidden:NO];
            self.stateImage.image = [UIImage imageNamed:@"cry"];
            self.defenLabel.text = @"+0";
            [self douDong:self.stateImage];
            self.lanBallImageView.frame = CGRectMake(Iphone_Width/2-22.5, Iphone_Height-158-55, 55, 55);
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.defenLabel setHidden:YES];
                [self.stateImage setHidden:YES];
            });
        }
    }
}

- (void)wrongMusic{
    self.life = self.life - 1;
    [self setSelfLiftWithLife:self.life];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"wrongmusic.mp3" withExtension:nil];
    self.wrongPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.wrongPlayer play];
}

- (void)rightMusic{
    self.score += 10;
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.score];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"rightmusic.mp3" withExtension:nil];
    self.rightPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.rightPlayer play];
}

- (void)random{
    NSInteger fa = [NSString randomNumber:0 to:1];
    NSInteger reulst = [NSString randomNumber:10 to:99];
    if(fa == 0){
        NSUInteger left = [NSString randomNumber:0 to:reulst];
        NSString *tittle = [NSString stringWithFormat:@"%ld-%ld=?",reulst,left];
        [self.gongshitext setTitle:tittle forState:UIControlStateNormal];
        self.rightNum = reulst - left;
    }
    if(fa == 1){
        NSInteger left = [NSString randomNumber:0 to:reulst];
        NSInteger right = reulst - left;
        NSString *tittle = [NSString stringWithFormat:@"%ld+%ld=?",left,right];
        [self.gongshitext setTitle:tittle forState:UIControlStateNormal];
        self.rightNum = left + right;
    }
    
    NSLog(@"=====%ld",self.rightNum);
    
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    do{
        NSInteger num = [NSString randomNumber:10 to:99];
        if([arr containsObject:@(num)] == NO && [arr containsObject:@(self.rightNum)] == NO){
            [arr addObject:@(num)];
        }
    }while (arr.count<2);
    
    [arr addObject:@(self.rightNum)];
    NSMutableArray *newArr = [NSArray MBBallandamArry:arr];
    if(newArr.count == 3){
        [self.answerOne setTitle:[NSString stringWithFormat:@"%@",newArr[0]] forState:UIControlStateNormal];
        [self.answerTwo setTitle:[NSString stringWithFormat:@"%@",newArr[1]] forState:UIControlStateNormal];
        [self.answerThree setTitle:[NSString stringWithFormat:@"%@",newArr[2]] forState:UIControlStateNormal];
    }
    
    NSMutableArray *arrBg = [[NSMutableArray alloc]initWithArray:@[@"button_1",@"button_right",@"button_wrong"]];
    NSMutableArray *NewArrBg = [NSArray MBBallandamArry:arrBg];
    [self.answerOne setBackgroundImage:[UIImage imageNamed:NewArrBg[0]] forState:UIControlStateNormal];
    [self.answerTwo setBackgroundImage:[UIImage imageNamed:NewArrBg[1]] forState:UIControlStateNormal];
    [self.answerThree setBackgroundImage:[UIImage imageNamed:NewArrBg[2]] forState:UIControlStateNormal];
}

- (void)moveLan{
    CGRect frame = self.lanImageView.frame;
    if(self.isRight == YES){
        CGFloat JIANGE = 0.0;
        if(self.cishu < 4 && self.cishu >= 0){
            if(self.level == 1){
                JIANGE = 0.4;
            }
            if(self.level == 2){
                JIANGE = 0.5;
            }
            if(self.level == 3){
                JIANGE = 0.6;
            }
        }
        if(self.cishu >= 4 && self.cishu<10){
            if(self.level == 1){
                JIANGE = 0.6;
            }
            if(self.level == 2){
                JIANGE = 0.7;
            }
            if(self.level == 3){
                JIANGE = 0.8;
            }
        }
        if(self.cishu >= 10){
            if(self.level == 1){
                JIANGE = 0.8;
            }
            if(self.level == 2){
                JIANGE = 0.9;
            }
            if(self.level == 3){
                JIANGE = 1;
            }
        }
        CGFloat x = frame.origin.x + JIANGE;
        self.lanImageView.frame = CGRectMake(x, 90, 80, 94);
    }
    if(self.isRight == NO){
        CGFloat JIANGE = 0.0;
        if(self.cishu < 4 && self.cishu >= 0){
            if(self.level == 1){
                JIANGE = 0.4;
            }
            if(self.level == 2){
                JIANGE = 0.5;
            }
            if(self.level == 3){
                JIANGE = 0.6;
            }
        }
        if(self.cishu >= 4 && self.cishu<10){
            if(self.level == 1){
                JIANGE = 0.6;
            }
            if(self.level == 2){
                JIANGE = 0.7;
            }
            if(self.level == 3){
                JIANGE = 0.8;
            }
        }
        if(self.cishu >= 10){
            if(self.level == 1){
                JIANGE = 0.8;
            }
            if(self.level == 2){
                JIANGE = 0.9;
            }
            if(self.level == 3){
                JIANGE = 1;
            }
        }
        CGFloat x = frame.origin.x - JIANGE;
        self.lanImageView.frame = CGRectMake(x, 90, 80, 94);
    }
    if(self.lanImageView.frame.origin.x > Iphone_Width-94){
        self.isRight = NO;
        if(self.cishu <= 10){
            self.cishu ++;
        }
    }
    if(self.lanImageView.frame.origin.x < 0){
        self.isRight = YES;
        if(self.cishu <= 10){
            self.cishu ++;
        }
    }
}

- (void)setSelfLiftWithLife:(NSUInteger)life{
    
    if(self.life == 3){
        [self.bballOne setHidden:NO];
        [self.bballTwo setHidden:NO];
        [self.bballThree setHidden:NO];
        
    }else if (self.life == 2){
        [self.bballOne setHidden:YES];
        [self.bballTwo setHidden:NO];
        [self.bballThree setHidden:NO];
        
    }else if (self.life == 1){
        [self.bballOne setHidden:YES];
        [self.bballTwo setHidden:YES];
        [self.bballThree setHidden:NO];
        
    }else {
        [self.bballOne setHidden:YES];
        [self.bballTwo setHidden:YES];
        [self.bballThree setHidden:YES];
        
        MBBall_GameOverPageVC *vc = [[MBBall_GameOverPageVC alloc]initWithHome:^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        } again:^{
            [self.navigationController popViewControllerAnimated:NO];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"jumpToGame" object:[NSString stringWithFormat:@"%ld",self.level]];
        } score:self.score];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:vc animated:YES completion:^{
        }];
        [self saveAction];
    }
}

- (void)saveAction{
    if(self.level == 1){
        [NSArray MBBallsaveScore:self.score key:@"MBBall_first"];
    }
    if(self.level == 2){
        [NSArray MBBallsaveScore:self.score key:@"MBBall_second"];
    }
    if(self.level == 3){
        [NSArray MBBallsaveScore:self.score key:@"MBBall_third"];
    }
}

- (UIImageView *)lanImageView{
    if(_lanImageView == nil){
        _lanImageView = [[UIImageView alloc]init];
        _lanImageView.image = [UIImage imageNamed:@"basketball_net"];
        _lanImageView.frame = CGRectMake(Iphone_Width/2-40, 93, 80, 94);
    }
    return _lanImageView;
}

- (UIImageView *)lanBallImageView{
    if(_lanBallImageView == nil){
        _lanBallImageView = [[UIImageView alloc]init];
        _lanBallImageView.image = [UIImage imageNamed:@"basketball"];
        _lanBallImageView.frame = CGRectMake(Iphone_Width/2-22.5, Iphone_Height-158-55, 55, 55);
    }
    return _lanBallImageView;
}

@end
