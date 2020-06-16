//
//  RSSGameViewController.m
//  RapidSignSelection
//
//  Created by zy on 2020/6/5.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "RSSGameViewController.h"
#import "RSSTipsViewController.h"
#import "RSSOverViewController.h"
#import "NSArray+arrays.h"
#import "RSSAnswerItem.h"
#import "NSString+string.h"
#import <AVFoundation/AVFoundation.h>

@interface RSSGameViewController ()<RSSAnswerItemDelegate>

@property(nonatomic,assign) NSInteger level;
@property(nonatomic,assign) NSInteger life;
@property(nonatomic,assign) NSInteger score;
@property(nonatomic,assign) BOOL isTip;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UIImageView *lifeOne;
@property (weak, nonatomic) IBOutlet UIImageView *lifeTwo;
@property (weak, nonatomic) IBOutlet UIImageView *lifeThree;

@property (weak, nonatomic) IBOutlet UIView *sliderBg;
@property (weak, nonatomic) IBOutlet UIView *sliderView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sliderLeft;

@property (weak, nonatomic) IBOutlet UILabel *one1;
@property (weak, nonatomic) IBOutlet UILabel *one2;
@property (weak, nonatomic) IBOutlet UILabel *one3;

@property (weak, nonatomic) IBOutlet UILabel *two1;
@property (weak, nonatomic) IBOutlet UILabel *two2;
@property (weak, nonatomic) IBOutlet UILabel *two3;

@property (weak, nonatomic) IBOutlet UILabel *three1;
@property (weak, nonatomic) IBOutlet UILabel *three2;
@property (weak, nonatomic) IBOutlet UILabel *three3;

@property (nonatomic, strong) NSTimer *sliderTimer;
@property (nonatomic, assign) NSInteger sliderTimerConnt;
@property (nonatomic, assign) BOOL isAnswer;

@property (weak, nonatomic) IBOutlet UIView *bgOne;
@property (weak, nonatomic) IBOutlet UIView *bgTwo;
@property (weak, nonatomic) IBOutlet UIView *bgThree;

@property (nonatomic, strong) RSSAnswerItem *itemOne;
@property (nonatomic, strong) RSSAnswerItem *itemTwo;
@property (nonatomic, strong) RSSAnswerItem *itemThree;

@property (nonatomic,strong) AVAudioPlayer *player1;
@property (nonatomic,strong) AVAudioPlayer *player2;

@property (nonatomic, assign) NSInteger rightIndex;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftLay;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightlayout;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *geLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *gerightlay;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLay;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top2layout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textBottom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *redBottomLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttomLayout;

@end


@implementation RSSGameViewController

