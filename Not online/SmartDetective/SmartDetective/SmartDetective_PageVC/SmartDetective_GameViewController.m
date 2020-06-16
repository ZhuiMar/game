//
//  SmartDetective_GameViewController.m
//  SmartDetective
//
//  Created by zy on 2020/5/13.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import "SmartDetective_GameViewController.h"


@interface SmartDetective_GameViewController ()

@property(nonatomic,assign)NSInteger life;
@property(nonatomic,assign)NSInteger score;
@property(nonatomic,assign)NSInteger level;

@property (weak, nonatomic) IBOutlet UIImageView *lifeOne;
@property (weak, nonatomic) IBOutlet UIImageView *lifeTwo;
@property (weak, nonatomic) IBOutlet UIImageView *lifeThree;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UIButton *answerOne;
@property (weak, nonatomic) IBOutlet UIButton *answerTwo;
@property (weak, nonatomic) IBOutlet UIButton *answerThree;

@property (nonatomic,strong) AVAudioPlayer *rightPlayer;
@property (nonatomic,strong) AVAudioPlayer *wrongPlayer;

@property (nonatomic,strong) NSMutableArray *curentItems;

@property (nonatomic, strong) NSTimer *runTimer;
@property (nonatomic, strong) NSTimer *findTimer;

@property(nonatomic, strong)NSMutableArray *itemsTotal;

@property (weak, nonatomic) IBOutlet UIView *bottomBgView;

@property(nonatomic, assign)NSInteger currentTag;
@property(nonatomic, assign)NSInteger rightAnswer;
@property(nonatomic, assign)NSInteger rightAnswerIndex;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *liftTop;

@end

@implementation SmartDetective_GameViewController

- (instancetype)initWithScore:(NSInteger)score life:(NSInteger)life level:(NSInteger)level{
    if(self = [super init]){
        self.level = level;
        self.score = score;
        self.life = life;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    SmartDetective_navigation *navi = (SmartDetective_navigation *)self.navigationController;
    navi.returnBlock = ^{
        [self cancelTimer];
    };
    SmartDetective_ReadyViewController *readyGo = [[SmartDetective_ReadyViewController alloc]initWithLevel:self.level rightAnswer:^(NSMutableArray * items) {
        self.curentItems = items;
        self.runTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.runTimer forMode:NSDefaultRunLoopMode];
        self.findTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(timerFind) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.findTimer forMode:NSDefaultRunLoopMode];
        [self getRightAnswer];
    }];
    [self yc_bottomPresentController:readyGo presentedHeight:KHeight completeHandle:^(BOOL presented) {}];
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.score];
    
    if IS_IPHONE_X_orMore {
        self.liftTop.constant = 56;
    }
}


- (void)timerRun{
    for (SmartDetective_ProblemItem *item in self.itemsTotal) {
        CGRect frame = item.frame;
        CGFloat Y = frame.origin.y ;
        Y = Y + 0.3;
        item.frame = CGRectMake((KWidth-327)/2, Y, 327, 107);
        if kiPhone5 {
            item.frame = CGRectMake((KWidth-300)/2, Y, 300, 107);
        }
    }
}

- (void)getRightAnswer{
    for (SmartDetective_ProblemItem *item in self.itemsTotal) {
        if(item.tag == self.currentTag){
            [item.arrowImage setHidden:NO];
            self.rightAnswer = item.rightNumber;
//            NSLog(@"%ld",self.rightAnswer);
        }else{
            [item.arrowImage setHidden:YES];
        }
    }
    [self randomAnswer];
}

- (void)timerFind{
    for (SmartDetective_ProblemItem *item in self.itemsTotal) {
        CGRect frame = item.frame;
        CGFloat Y = frame.origin.y + 107;
        if(Y > KHeight - 148){
            
            if(item.tag == self.currentTag){
               [self wrongMusic];
               item.frame =  CGRectMake((KWidth-327)/2, -((107*5 + 50*4) - (KHeight - 148) + 107 + 80), 327, 107);
               if kiPhone5 {
                    item.frame =  CGRectMake((KWidth-300)/2, -((107*5 + 50*4) - (KHeight - 148) + 107 + 80), 300, 107);
               }
               [item random];
               if(self.currentTag + 1 == 5){
                    self.currentTag = 0;
                    NSLog(@"currentTag====%ld",self.currentTag);
               }else{
                    self.currentTag = self.currentTag + 1;
                    NSLog(@"currentTag====%ld",self.currentTag);
               }
               [self getRightAnswer];
            }else{
                item.frame =  CGRectMake((KWidth-327)/2, -((107*5 + 50*4) - (KHeight - 148) + 107 + 80), 327, 107);
                if kiPhone5 {
                     item.frame =  CGRectMake((KWidth-300)/2, -((107*5 + 50*4) - (KHeight - 148) + 107 + 80), 300, 107);
                }
                [item random];
            }
        }
    }
}

