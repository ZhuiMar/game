//
//  CatchBall_MathematicsVC.m
//  RushingToCatch
//
//  Created by zy on 2020/6/3.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "CatchBall_MathematicsVC.h"
#import <AVFoundation/AVFoundation.h>

@interface CatchBall_MathematicsVC ()

@property (weak, nonatomic) IBOutlet UIView *sliderBg;
@property (weak, nonatomic) IBOutlet UIView *sliderView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftLayout;

@property (weak, nonatomic) IBOutlet UIImageView *liftOne;
@property (weak, nonatomic) IBOutlet UIImageView *lifeTwo;
@property (weak, nonatomic) IBOutlet UIImageView *liftThree;

@property (weak, nonatomic) IBOutlet UIButton *oneButtion;
@property (weak, nonatomic) IBOutlet UIButton *twoButtion;
@property (weak, nonatomic) IBOutlet UIButton *threeButtion;

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *wangImage;
@property (weak, nonatomic) IBOutlet UIImageView *stateImage;

@property (nonatomic,strong) UIImageView *ball;
@property (nonatomic,assign) NSInteger rightAnswer;
@property (nonatomic,assign) NSInteger currentAnswer;

@property (nonatomic,strong) AVAudioPlayer *rightPlayer;
@property (nonatomic,strong) AVAudioPlayer *wrongPlayer;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, assign) NSInteger life;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, assign) BOOL isAnswer;
@property (nonatomic, strong) NSTimer *countTimer;
@property (nonatomic, assign) NSInteger countTimerNumber;


@property (nonatomic, strong) NSTimer *downTimer;
@property (nonatomic, strong) NSTimer *findTimer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lifeTop;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *weight;



@end

@implementation CatchBall_MathematicsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setFont];
    self.life = 3;
    self.countTimerNumber = 0;
    [self.view addSubview:self.ball];
    [self random];
    
    CatchBall_Navigatetion *navgation = (CatchBall_Navigatetion *)self.navigationController;
    navgation.back = ^{
        [self cancelTimer];
    };
    if IS_IPHONE_X_orMore {
        self.lifeTop.constant = 55;
    }
    if kiPhone5 {
        self.weight.constant = 90;
        self.height.constant = 40;
    }
}

- (void)random{
    
    self.isAnswer = NO;
    
    NSInteger index = [NSObject randomNumber:1 to:6];
    self.ball.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",index]];
    
    CGFloat top = 100;
    if IS_IPHONE_X_orMore {
        top = 150;
    }

    self.ball.frame = CGRectMake(Iphone_Width/2-32.5, top, 65, 65);
    
    NSInteger fa = [NSObject randomNumber:0 to:1];
    
    if(fa == 0){
        NSInteger zhi = [NSObject randomNumber:30 to:100];
        NSInteger left = [NSObject randomNumber:0 to:zhi];
        NSInteger right = zhi - left;
        self.questionLabel.text = [NSString stringWithFormat:@"%ld + %ld = ?",left,right];
        NSLog(@"===========%ld",zhi);
        self.rightAnswer = zhi;
        
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        [arr addObject:@(zhi)];
        do{
            NSInteger num = [NSObject randomNumber:30 to:100];
            if([arr containsObject:@(num)] == NO){
                [arr addObject:@(num)];
            }
        }while (arr.count < 3);
        
        NSMutableArray *new = [NSObject CatchBallandamArry:arr];
        if(new.count == 3){
            [self.oneButtion setTitle:[NSString stringWithFormat:@"%@",new[0]] forState:UIControlStateNormal];
            [self.twoButtion setTitle:[NSString stringWithFormat:@"%@",new[1]] forState:UIControlStateNormal];
            [self.threeButtion setTitle:[NSString stringWithFormat:@"%@",new[2]] forState:UIControlStateNormal];
        }
    }
    
    if(fa == 1){
        NSInteger right = [NSObject randomNumber:30 to:100];
        NSInteger left = [NSObject randomNumber:0 to:right];
        NSInteger zhi = right - left;
        self.questionLabel.text = [NSString stringWithFormat:@"%ld - %ld = ?",right,left];
        NSLog(@"===========%ld",zhi);
        self.rightAnswer = zhi;
        
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        [arr addObject:@(zhi)];
        do{
            NSInteger num = [NSObject randomNumber:30 to:100];
            if([arr containsObject:@(num)] == NO){
                [arr addObject:@(num)];
            }
        }while (arr.count < 3);
        
        NSMutableArray *new = [NSObject CatchBallandamArry:arr];
        if(new.count == 3){
            [self.oneButtion setTitle:[NSString stringWithFormat:@"%@",new[0]] forState:UIControlStateNormal];
            [self.twoButtion setTitle:[NSString stringWithFormat:@"%@",new[1]] forState:UIControlStateNormal];
            [self.threeButtion setTitle:[NSString stringWithFormat:@"%@",new[2]] forState:UIControlStateNormal];
        }
    }

    [UIView animateWithDuration:5 animations:^{
        self.leftLayout.constant = 0;
        [self.sliderBg layoutIfNeeded];
    }];
    
    self.countTimer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(countTimerChange) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.countTimer forMode:NSDefaultRunLoopMode];
}

