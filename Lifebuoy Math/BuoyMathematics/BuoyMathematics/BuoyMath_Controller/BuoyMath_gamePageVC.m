//
//  BuoyMath_gamePageVC.m
//  BuoyMathematics
//
//  Created by zy on 2020/4/26.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "BuoyMath_gamePageVC.h"

@interface BuoyMath_gamePageVC ()<BuoyMath_LifeBuoyViewDelegate>

@property (nonatomic,strong) AVAudioPlayer *player1;
@property (nonatomic,strong) AVAudioPlayer *player2;

@property(nonatomic, assign) NSInteger score;
@property(nonatomic, assign) NSInteger level;
@property(nonatomic, assign) NSInteger life;
@property(nonatomic, assign) BOOL tip;

@property (weak, nonatomic) IBOutlet UIImageView *lifeOne;
@property (weak, nonatomic) IBOutlet UIImageView *lifeTwo;
@property (weak, nonatomic) IBOutlet UIImageView *liftThree;

@property (weak, nonatomic) IBOutlet UIView *bgOne;
@property (weak, nonatomic) IBOutlet UIView *bgTwo;
@property (weak, nonatomic) IBOutlet UIView *bgThree;
@property (weak, nonatomic) IBOutlet UIView *bgFour;

@property (weak, nonatomic) IBOutlet UIImageView *jianJian;
@property (weak, nonatomic) IBOutlet UIButton *resultBtn;

@property (weak, nonatomic) IBOutlet UILabel *tipTop;
@property (weak, nonatomic) IBOutlet UILabel *tipBottom;

@property (weak, nonatomic) IBOutlet UIButton *btnOne;
@property (weak, nonatomic) IBOutlet UIButton *btnTwo;
@property (weak, nonatomic) IBOutlet UIButton *btnThree;
@property (weak, nonatomic) IBOutlet UIButton *btnFour;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLayout;

@property (nonatomic, strong) NSTimer *runTimer;
@property (nonatomic, assign) NSInteger right;
@property (nonatomic, assign) NSInteger result;

@property (nonatomic,strong) BuoyMath_LifeBuoyView *One;
@property (nonatomic,strong) BuoyMath_LifeBuoyView *Two;
@property (nonatomic,strong) BuoyMath_LifeBuoyView *Three;
@property (nonatomic,strong) BuoyMath_LifeBuoyView *Four;

@property (nonatomic,strong) NSMutableArray *answerBtns;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;

@end

@implementation BuoyMath_gamePageVC

