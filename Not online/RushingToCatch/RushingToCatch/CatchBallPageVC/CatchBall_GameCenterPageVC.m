//
//  CatchBall_GameCenterPageVC.m
//  RushingToCatch
//
//  Created by zy on 2020/6/1.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "CatchBall_GameCenterPageVC.h"
#import <AVFoundation/AVFoundation.h>
#import "CatchBall_Navigatetion.h"

#define interval 500

@interface CatchBall_GameCenterPageVC ()

@property (weak, nonatomic) IBOutlet UIImageView *lifeOne;
@property (weak, nonatomic) IBOutlet UIImageView *lifeTwo;
@property (weak, nonatomic) IBOutlet UIImageView *lifeThree;

@property (weak, nonatomic) IBOutlet UIView *bgOne;
@property (weak, nonatomic) IBOutlet UIView *bgTwo;
@property (weak, nonatomic) IBOutlet UIView *bgThree;
@property (weak, nonatomic) IBOutlet UILabel *readyGoLabel;

@property (nonatomic, strong) NSTimer *leftTimer;
@property (nonatomic, strong) NSTimer *middleTimer;

@property (nonatomic, strong) NSTimer *findLeftTimer;
@property (nonatomic, strong) NSTimer *findMiddleTimer;

@property (nonatomic, strong) NSTimer *rightTimer;
@property (nonatomic, strong) NSTimer *findRightTimer;

@property (nonatomic, strong) NSMutableArray *leftArr;
@property (nonatomic, strong) NSMutableArray *middleArr;
@property (nonatomic, strong) NSMutableArray *rightArr;

@property (nonatomic, assign) NSInteger score;
@property (nonatomic, assign) NSInteger life;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, assign) NSInteger levelNumber;

@property (nonatomic, assign) NSInteger ballcount;
@property (nonatomic, assign) NSInteger currentBallcount;

@property (weak, nonatomic) IBOutlet UILabel *tittleLabel;

@property (nonatomic,strong) AVAudioPlayer *rightPlayer;
@property (nonatomic,strong) AVAudioPlayer *wrongPlayer;

@property (weak, nonatomic) IBOutlet UIButton *catchThree;
@property (weak, nonatomic) IBOutlet UIButton *catchTwo;
@property (weak, nonatomic) IBOutlet UIButton *catchOne;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *middleWithLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lifeTop;
@property (weak, nonatomic) IBOutlet UILabel *cuntLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *countLabelTop;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *twoW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *oneW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *threeW;

@end

@implementation CatchBall_GameCenterPageVC

- (instancetype)initWithLevel:(NSInteger)level levelNumber:(NSInteger)levelNumber{
    if(self = [super init]){
        self.level = level;
        self.levelNumber = levelNumber;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if kiPhone5 {
        self.oneW.constant = 90;
        self.twoW.constant = 90;
        self.threeW.constant = 90;
    }
    
    self.score = 0;
    self.life = 3;

    if(self.level == 1){
        
        [self.cuntLabel setHidden:NO];
        self.tittleLabel.text  = [NSString stringWithFormat:@"Level %ld",self.levelNumber];
        self.middleWithLayout.constant = 0;
        [self.catchTwo setHidden:YES];
        [self.lifeOne setHidden:YES];
        [self.lifeTwo setHidden:YES];
        [self.lifeThree setHidden:YES];
        self.cuntLabel.text = [NSString stringWithFormat:@"%ld/%ld",self.currentBallcount,self.levelNumber * 16];
        
    }else{
        
        [self.cuntLabel setHidden:YES];
        self.tittleLabel.text  = [NSString stringWithFormat:@"X%ld",self.score];
        self.middleWithLayout.constant = 111;
        [self.catchTwo setHidden:NO];
        [self.lifeOne setHidden:NO];
        [self.lifeTwo setHidden:NO];
        [self.lifeThree setHidden:NO];
    }
    
    [UIView animateWithDuration:1 animations:^{
        self.readyGoLabel.transform = CGAffineTransformMakeScale(1.5, 1.5);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            self.readyGoLabel.transform = CGAffineTransformMakeScale(0.7, 0.7);
        } completion:^(BOOL finished) {
            [self.readyGoLabel setHidden:YES];
            [self start];
        }];
    }];
    CatchBall_Navigatetion *navgation = (CatchBall_Navigatetion *)self.navigationController;
    navgation.back = ^{
        [self cancelTimer];
    };
    
    if IS_IPHONE_X_orMore {
        self.lifeTop.constant = 55;
        self.countLabelTop.constant = 55;
    }
}