- (void)countTimerChange{
    self.countTimerNumber = self.countTimerNumber + 1;
    if(self.countTimerNumber == 5){
        if(self.isAnswer == NO){
            
            if(self.countTimer != nil){
                [self.countTimer invalidate];
                self.countTimer = nil;
            }
            self.countTimerNumber = 0;
            [UIView animateWithDuration:0.1 animations:^{
                self.leftLayout.constant = 300;
                [self.sliderBg layoutIfNeeded];
            }];
            [self wrongMusic];
        }
    }
}

- (void)setFont{
    self.sliderBg.layer.cornerRadius = 5;
    self.sliderBg.layer.masksToBounds = YES;
    self.sliderView.layer.cornerRadius = 5;
    self.sliderView.layer.masksToBounds = YES;
    self.oneButtion.titleLabel.font = [UIFont fontWithName:TEXTFONT size:24];
    [self.oneButtion setTitleColor:[NSObject CatchBallcolorWithHexString:@"#FF9C00"] forState:UIControlStateNormal];
    self.twoButtion.titleLabel.font = [UIFont fontWithName:TEXTFONT size:24];
    [self.twoButtion setTitleColor:[NSObject CatchBallcolorWithHexString:@"#FF9C00"] forState:UIControlStateNormal];
    self.threeButtion.titleLabel.font = [UIFont fontWithName:TEXTFONT size:24];
    [self.threeButtion setTitleColor:[NSObject CatchBallcolorWithHexString:@"#FF9C00"] forState:UIControlStateNormal];
    self.questionLabel.layer.cornerRadius = 10;
    self.questionLabel.layer.masksToBounds = YES;
    self.sliderBg.layer.borderColor = [NSObject CatchBallcolorWithHexString:@"#FF9C00"].CGColor;
    self.sliderBg.layer.borderWidth = 0.5;
}

- (void)wrongMusic{
    self.life = self.life - 1;
    [self CatchBallSetSelfLiftWithLife:self.life];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"wrong.mp3" withExtension:nil];
    self.wrongPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.wrongPlayer play];
}
- (void)rightMusic{
    self.score ++;
    self.titleLabel.text = [NSString stringWithFormat:@"X%ld",self.score];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"right.mp3" withExtension:nil];
    self.rightPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.rightPlayer play];
}

- (void)CatchBallSetSelfLiftWithLife:(NSUInteger)life{
    
    if(self.life == 3){
        [self.liftOne setHidden:NO];
        [self.lifeTwo setHidden:NO];
        [self.liftThree setHidden:NO];
        [self random];
        
    }else if (self.life == 2){
        [self.liftOne setHidden:YES];
        [self.lifeTwo setHidden:NO];
        [self.liftThree setHidden:NO];
        [self random];
        
    }else if (self.life == 1){
        [self.liftOne setHidden:YES];
        [self.lifeTwo setHidden:YES];
        [self.liftThree setHidden:NO];
        [self random];
        
    }else {
        [self.liftOne setHidden:YES];
        [self.lifeTwo setHidden:YES];
        [self.liftThree setHidden:YES];
        
        if(self.downTimer != nil){
            [self.downTimer invalidate];
            self.downTimer = nil;
        }
        if(self.findTimer != nil){
            [self.findTimer invalidate];
            self.findTimer = nil;
        }
        if(self.countTimer != nil){
            [self.countTimer invalidate];
            self.countTimer = nil;
        }
    
        CatchBall_GameOverPageVc *vc = [[CatchBall_GameOverPageVc alloc]initWithScore:self.score level:3 home:^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        } again:^{
            [self.navigationController popToRootViewControllerAnimated:NO];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"gotoMatchGamePage" object:nil];
        }];
        [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
        [self cancelTimer];
        [self recodScore];
    }
}

