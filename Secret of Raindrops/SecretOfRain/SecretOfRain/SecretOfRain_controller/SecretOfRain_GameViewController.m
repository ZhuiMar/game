//
//  SecretOfRain_GameViewController.m
//  SecretOfRain
//
//  Created by zy on 2020/4/27.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "SecretOfRain_GameViewController.h"

@interface SecretOfRain_GameViewController ()

@property (nonatomic, assign) NSInteger level;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, assign) NSInteger life;
@property (nonatomic, assign) BOOL tip;

@property (nonatomic,strong) AVAudioPlayer *player1;
@property (nonatomic,strong) AVAudioPlayer *player2;

@property (weak, nonatomic) IBOutlet UIImageView *lifeOne;
@property (weak, nonatomic) IBOutlet UIImageView *lifetwo;
@property (weak, nonatomic) IBOutlet UIImageView *liftthree;
@property (weak, nonatomic) IBOutlet UIButton *question;

@property(nonatomic, strong) SecretOfRain_countView *rightView;
@property(nonatomic, strong) NSMutableArray *rains;
@property(nonatomic, strong) NSMutableArray *rainCount;

@property (nonatomic, strong) NSTimer *runTimer;
@property (nonatomic, strong) NSTimer *findTimer;
@property (nonatomic, assign) NSInteger hong;

@property (nonatomic, assign) NSInteger rightAnswer;

@property (nonatomic, assign) CGFloat sudu;
@property (weak, nonatomic) IBOutlet UILabel *tiplabel;

@end

@implementation SecretOfRain_GameViewController

- (instancetype)initWithLevel:(NSInteger)level score:(NSInteger)score life:(NSInteger)life tip:(BOOL)tip{
    if(self = [super init]){
        self.level = level;
        self.score = score;
        self.life = life;
        self.tip = tip;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.rightView;
    [self.rightView setTittleCount:self.score];
    self.hong = 1;
    
    if(self.level == 1){
        self.sudu = (Iphone_Height - 132)/1600;
    }else if (self.level == 2){
        self.sudu = (Iphone_Height - 132)/1300;
    }else if (self.level == 3){
        self.sudu = (Iphone_Height - 132)/1000;
    }
    
    if(self.tip == YES){
        [self shoTip];
    }else{
        self.runTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.runTimer forMode:NSDefaultRunLoopMode];
        self.findTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(timerFind) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.findTimer forMode:NSDefaultRunLoopMode];
    }
    [self random];
    
    SecretOfRain_navigate *navi = (SecretOfRain_navigate *)self.navigationController;
       navi.backBlock = ^{
           if(self.runTimer != nil){
               [self.runTimer invalidate];
               self.runTimer = nil;
           }
           if(self.findTimer != nil){
               [self.findTimer invalidate];
               self.findTimer = nil;
           }
           [self saveAction];
       };

    if kiPhone5 {
        self.tiplabel.font = [UIFont fontWithName:FontName size:17];
    }
}

- (void)random{
    
    for (UIButton *buttion in self.rains) {
        [buttion removeFromSuperview];
    }
    [self.rains removeAllObjects];
    
    do{
        NSInteger num = 0;
        if(self.level == 1){
            num = [NSObject SecretOfRain_getRandomNumber:0 to:19];
        }else if (self.level == 2){
            num = [NSObject SecretOfRain_getRandomNumber:20 to:49];
        }else if (self.level == 3){
            num = [NSObject SecretOfRain_getRandomNumber:50 to:99];
        }

        NSNumber *numObj = @(num);
        if([self.rainCount containsObject:numObj] == NO){
            [self.rainCount addObject:numObj];
        }
    }while(self.rainCount.count < self.hong * 3);

    NSInteger index = [NSObject SecretOfRain_getRandomNumber:0 to:self.rainCount.count-1];
    
    self.rightAnswer = [self.rainCount[index] integerValue];
    
    NSLog(@"<><><><><><><><><><><>%ld",self.rightAnswer);
    
    NSInteger left = [NSObject SecretOfRain_getRandomNumber:0 to:self.rightAnswer];
    NSInteger right = self.rightAnswer - left;
    [self.question setTitle:[NSString stringWithFormat:@"%ld+%ld = ?",left,right] forState:UIControlStateNormal];
    [self setRains];
    self.hong = self.hong + 1;
    
    if(self.hong > 4){
        self.hong = 4;
    }
}

- (void)setRains{
    
    CGFloat TOP = -64;
    if IS_IPHONE_X_orMore {
        TOP = -88;
    }
    CGFloat width = 38*1.2;
    CGFloat height = 54*1.2;
    CGFloat margin = (Iphone_Width-(width * 3))/4;
    
    NSInteger lie = 3;
    
    for (int i = 0; i<self.hong*lie; i++) {
    
        CGFloat TOPM = [NSObject SecretOfRain_getRandomNumber:30 to:100];
        CGFloat LEFT = [NSObject SecretOfRain_getRandomNumber:-20 to:20];
        
        NSInteger row = i / self.hong;
        NSInteger col = i % self.hong;
        CGRect frame = CGRectMake(margin + LEFT + (width + margin) * row, TOP + TOPM + (height + 40) * col, width, height);
        
        UIButton *rain = [UIButton buttonWithType:UIButtonTypeCustom];
        rain.titleLabel.font = [UIFont fontWithName:FontName size:24];
        [rain setTitleColor:[NSObject SecretOfRain_colorWithHexString:@"#B620E0"] forState:UIControlStateNormal];
        rain.frame = frame;
        [rain setBackgroundImage:[UIImage imageNamed:@"raindrop"] forState:UIControlStateNormal];
        [rain setTitle:[NSString stringWithFormat:@"%@",self.rainCount[i]] forState:UIControlStateNormal];
        [rain addTarget:self action:@selector(clickRainAction:) forControlEvents:UIControlEventTouchUpInside];
        rain.tag = i;
        [self.view addSubview:rain];
        [self.rains addObject:rain];
    }
}