- (instancetype)initWithScore:(NSUInteger)score level:(NSInteger)level life:(NSInteger)life tip:(BOOL)tip{
    if(self = [super init]){
        self.score = score;
        self.level = level;
        self.life = life;
        self.tip = tip;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = [NSString stringWithFormat:@"%ld",self.score];
    
    if(self.tip == YES){
        [self showTip];
    }
    [self setHidenAndShow];
    
    [self.bgOne addSubview:self.One];
    [self.bgTwo addSubview:self.Two];
    [self.bgThree addSubview:self.Three];
    [self.bgFour addSubview:self.Four];
    
    [self.answerBtns addObject:self.btnOne];
    [self.answerBtns addObject:self.btnTwo];
    [self.answerBtns addObject:self.btnThree];
    [self.answerBtns addObject:self.btnFour];
    
    [self random];
    [self setSelfLiftWith:self.life];
    
    if kiPhone5 {
        self.topLayout.constant = 85;
    }
}

- (void)random{
    
    if(self.level == 1){
        
        NSInteger fa = [NSObject BuoyMath_getRandomNumber:0 to:1];
        
        if(fa == 0){
            
            NSString *left = [NSString stringWithFormat:@"%ld%ld",[self.One setBouyCount], [self.Two setBouyCount]];
            NSInteger leftInt = [left integerValue];
            NSString *right = [NSString stringWithFormat:@"%ld%ld",[self.Three setBouyCount], [self.Four setBouyCount]];
            NSInteger rightInt = [right integerValue];
            
            self.right = leftInt + rightInt;
            self.jianJian.image = [UIImage imageNamed:@"addition"];
            
        }else{
            
            NSString *left = [NSString stringWithFormat:@"%ld%ld",[self.One setBouyCount], [self.Two setBouyCount]];
            NSInteger leftInt = [left integerValue];
            NSString *right = [NSString stringWithFormat:@"%ld%ld",[self.Three setBouyCount], [self.Four setBouyCount]];
            NSInteger rightInt = [right integerValue];
            
            self.right = leftInt - rightInt;
            self.jianJian.image = [UIImage imageNamed:@"subtraction"];
        }
        
        NSLog(@"============%ld",self.right);
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        do{
            NSInteger va = [NSObject BuoyMath_getRandomNumber:22 to:110];
            if([arr containsObject:@(va)] == NO){
                [arr addObject:@(va)];
            }
        }while (arr.count < 3);
        [arr addObject:@(self.right)];
        
        NSMutableArray *arrNew = [NSObject BuoyMath_randamArry:arr];
        if(arrNew.count == 4){
            for (int i = 0; i<self.answerBtns.count; i++) {
                UIButton *buttion = self.answerBtns[i];
                [buttion setTitle:[NSString stringWithFormat:@"%@",arrNew[i]] forState:UIControlStateNormal];
                buttion.titleLabel.font = [UIFont fontWithName:FontName size:30];
            }
        }
        
    }else{
        
        NSString *left = [NSString stringWithFormat:@"%ld%ld",[self.One setBouyCount], [self.Two setBouyCount]];
        NSInteger leftInt = [left integerValue];
        NSString *right = [NSString stringWithFormat:@"%ld%ld",[self.Three setBouyCount], [self.Four setBouyCount]];
        NSInteger rightInt = [right integerValue];
        self.right = leftInt + rightInt;
        
        self.result = [NSObject BuoyMath_getRandomNumber:22 to:self.right];
        [self.resultBtn setTitle:[NSString stringWithFormat:@"result:%ld",self.result] forState:UIControlStateNormal];
        self.resultBtn.titleLabel.font = [UIFont fontWithName:FontName size:23];
        
        NSLog(@"=============================%ld",self.right);
        self.jianJian.image = [UIImage imageNamed:@"addition"];
    }
}

- (void)clickItemAction{
    
    NSString *left = [NSString stringWithFormat:@"%ld%ld",self.One.value, self.Two.value];
    NSInteger leftInt = [left integerValue];
    
    NSString *right = [NSString stringWithFormat:@"%ld%ld",self.Three.value, self.Four.value];
    NSInteger rightInt = [right integerValue];
    
    self.right = leftInt + rightInt;
    NSLog(@"=============================%ld",self.right);
}

- (IBAction)oneAction:(UIButton *)buttion {
    [self judgeRightOrWrong:[buttion titleForState:UIControlStateNormal]];
}
- (IBAction)twoAction:(UIButton *)buttion {
    [self judgeRightOrWrong:[buttion titleForState:UIControlStateNormal]];
}
- (IBAction)threeAction:(UIButton *)buttion {
    [self judgeRightOrWrong:[buttion titleForState:UIControlStateNormal]];
}
- (IBAction)fourAction:(UIButton *)buttion {
    
    if(self.level == 1){
        [self judgeRightOrWrong:[buttion titleForState:UIControlStateNormal]];
    }else{
        if(self.result == self.right){
            [self rightMusic];
        }else{
            [self wrongMusic];
        }
    }
    [self random];
}


- (void)judgeRightOrWrong:(NSString *)title{
    NSInteger tittle = [title integerValue];
    if(tittle == self.right){
        [self rightMusic];
    }else{
        [self wrongMusic];
    }
    [self random];
}


- (void)setHidenAndShow{
    if(self.level == 1){
        [self.resultBtn setHidden:YES];
        self.tipTop.text = @"What is the total number of lifebuoys?";
        self.tipBottom.text = @"Notice that it's a two digit operation";
        self.bottomLayout.constant = 80;
    }else{
        self.tipTop.text = @"Take some lifebuoys to make the formula work?";
        self.tipBottom.text = @"Double digit operation, click lifebuoy to answer";
        [self.resultBtn setHidden:NO];
        [self.btnOne setHidden:YES];
        [self.btnTwo setHidden:YES];
        [self.btnThree setHidden:YES];
        self.bottomLayout.constant = 25;
        [self.btnFour setBackgroundImage:[UIImage imageNamed:@"Finish"] forState:UIControlStateNormal];
    }
}

- (void)showTip{
    BuoyMath_TipPageVC *vc = [[BuoyMath_TipPageVC alloc]initWithType:self.level ok:^{
        
    }];
    [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
    BuoyMath_navigation *navi = (BuoyMath_navigation *)self.navigationController;
    navi.backBlock = ^{
        if(self.runTimer != nil){
            [self.runTimer invalidate];
            self.runTimer = nil;
        }
        [self saveAction];
    };
}

- (void)rightMusic{
    self.score = self.score + 10;
    self.navigationItem.title = [NSString stringWithFormat:@"%ld",self.score];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"BuoyMath_right.mp3" withExtension:nil];
    self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player1 play];
}
- (void)wrongMusic{
    self.life = self.life - 1;
    [self setSelfLiftWith:self.life];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"BuoyMath_wrong.mp3" withExtension:nil];
    self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player2 play];
}