- (void)cancelTimer{
    if(self.downTimer != nil){
        [self.downTimer invalidate];
        self.downTimer = nil;
    }
    if(self.findTimer != nil){
        [self.findTimer invalidate];
        self.findTimer = nil;
    }
    if(self.countTimer != nil){
        [self.countTimer invalidate];
        self.countTimer = nil;
    }
}

- (void)recodScore{
    CatchBall_RankModel *model = [[CatchBall_RankModel alloc]init];
       RLMRealm *realm = [RLMRealm defaultRealm];
       model.type = @"math";
       model.score = [NSString stringWithFormat:@"%ld",self.score];
       model.time = [self getTaday];
       [realm transactionWithBlock:^{
         [realm addObject:model];
       }];
}

- (NSString *)getTaday{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY/MM/dd hh:mm"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}

- (void)loopBasecAnimation:(UIImageView *)view{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2.0];
    rotationAnimation.duration = 2;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = ULLONG_MAX;
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)rightorwrong:(NSInteger)number{
    self.currentAnswer = number;
    [self loopBasecAnimation:self.ball];
    if(self.countTimer != nil){
        [self.countTimer invalidate];
        self.countTimer = nil;
    }
    self.countTimerNumber = 0;
    [UIView animateWithDuration:0.1 animations:^{
        self.leftLayout.constant = 300;
        [self.sliderBg layoutIfNeeded];
    }];
    
    self.downTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(downTimerChange) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.downTimer forMode:NSDefaultRunLoopMode];
    self.findTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(findTimerChange) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.findTimer forMode:NSDefaultRunLoopMode];
}

- (void)findTimerChange{
    if (CGRectIntersectsRect(self.ball.frame, self.wangImage.frame)) {
        
        if(self.downTimer != nil){
            [self.downTimer invalidate];
            self.downTimer = nil;
        }
        if(self.findTimer != nil){
            [self.findTimer invalidate];
            self.findTimer = nil;
        }
        
        if(self.rightAnswer == self.currentAnswer){
            [self rightMusic];
            CGRect frame = self.ball.frame;
            [UIView animateWithDuration:0.5 animations:^{
                self.ball.frame = CGRectMake(Iphone_Width/2-32.5, frame.origin.y + 30, 65, 65);
            }];
    
            self.stateImage.image = [UIImage imageNamed:@"correct"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self random];
                self.stateImage.image = [UIImage imageNamed:@""];
            });
        }else{
            [self wrongMusic];
            self.stateImage.image = [UIImage imageNamed:@"error"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.stateImage.image = [UIImage imageNamed:@""];
            });
        }
    }
}

- (void)downTimerChange{
    CGRect frame = self.ball.frame;
    CGFloat y = frame.origin.y + 2;
    self.ball.frame = CGRectMake(Iphone_Width/2-32.5, y, 65, 65);
}

- (IBAction)oneAction:(UIButton *)buttion {
    NSString *tittle = [buttion titleForState:UIControlStateNormal];
    [self rightorwrong:tittle.integerValue];
}
- (IBAction)twoAction:(UIButton *)buttion {
    NSString *tittle = [buttion titleForState:UIControlStateNormal];
    [self rightorwrong:tittle.integerValue];
}
- (IBAction)threeAction:(UIButton *)buttion {
    NSString *tittle = [buttion titleForState:UIControlStateNormal];
    [self rightorwrong:tittle.integerValue];
}

- (UIImageView *)ball{
    if(_ball == nil){
       _ball = [[UIImageView alloc]init];
        NSInteger index = [NSObject randomNumber:1 to:6];
        _ball.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",index]];
        
        
        CGFloat top = 100;
        if IS_IPHONE_X_orMore {
            top = 150;
        }
        
        _ball.frame = CGRectMake(Iphone_Width/2-32.5, top, 65, 65);
    }
    return _ball;
}

@end