- (IBAction)catchOne:(UIButton *)sender {
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (UIImageView *imageView in self.leftArr) {
        [arr addObject:imageView];
    }
    for (UIImageView *imageView in arr) {
        if (CGRectIntersectsRect(imageView.frame, sender.frame)) {
            [self rightMusic];
            if(self.level == 2){
                CGFloat y = 7*interval + 7*60 - Iphone_Height + interval + 60 + interval;
                imageView.frame = CGRectMake((111-60)/2, -y, 60, 60);
                NSInteger index = [NSObject randomNumber:1 to:6];
                imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",index]];
            }else{
                [imageView removeFromSuperview];
                [self.leftArr removeObject:imageView];
            }
        }
    }
}
- (IBAction)catchTwo:(UIButton *)buttion {
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (UIImageView *imageView in self.middleArr) {
        [arr addObject:imageView];
    }
    for (UIImageView *imageView in arr) {
        if (CGRectIntersectsRect(imageView.frame, buttion.frame)) {
            [self rightMusic];
            if(self.level == 2){
                CGFloat y = 7*interval + 7*60 - Iphone_Height + interval + 60 + interval;
                imageView.frame = CGRectMake((111-60)/2, -y, 60, 60);
                NSInteger index = [NSObject randomNumber:1 to:6];
                imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",index]];
            }else{
                [imageView removeFromSuperview];
                [self.middleArr removeObject:imageView];
            }
        }
    }
}
- (IBAction)catchThree:(UIButton *)buttion {
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (UIImageView *imageView in self.rightArr) {
        [arr addObject:imageView];
    }
    for (UIImageView *imageView in arr) {
        if (CGRectIntersectsRect(imageView.frame, buttion.frame)) {
            [self rightMusic];
            if(self.level == 2){
                CGFloat y = 7*interval + 7*60 - Iphone_Height + interval + 60 + interval;
                imageView.frame = CGRectMake((111-60)/2, -y, 60, 60);
                NSInteger index = [NSObject randomNumber:1 to:6];
                imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",index]];
            }else{
                [imageView removeFromSuperview];
                [self.rightArr removeObject:imageView];
            }
        }
    }
}


- (void)wrongMusic{
    if(self.level == 2){
        self.life = self.life - 1;
        [self CatchBallSetSelfLiftWithLife:self.life];
    }
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"wrong.mp3" withExtension:nil];
    self.wrongPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.wrongPlayer play];
}
- (void)rightMusic{
    if(self.level == 2){
        self.score ++;
        self.tittleLabel.text = [NSString stringWithFormat:@"X%ld",self.score];
    }else{
        self.currentBallcount = self.currentBallcount + 1;
        self.cuntLabel.text = [NSString stringWithFormat:@"%ld/%ld",self.currentBallcount,self.levelNumber * 16];
    }
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"right.mp3" withExtension:nil];
    self.rightPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.rightPlayer play];
}

- (void)start{
    self.leftTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(leftTimerChange) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.leftTimer forMode:NSDefaultRunLoopMode];
    self.findLeftTimer = [NSTimer timerWithTimeInterval:0.005 target:self selector:@selector(findLeftTimerChange) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.findLeftTimer forMode:NSDefaultRunLoopMode];
    
    if(self.level == 2){
        self.middleTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(middleTimerChange) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.middleTimer forMode:NSDefaultRunLoopMode];
        self.findMiddleTimer = [NSTimer timerWithTimeInterval:0.005 target:self selector:@selector(findMiddleTimerChange) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.findMiddleTimer forMode:NSDefaultRunLoopMode];
    }
    
    self.rightTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(rightTimerChange) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.rightTimer forMode:NSDefaultRunLoopMode];
    self.findRightTimer = [NSTimer timerWithTimeInterval:0.005 target:self selector:@selector(findRightTimerChange) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.findRightTimer forMode:NSDefaultRunLoopMode];
}