- (instancetype)initWithLevel:(NSInteger)level isTip:(BOOL)isTip{
    if(self = [super init]){
        self.level = level;
        self.isTip = isTip;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.life = 3;
    self.score = 0;
    self.sliderTimerConnt = 0;
    
    [self.bgOne addSubview:self.itemOne];
    [self.bgTwo addSubview:self.itemTwo];
    [self.bgThree addSubview:self.itemThree];
    
    [self setFont];
    if(self.isTip){
        [self showTip];
    }else{
        [self random];
    }
    
    if IS_IPHONE_X_orMore {
        self.top.constant = 55;
    }
    
    if kiPhone5 {
        self.leftLay.constant = 20;
        self.rightlayout.constant = 20;
        self.geLayout.constant = 5;
        self.gerightlay.constant = 5;
        self.topLay.constant = 15;
        self.top2layout.constant = 10;
        self.textBottom.constant = 10;
        self.redBottomLayout.constant = 0;
        self.buttomLayout.constant = 5;
    }
}

- (void)setFont{
    self.sliderBg.layer.cornerRadius = 7;
    self.sliderBg.layer.masksToBounds = YES;
    self.sliderView.layer.cornerRadius = 6;
    self.sliderView.layer.masksToBounds = YES;
}

- (void)showTip{
    RSSTipsViewController *tips = [[RSSTipsViewController alloc]initWithOkAction:^{
         [self random];
    }];
    [self yc_bottomPresentController:tips presentedHeight:Iphone_Height completeHandle:nil];
}

- (void)cancelTimer{
    if(self.sliderTimer != nil){
        [self.sliderTimer invalidate];
        self.sliderTimer = nil;
    }
}
- (void)sliderTimerRun{
    if(self.sliderTimerConnt == 12){
        self.sliderLeft.constant = 0;
        [self cancelTimer];
        self.sliderTimerConnt = 0;
        if(self.isAnswer == NO){
            [self wrongMusic];
            [self random];
        }
    }else{
        self.sliderTimerConnt ++;
        [UIView animateWithDuration:1 animations:^{
            self.sliderLeft.constant = - self.sliderTimerConnt * (268/12);
            [self.view layoutIfNeeded];
        }];
    }
}

- (void)random{
    
    self.sliderLeft.constant = 0;
    self.isAnswer = NO;
    self.sliderTimer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(sliderTimerRun) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.sliderTimer forMode:NSDefaultRunLoopMode];
    
    // one
    NSInteger faOne = [NSString randomNumber:1 to:3];
    
    NSInteger leftOne = 0;
    NSInteger rightOne = 0;
    NSInteger valueOne = 0;
    
    if(self.level == 1){
        leftOne = [NSString randomNumber:0 to:20];
        rightOne = [NSString randomNumber:0 to:20];
    }else if (self.level == 2){
        leftOne = [NSString randomNumber:0 to:50];
        rightOne = [NSString randomNumber:0 to:50];
    }else{
        leftOne = [NSString randomNumber:0 to:100];
        rightOne = [NSString randomNumber:0 to:100];
    }
    
    if(faOne == 1){ // +
        valueOne = leftOne + rightOne;
    }
    if(faOne == 3){ // x
         valueOne = leftOne * rightOne;
    }
    self.one1.text = [NSString stringWithFormat:@"%ld",leftOne];
    self.one2.text = [NSString stringWithFormat:@"%ld",rightOne];
    self.one3.text = [NSString stringWithFormat:@"%ld",valueOne];
    
    if(faOne == 2){ // -
        if(leftOne >= rightOne){
            valueOne = leftOne - rightOne;
            self.one1.text = [NSString stringWithFormat:@"%ld",leftOne];
            self.one2.text = [NSString stringWithFormat:@"%ld",rightOne];
            self.one3.text = [NSString stringWithFormat:@"%ld",valueOne];
        }else{
            valueOne = rightOne - leftOne;
            self.one1.text = [NSString stringWithFormat:@"%ld",rightOne];
            self.one2.text = [NSString stringWithFormat:@"%ld",leftOne];
            self.one3.text = [NSString stringWithFormat:@"%ld",valueOne];
        }
    }
    
    // two
    NSInteger faTwo = 0;
    NSInteger leftTwo = 0;
    NSInteger rightTwo = 0;
    NSInteger valueTwo = 0;
    
    do{
       faTwo = [NSString randomNumber:1 to:3];
    }while (faTwo == faOne);
    
    
    
    if(self.level == 1){
        leftTwo = [NSString randomNumber:0 to:20];
        rightTwo = [NSString randomNumber:0 to:20];
    }else if (self.level == 2){
        leftTwo = [NSString randomNumber:0 to:50];
        rightTwo = [NSString randomNumber:0 to:50];
    }else{
        leftTwo = [NSString randomNumber:0 to:100];
        rightTwo = [NSString randomNumber:0 to:100];
    }
    if(faTwo == 1){ // +
        valueTwo = leftTwo + rightTwo;
    }
    if(faTwo == 3){ // x
        valueTwo = leftTwo * rightTwo;
    }
    self.two1.text = [NSString stringWithFormat:@"%ld",leftTwo];
    self.two2.text = [NSString stringWithFormat:@"%ld",rightTwo];
    self.two3.text = [NSString stringWithFormat:@"%ld",valueTwo];
    
    if(faTwo  == 2){ // -
        if(leftTwo >= rightTwo){
            valueTwo = leftTwo - rightTwo;
            self.two1.text = [NSString stringWithFormat:@"%ld",leftTwo];
            self.two2.text = [NSString stringWithFormat:@"%ld",rightTwo];
            self.two3.text = [NSString stringWithFormat:@"%ld",valueTwo];
        }else{
            valueTwo = rightTwo - leftTwo;
            self.two1.text = [NSString stringWithFormat:@"%ld",rightTwo];
            self.two2.text = [NSString stringWithFormat:@"%ld",leftTwo];
            self.two3.text = [NSString stringWithFormat:@"%ld",valueTwo];
        }
    }
    
    // three
    NSInteger faThree = 0;
    NSInteger leftThree = 0;
    NSInteger rightThree = 0;
    NSInteger valueThree = 0;
    
    do{
       faThree = [NSString randomNumber:1 to:3];
    }while (faThree == faOne || faThree == faTwo);
    
    
    if(self.level == 1){
        leftThree = [NSString randomNumber:0 to:20];
        rightThree = [NSString randomNumber:0 to:20];
    }else if (self.level == 2){
        leftThree = [NSString randomNumber:0 to:50];
        rightThree = [NSString randomNumber:0 to:50];
    }else{
        leftThree = [NSString randomNumber:0 to:100];
        rightThree = [NSString randomNumber:0 to:100];
    }
    
    if(faThree == 1){ // +
        valueThree = leftThree + rightThree;
    }
    if(faThree == 3){ // x
        valueThree = leftThree * rightThree;
    }
    self.three1.text = [NSString stringWithFormat:@"%ld",leftThree];
    self.three2.text = [NSString stringWithFormat:@"%ld",rightThree];
    self.three3.text = [NSString stringWithFormat:@"%ld",valueThree];
    
    if(faTwo  == 2){ // -
        if(leftThree >= rightThree){
             valueThree = leftThree - rightThree;
            self.three1.text = [NSString stringWithFormat:@"%ld",leftThree];
            self.three2.text = [NSString stringWithFormat:@"%ld",rightThree];
            self.three3.text = [NSString stringWithFormat:@"%ld",valueThree];
        }else{
            valueThree = rightThree - leftThree;
            self.three1.text = [NSString stringWithFormat:@"%ld",rightThree];
            self.three2.text = [NSString stringWithFormat:@"%ld",leftThree];
            self.three3.text = [NSString stringWithFormat:@"%ld",valueThree];
        }
    }

    // rightAnswer
    NSInteger index = [NSString randomNumber:1 to:3];
    self.rightIndex = index;
    
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    [arr addObject:@(faOne)];
    [arr addObject:@(faTwo)];
    [arr addObject:@(faThree)];
    
    NSLog(@"====================%ld",self.rightIndex);
    if(self.rightIndex == 1){
        [self.itemOne setFuWithArr:arr];
        NSMutableArray *arrNew = [[NSMutableArray alloc]init];
        NSMutableArray *arrNewTwo = [[NSMutableArray alloc]init];
        do{
            arrNew = [NSArray RSSandamArry:arr];
        }while (arrNew[0] == arr[0] && arrNew[1] == arr[1] && arrNew[2] == arr[2]);
        [self.itemTwo setFuWithArr:arrNew];
        
        do{
            arrNewTwo = [NSArray RSSandamArry:arr];
        }while ((arrNewTwo[0] == arr[0] && arrNewTwo[1] == arr[1] && arrNewTwo[2] == arr[2]) ||
                (arrNewTwo[0] == arrNew[0] && arrNewTwo[1] == arrNew[1] && arrNewTwo[2] == arrNew[2]));
        [self.itemThree setFuWithArr:arrNewTwo];
    
    }
    if(self.rightIndex == 2){
        [self.itemTwo setFuWithArr:arr];
        
        NSMutableArray *arrNew = [[NSMutableArray alloc]init];
        NSMutableArray *arrNewTwo = [[NSMutableArray alloc]init];
        
        do{
            arrNew = [NSArray RSSandamArry:arr];
        }while (arrNew[0] == arr[0] && arrNew[1] == arr[1] && arrNew[2] == arr[2]);
        [self.itemOne setFuWithArr:arrNew];
        
        do{
            arrNewTwo = [NSArray RSSandamArry:arr];
        }while ((arrNewTwo[0] == arr[0] && arrNewTwo[1] == arr[1] && arrNewTwo[2] == arr[2]) ||
                (arrNewTwo[0] == arrNew[0] && arrNewTwo[1] == arrNew[1] && arrNewTwo[2] == arrNew[2]));
        [self.itemThree setFuWithArr:arrNewTwo];
    }
    if(self.rightIndex == 3){
        [self.itemThree setFuWithArr:arr];
        
        NSMutableArray *arrNew = [[NSMutableArray alloc]init];
        NSMutableArray *arrNewTwo = [[NSMutableArray alloc]init];
        
        do{
            arrNew = [NSArray RSSandamArry:arr];
        }while (arrNew[0] == arr[0] && arrNew[1] == arr[1] && arrNew[2] == arr[2]);
        [self.itemOne setFuWithArr:arrNew];
        
        do{
            arrNewTwo = [NSArray RSSandamArry:arr];
        }while ((arrNewTwo[0] == arr[0] && arrNewTwo[1] == arr[1] && arrNewTwo[2] == arr[2]) ||
                (arrNewTwo[0] == arrNew[0] && arrNewTwo[1] == arrNew[1] && arrNewTwo[2] == arrNew[2]));
        [self.itemTwo setFuWithArr:arrNewTwo];
    }
}