- (void)randomAnswer{
    NSString *right = [NSString stringWithFormat:@"%ld",self.rightAnswer];
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    [arr addObject:right];
    
    NSMutableArray *imageName = [[NSMutableArray alloc]init];
    for (int i = 1; i<10; i++) {
       NSString *string = [NSString stringWithFormat:@"%d",i];
        if([string isEqualToString:right] == NO){
            [imageName addObject:string];
        }
    }

    NSMutableArray *arrNames = [NSObject SmartDetective_getNewArrWithOldArr:imageName count:2];
    for (NSString *string in arrNames) {
        [arr addObject:string];
    }
    
    NSMutableArray *newArr = [NSObject SmartDetective_randamArry:arr];
    if(newArr.count == 3){
        [self.answerOne setBackgroundImage:[UIImage imageNamed:newArr[0]] forState:UIControlStateNormal];
        [self.answerTwo setBackgroundImage:[UIImage imageNamed:newArr[1]] forState:UIControlStateNormal];
        [self.answerThree setBackgroundImage:[UIImage imageNamed:newArr[2]] forState:UIControlStateNormal];
    }
    self.rightAnswerIndex = [newArr indexOfObject:right];
    NSLog(@"self.rightAnswerIndex=======%ld",self.rightAnswerIndex);
}

- (void)rightOrWrongWithIndex:(NSInteger)index{
    if(self.rightAnswerIndex == index){
        [self rightMusic];
    }else{
        [self wrongMusic];
    }
    if(self.currentTag + 1 == 5){
        self.currentTag = 0;
    }else{
        self.currentTag = self.currentTag + 1;
    }
    [self getRightAnswer];
}

- (IBAction)answeOne:(UIButton *)buttion {
    [self rightOrWrongWithIndex:0];
}
- (IBAction)answerTwo:(UIButton *)buttion {
   [self rightOrWrongWithIndex:1];
}
- (IBAction)answerThree:(UIButton *)buttion {
    [self rightOrWrongWithIndex:2];
}

- (void)rightMusic{
    self.score = self.score + 10;
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.score];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"SecretOfRain_right.mp3" withExtension:nil];
    self.rightPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.rightPlayer play];
}

- (void)wrongMusic{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"SecretOfRain_wrong.mp3" withExtension:nil];
    self.wrongPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.wrongPlayer play];
    self.life = self.life - 1;
    [self checkLiftWith:self.life];
}

- (void)checkLiftWith:(NSUInteger)life{
    
    if(self.life == 3){
        self.lifeOne.image = [UIImage imageNamed:@"heart1"];
        self.lifeTwo.image = [UIImage imageNamed:@"heart1"];
        self.lifeThree.image = [UIImage imageNamed:@"heart1"];
        
    }else if (self.life == 2){
        self.lifeOne.image = [UIImage imageNamed:@"heart2"];
        self.lifeTwo.image = [UIImage imageNamed:@"heart1"];
        self.lifeThree.image = [UIImage imageNamed:@"heart1"];
        
    }else if (self.life == 1){
        self.lifeOne.image = [UIImage imageNamed:@"heart2"];
        self.lifeTwo.image = [UIImage imageNamed:@"heart2"];
        self.lifeThree.image = [UIImage imageNamed:@"heart1"];
        
    }else {
        self.lifeOne.image = [UIImage imageNamed:@"heart2"];
        self.lifeTwo.image = [UIImage imageNamed:@"heart2"];
        self.lifeThree.image = [UIImage imageNamed:@"heart2"];

        [self cancelTimer];
        [self saveAction];
        [self goToGameOver];
    }
}

- (void)goToGameOver{
    SmartDetective_GameOverViewController *vc = [[SmartDetective_GameOverViewController alloc]initWithScore:self.score level:self.level homeBlock:^{
        [self.navigationController popToRootViewControllerAnimated:YES];
    } againBlock:^{
        [self.navigationController popToRootViewControllerAnimated:NO];
        NSString *level = [NSString stringWithFormat:@"%ld",self.level];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"homeJumpTopGame" object:level];
    }];
    [self yc_bottomPresentController:vc presentedHeight:KHeight completeHandle:^(BOOL presented) {}];
}

- (void)saveAction{
    if(self.level == 1){
        [NSObject SmartDetective_saveScore:self.score key:@"MathForward_simple"];
    }else if (self.level == 2){
        [NSObject SmartDetective_saveScore:self.score key:@"MathForward_general"];
    }else{
        [NSObject SmartDetective_saveScore:self.score key:@"MathForward_difficult"];
    }
}

- (void)cancelTimer{
    if(self.runTimer != nil){
        [self.runTimer invalidate];
        self.runTimer = nil;
    }
    if(self.findTimer != nil){
        [self.findTimer invalidate];
        self.findTimer = nil;
    }
}

- (void)dealloc{
    [self cancelTimer];
}

- (NSMutableArray *)curentItems{
    if(_curentItems == nil){
        _curentItems = [[NSMutableArray alloc]init];
    }
    return _curentItems;
}

- (NSMutableArray *)itemsTotal{
    if(_itemsTotal == nil){
       _itemsTotal = [[NSMutableArray alloc]init];
        for (int i = 0; i < 5; i++) {
            SmartDetective_ProblemItem *item = [SmartDetective_ProblemItem getProblemItemWithLevel:self.level withItems:self.curentItems];
            
            CGRect fram;
            if kiPhone5 {
                fram = CGRectMake((KWidth-327)/2, -(i * (107 + 50)), 327, 107);
            }else{
                fram = CGRectMake((KWidth-300)/2, -(i * (107 + 50)), 300, 107);
            }
            
            item.frame = fram;
            item.tag = i;
            [_itemsTotal addObject:item];
            [self.view addSubview:item];
        }
        self.currentTag = 0;
        [self.view bringSubviewToFront:self.lifeOne];
        [self.view bringSubviewToFront:self.lifeTwo];
        [self.view bringSubviewToFront:self.lifeThree];
        [self.view bringSubviewToFront:self.bottomBgView];
        [self.view bringSubviewToFront:self.scoreLabel];
    }
    return _itemsTotal;
}

@end