- (void)juge{
    if(self.leftArr.count == 0 && self.rightArr.count == 0){
        CatchBall_GameOverPageVc *vc = [[CatchBall_GameOverPageVc alloc]initWithCount:self.currentBallcount level:self.level levelNumber:self.levelNumber home:^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        } again:^{
            [self.navigationController popToRootViewControllerAnimated:NO];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"gotoChallGamePage" object:@(1)];
        } next:^{
             [self.navigationController popToRootViewControllerAnimated:NO];
             [[NSNotificationCenter defaultCenter] postNotificationName:@"gotoChallGamePage" object:@(self.levelNumber + 1)];
        }];
        [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
        [self cancelTimer];
    }
}

- (void)findLeftTimerChange{
    
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (UIImageView *imageView in self.leftArr) {
        [arr addObject:imageView];
    }

    for (UIImageView *imageView in arr) {
        if(imageView.frame.origin.y >= Iphone_Height){
            if(self.level == 1){
                [imageView removeFromSuperview];
                [self.leftArr removeObject:imageView];
            }else{
                [self wrongMusic];
                CGFloat y = 7*interval + 7*60 - Iphone_Height + interval + 60;
                imageView.frame = CGRectMake((111-60)/2, -y, 60, 60);
                NSInteger index = [NSObject randomNumber:1 to:6];
                imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",index]];
            }
        }
    }
    [self juge];
}

- (void)findMiddleTimerChange{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (UIImageView *imageView in self.middleArr) {
       [arr addObject:imageView];
    }

    for (UIImageView *imageView in arr) {
        if(imageView.frame.origin.y >= Iphone_Height){
            if(self.level == 1){
                [imageView removeFromSuperview];
                [self.middleArr removeObject:imageView];
            }else{
                [self wrongMusic];
                CGFloat y = 7*interval + 7*60 - Iphone_Height + interval + 60;
                imageView.frame = CGRectMake((111-60)/2, -y, 60, 60);
                NSInteger index = [NSObject randomNumber:1 to:6];
                imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",index]];
            }
        }
    }
}

- (void)findRightTimerChange{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (UIImageView *imageView in self.rightArr) {
       [arr addObject:imageView];
    }
    for (UIImageView *imageView in arr) {
        if(imageView.frame.origin.y >= Iphone_Height){
            if(self.level == 1){
                [imageView removeFromSuperview];
                [self.rightArr removeObject:imageView];
            }else{
                [self wrongMusic];
                CGFloat y = 7*interval + 7*60 - Iphone_Height + interval + 60;
                imageView.frame = CGRectMake((111-60)/2, -y, 60, 60);
                NSInteger index = [NSObject randomNumber:1 to:6];
                imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",index]];
            }
        }
    }
    [self juge];
}

- (void)leftTimerChange{
    for (UIImageView *imageView in self.leftArr) {
        CGRect frame = imageView.frame;
        
        if(self.level == 1){
            CGFloat y = frame.origin.y + 2.5 + self.levelNumber * 0.3;
            imageView.frame = CGRectMake((111-60)/2, y, 60, 60);
        }else{
            CGFloat y = frame.origin.y + 2.5 + self.score*0.1;
            imageView.frame = CGRectMake((111-60)/2, y, 60, 60);
        }
    }
}
- (void)middleTimerChange{
    for (UIImageView *imageView in self.middleArr) {
        CGRect frame = imageView.frame;
        
        if(self.level == 1){
            CGFloat y = frame.origin.y + 3 + self.levelNumber * 0.3;;
            imageView.frame = CGRectMake((111-60)/2, y, 60, 60);
        }else{
            CGFloat y = frame.origin.y + 3 + self.score*0.1;
            imageView.frame = CGRectMake((111-60)/2, y, 60, 60);
        }
    }
}
- (void)rightTimerChange{
    for (UIImageView *imageView in self.rightArr) {
        CGRect frame = imageView.frame;
        if(self.level == 1){
            CGFloat y = frame.origin.y + 3.5 + self.levelNumber * 0.3;
            imageView.frame = CGRectMake((111-60)/2, y, 60, 60);
        }else{
            CGFloat y = frame.origin.y + 3.5 + self.score*0.1;
            imageView.frame = CGRectMake((111-60)/2, y, 60, 60);
        }
    }
}