- (void)clickRainAction:(UIButton *)buttion{
    NSString *title = [buttion titleForState:UIControlStateNormal];
    NSInteger tittleNum = [title integerValue];
    if(self.rightAnswer == tittleNum){
        [self rightMusic];
        [self random];
    }else{
        [self wrongMusic];
    }
}

- (void)timerRun{
    for (UIButton *item in self.rains) {
        CGRect frame = item.frame;
        CGFloat y = frame.origin.y + self.sudu;
        item.frame = CGRectMake(frame.origin.x, y, 38*1.2, 54*1.2);
    }
}

- (void)timerFind{
    for (UIButton *buttion in self.rains) {
        CGRect frame = buttion.frame;
        CGFloat bottom = frame.origin.y + 54*1.2;
        if(bottom >= Iphone_Height-132){
            SecretOfRain_OverViewController *vc = [[SecretOfRain_OverViewController alloc]initWithScore:self.score type:self.level isSu:YES home:^{
                [self.navigationController popToRootViewControllerAnimated:YES];
                
            } again:^{
                [self.navigationController popViewControllerAnimated:NO];
                NSString *str = [NSString stringWithFormat:@"%ld",self.level];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"gameAgain" object:str];
            }card:^{
                SecretOfRain_CarViewController *vc = [[SecretOfRain_CarViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }];
            if(self.runTimer != nil){
                [self.runTimer invalidate];
                self.runTimer = nil;
            }
            if(self.findTimer != nil){
                [self.findTimer invalidate];
                self.findTimer = nil;
            }
            [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
        }
    }
}

- (void)setSelfLiftWith:(NSUInteger)life{
    
    if(self.life == 3){
        self.lifeOne.image = [UIImage imageNamed:@"heart1"];
        self.lifetwo.image = [UIImage imageNamed:@"heart1"];
        self.liftthree.image = [UIImage imageNamed:@"heart1"];
        
        
    }else if (self.life == 2){
        self.lifeOne.image = [UIImage imageNamed:@"heart2"];
        self.lifetwo.image = [UIImage imageNamed:@"heart1"];
        self.liftthree.image = [UIImage imageNamed:@"heart1"];
        
    }else if (self.life == 1){
        self.lifeOne.image = [UIImage imageNamed:@"heart2"];
        self.lifetwo.image = [UIImage imageNamed:@"heart2"];
        self.liftthree.image = [UIImage imageNamed:@"heart1"];
        
    }else {
        self.lifeOne.image = [UIImage imageNamed:@"heart2"];
        self.lifetwo.image = [UIImage imageNamed:@"heart2"];
        self.liftthree.image = [UIImage imageNamed:@"heart2"];

        [self saveAction];
        SecretOfRain_OverViewController *vc = [[SecretOfRain_OverViewController alloc]initWithScore:self.score type:self.level isSu:NO home:^{
            [self.navigationController popToRootViewControllerAnimated:YES];
            
        } again:^{
            [self.navigationController popViewControllerAnimated:NO];
            NSString *str = [NSString stringWithFormat:@"%ld",self.level];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"gameAgain" object:str];

        } card:^{
            SecretOfRain_CarViewController *vc = [[SecretOfRain_CarViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }];

        if(self.runTimer != nil){
            [self.runTimer invalidate];
            self.runTimer = nil;
        }
        if(self.findTimer != nil){
            [self.findTimer invalidate];
            self.findTimer = nil;
        }
        [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
    }
}

- (void)saveAction{
    [NSObject SecretOfRain_saveScore:self.score key:[NSString stringWithFormat:@"SecretOfRain_%ld",self.level]];
}

- (void)shoTip{
    SecretOfRain_TipViewController *vc = [[SecretOfRain_TipViewController alloc]initWithOkAction:^{
        self.runTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
       [[NSRunLoop currentRunLoop] addTimer:self.runTimer forMode:NSDefaultRunLoopMode];
       self.findTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(timerFind) userInfo:nil repeats:YES];
       [[NSRunLoop currentRunLoop] addTimer:self.findTimer forMode:NSDefaultRunLoopMode];
    }];
    [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
}

- (void)rightMusic{
    self.score = self.score + 8;
    [self.rightView setTittleCount:self.score];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"SecretOfRain_right.mp3" withExtension:nil];
    self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player1 play];
}
- (void)wrongMusic{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"SecretOfRain_wrong.mp3" withExtension:nil];
    self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player2 play];
    self.life = self.life - 1;
    [self setSelfLiftWith:self.life];
}
- (SecretOfRain_countView *)rightView{
    if(_rightView == nil){
        _rightView = [SecretOfRain_countView getSecretOfRain_countView];
    }
    return _rightView;
}
- (NSMutableArray *)rains{
    if(_rains == nil){
        _rains = [[NSMutableArray alloc]init];
    }
    return _rains;
}
- (NSMutableArray *)rainCount{
    if(_rainCount == nil){
        _rainCount = [[NSMutableArray alloc]init];
    }
    return _rainCount;
}
- (void)dealloc{
    if(self.runTimer != nil){
        [self.runTimer invalidate];
        self.runTimer = nil;
    }
    if(self.findTimer != nil){
        [self.findTimer invalidate];
        self.findTimer = nil;
    }
}
@end