- (void)setSelfLiftWith:(NSUInteger)life{
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
        RSSOverViewController *vc = [[RSSOverViewController alloc]initWithScoreNumber:self.score homeBlock:^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        } againBlock:^{
             [self.navigationController popToRootViewControllerAnimated:NO];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"RapidSignSelection_gameAgain" object:[NSString stringWithFormat:@"%ld",self.level]];
        }];
        if(self.sliderTimer != nil){
            [self.sliderTimer invalidate];
            self.sliderTimer = nil;
        }
        [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
        [self saveAction];
    }
}

- (void)saveAction{
    [NSArray RSSsaveScore:self.score key:[NSString stringWithFormat:@"RapidSignSelection_%ld",self.level]];
}

- (void)clcikItemWithAnswer:(NSInteger)answer{
    [self cancelTimer];
    self.sliderTimerConnt = 0;
    self.isAnswer = YES;
    if(self.rightIndex == answer){
        [self rightMusic];
    }else{
        [self wrongMusic];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self random];
    });
}

- (void)rightMusic{
    self.score = self.score + 10;
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.score];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"RSSRIGHT.mp3" withExtension:nil];
    self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player1 play];
}
- (void)wrongMusic{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"RSSWRONG.mp3" withExtension:nil];
    self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player2 play];
    self.life = self.life - 1;
    [self setSelfLiftWith:self.life];
}

- (RSSAnswerItem *)itemOne{
    if(_itemOne == nil){
        _itemOne = [RSSAnswerItem getRSSAnswerItem];
        _itemOne.delegate = self;
        _itemOne.tag = 1;
    }
    return _itemOne;
}
- (RSSAnswerItem *)itemTwo{
    if(_itemTwo == nil){
        _itemTwo = [RSSAnswerItem getRSSAnswerItem];
        _itemTwo.delegate = self;
        _itemTwo.tag = 2;
    }
    return _itemTwo;
}
- (RSSAnswerItem *)itemThree{
    if(_itemThree == nil){
        _itemThree = [RSSAnswerItem getRSSAnswerItem];
        _itemThree.delegate = self;
        _itemThree.tag = 3;
    }
    return _itemThree;
}

@end