- (void)setSelfLiftWith:(NSUInteger)life{
    
    if(self.life == 3){
        [self.lifeOne setHidden:NO];
        [self.lifeTwo setHidden:NO];
        [self.liftThree setHidden:NO];
        
    }else if (self.life == 2){
        [self.lifeOne setHidden:YES];
        [self.lifeTwo setHidden:NO];
        [self.liftThree setHidden:NO];
        
    }else if (self.life == 1){
        [self.lifeOne setHidden:YES];
        [self.lifeTwo setHidden:YES];
        [self.liftThree setHidden:NO];
        
    }else {
        [self.lifeOne setHidden:YES];
        [self.lifeTwo setHidden:YES];
        [self.liftThree setHidden:YES];

        [self saveAction];
        
        BuoyMath_gameOverPageVC *vc = [[BuoyMath_gameOverPageVC alloc]initWithScore:self.score home:^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        } again:^{
            
            if(self.level == 1){
                [self.navigationController popToRootViewControllerAnimated:NO];
                NSString *str = [NSString stringWithFormat:@"%ld",self.level];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"BuoyMath_gameAgain" object:str];
            }else{
                [self.navigationController popToRootViewControllerAnimated:NO];
                NSString *str = [NSString stringWithFormat:@"%ld",self.level];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"BuoyMath_gameAgain" object:str];
            }
        }];
        
        [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
        if(self.runTimer != nil){
            [self.runTimer invalidate];
            self.runTimer = nil;
        }
    }
}

- (void)saveAction{
    if(self.level == 1){
        [NSObject BuoyMath_saveScore:self.score key:@"BuoyMath_level"];
    }else{
        [NSObject BuoyMath_saveScore:self.score key:@"BuoyMath_endless"];
    }
}


- (BuoyMath_LifeBuoyView *)One{
    if(_One == nil){
        _One = [BuoyMath_LifeBuoyView getBouyViewWithLevel:self.level];
        _One.delegate = self;
    }
    return _One;
}
- (BuoyMath_LifeBuoyView *)Two{
    if(_Two == nil){
       _Two = [BuoyMath_LifeBuoyView getBouyViewWithLevel:self.level];
        _Two.delegate = self;
    }
    return _Two;
}
- (BuoyMath_LifeBuoyView *)Three{
    if(_Three == nil){
       _Three = [BuoyMath_LifeBuoyView getBouyViewWithLevel:self.level];
        _Three.delegate = self;
    }
    return _Three;
}
- (BuoyMath_LifeBuoyView *)Four{
    if(_Four == nil){
        _Four = [BuoyMath_LifeBuoyView getBouyViewWithLevel:self.level];
        _Four.delegate = self;
    }
    return _Four;
}
- (NSMutableArray *)answerBtns{
    if(_answerBtns == nil){
        _answerBtns = [[NSMutableArray alloc]init];
    }
    return _answerBtns;
}

@end