- (void)CatchBallSetSelfLiftWithLife:(NSUInteger)life{
    
    if(self.life == 3){
        [self.lifeOne setHidden:NO];
        [self.lifeTwo setHidden:NO];
        [self.lifeThree setHidden:NO];
        
    }else if (self.life == 2){
        [self.lifeOne setHidden:YES];
        [self.lifeTwo setHidden:NO];
        [self.lifeThree setHidden:NO];
        
    }else if (self.life == 1){
        [self.lifeOne setHidden:YES];
        [self.lifeTwo setHidden:YES];
        [self.lifeThree setHidden:NO];
        
    }else {
        [self.lifeOne setHidden:YES];
        [self.lifeTwo setHidden:YES];
        [self.lifeThree setHidden:YES];
        CatchBall_GameOverPageVc *vc = [[CatchBall_GameOverPageVc alloc]initWithScore:self.score level:self.level home:^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        } again:^{
            [self.navigationController popToRootViewControllerAnimated:NO];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"gotoGamePage" object:nil];
        }];
        
        [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
        [self cancelTimer];
        [self recodScore];
    }
}

- (void)recodScore{
    CatchBall_RankModel *model = [[CatchBall_RankModel alloc]init];
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    model.type = @"pass";
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

- (void)cancelTimer{
    if(self.leftTimer != nil){
        [self.leftTimer invalidate];
        self.leftTimer = nil;
    }
    if(self.findLeftTimer != nil){
        [self.findLeftTimer invalidate];
        self.findLeftTimer = nil;
    }
    if(self.middleTimer != nil){
        [self.middleTimer invalidate];
        self.middleTimer = nil;
    }
    if(self.findMiddleTimer != nil){
        [self.findMiddleTimer invalidate];
        self.findMiddleTimer = nil;
    }
    if(self.rightTimer != nil){
        [self.rightTimer invalidate];
        self.rightTimer = nil;
    }
    if(self.findRightTimer != nil){
        [self.findRightTimer invalidate];
        self.findRightTimer = nil;
    }
}

- (void)loopBasecAnimation:(UIImageView *)view{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2.0];
    rotationAnimation.duration = 2;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = ULLONG_MAX;
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (NSMutableArray *)leftArr{
    if(_leftArr == nil){
        _leftArr = [[NSMutableArray alloc]init];
        NSInteger count = 8;
        if(self.level == 1){
            count = 8 * self.levelNumber;
        }
        for (int i = 0; i < count; i++) {
            NSInteger index = [NSObject randomNumber:1 to:6];
            UIImageView *imageView = [[UIImageView alloc]init];
            imageView.frame = CGRectMake((111-60)/2, -(i * (60 + interval)), 60, 60);
            imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",index]];
            [self.bgOne addSubview:imageView];
            [_leftArr addObject:imageView];
            [self loopBasecAnimation:imageView];
        }
        [self.bgOne bringSubviewToFront:self.catchOne];
    }
    return _leftArr;
}

- (NSMutableArray *)middleArr{
    if(_middleArr == nil){
        _middleArr = [[NSMutableArray alloc]init];
        NSInteger count = 8;
        if(self.level == 1){
            count = 8 * self.levelNumber;
        }
        for (int i = 0; i < count; i++) {
            NSInteger index = [NSObject randomNumber:1 to:6];
            UIImageView *imageView = [[UIImageView alloc]init];
            imageView.frame = CGRectMake((111-60)/2, -(i * (60 + interval)), 60, 60);
            imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",index]];
            [self.bgTwo addSubview:imageView];
            [_middleArr addObject:imageView];
            [self loopBasecAnimation:imageView];
        }
        [self.bgTwo bringSubviewToFront:self.catchTwo];
    }
    return _middleArr;
}
- (NSMutableArray *)rightArr{
    if(_rightArr == nil){
        _rightArr = [[NSMutableArray alloc]init];
        NSInteger count = 8;
        if(self.level == 1){
            count = 8 * self.levelNumber;
        }
        for (int i = 0; i < count; i++) {
            NSInteger index = [NSObject randomNumber:1 to:6];
            UIImageView *imageView = [[UIImageView alloc]init];
            imageView.frame = CGRectMake((111-60)/2, -(i * (60 + interval)), 60, 60);
            imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",index]];
            [self.bgThree addSubview:imageView];
            [_rightArr addObject:imageView];
            [self loopBasecAnimation:imageView];
        }
        [self.bgThree bringSubviewToFront:self.catchThree];
    }
    return _rightArr;
}

@end
