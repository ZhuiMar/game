//
//  NMGameCenterViewController.m
//  NumberOfMemory
//
//  Created by  luzhaoyang on 2020/4/2.
//  Copyright © 2020 huadu. All rights reserved.
//

#import "NMGameCenterViewController.h"

#define timeConut 30

@interface NMGameCenterViewController ()<NMItemViewDelegate>

@property (nonatomic,assign) NSInteger selfType;

@property (weak, nonatomic) IBOutlet UIImageView *imageBg;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;
@property (weak, nonatomic) IBOutlet UILabel *timerCount;
@property (weak, nonatomic) IBOutlet UIButton *okBtn;

@property (nonatomic,assign) NSInteger level;
@property (nonatomic,assign) NSInteger rightCount;

@property (nonatomic,assign) NSInteger count;
@property (nonatomic,strong) NSTimer *timer;

@property (nonatomic,strong) AVAudioPlayer *player1;
@property (nonatomic,strong) AVAudioPlayer *player2;

@property (nonatomic,strong) NSMutableArray *leftArr;
@property (nonatomic,strong) NSMutableArray *rightArr;

@property (nonatomic,strong) NSMutableArray *leftCurArr;
@property (nonatomic,strong) NSMutableArray *rightCurArr;

@property (nonatomic,strong) NMItemView *currLeft;
@property (nonatomic,strong) NMItemView *curRight;
@property (nonatomic,assign) NSInteger currLeftVaule;
@property (nonatomic,assign) NSInteger curRightVaule;

@end

@implementation NMGameCenterViewController

- (instancetype)initWithType:(NSInteger)type level:(NSInteger)level{
    if(self = [super init]){
        self.selfType = type;
        self.level = level;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageBg.userInteractionEnabled = YES;
    self.levelLabel.font = [UIFont fontWithName:FontName size:22];
    self.timerCount.font = [UIFont fontWithName:FontName size:22];
    [self.okBtn setHidden:NO];
    
   
    self.rightCount = [self rightCountWith:self.level];

    self.count = timeConut;
    self.levelLabel.text = [NSString stringWithFormat:@"Level %ld",self.level];
    self.timerCount.text = [NSString stringWithFormat:@"%ldS",self.count];
   
    [self setAllBtns];
    
    [self randomLeftloction];
    [self randomRightloction];
    [self.okBtn setHidden:YES];
    
    self.curRightVaule = 0;
    self.currLeftVaule = 0;
    self.currLeft = nil;
    self.curRight = nil;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showTips];
    });
    
    NMNavigate *navigate = (NMNavigate *)self.navigationController;
    navigate.backBlock = ^{
        if(self.timer){
            [self.timer invalidate];
            self.timer = nil;
        }
    };
}

- (NSInteger)rightCountWith:(NSInteger)level{
    if(level == 1){
        return 4;
    }else if (level == 2){
        return 5;
    }else if (level == 3){
        return 6;
    }else if (level == 4){
        return 7;
    }else{
        return 8;
    }
}

- (void)clickLeftItemWithVaule:(NSInteger)vaule item:(NMItemView *)item{
    self.currLeft = item;
    self.currLeftVaule = vaule;
    
    if(self.currLeftVaule == 0 || self.curRightVaule == 0){
    }else{
         [self panduan];
    }
}
- (void)clickRightItemWithVaule:(NSInteger)vaule item:(NMItemView *)item{
    self.curRight = item;
    self.curRightVaule = vaule;
    if(self.currLeftVaule == 0 || self.curRightVaule == 0){
    }else{
         [self panduan];
    }
}

- (void)panduan{
    if(self.currLeftVaule == self.curRightVaule){
        [self.currLeft hiddenCover];
        [self.curRight hiddenCover];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.currLeft setHidden:YES];
            [self.curRight setHidden:YES];
            self.currLeft = nil;
            self.curRight = nil;
            self.curRightVaule = 0;
            self.currLeftVaule = 0;
        });
        [self rightMusic];
    }else{
        [self wrongMusic];
    }
}


- (void)setAllBtns{
    [self setLeft];
    [self setRight];
}

- (void)setLeft{
    
    CGFloat LM = 60;
    if(IS_IPHONE_X_orMore){
        LM = 130;
    }
    CGFloat LT = 30;
    CGFloat W = 112;
    CGFloat H = 42;
    
    if kiPhone5 {
        W = 100;
        H = 38;
        LT = 10;
    }
    
    for (int i = 0; i < 2; i ++) {
        for (int j = 0; j < 4; j ++) {
            NMItemView *buttion = [[NMItemView alloc]init];
            buttion.frame = CGRectMake(LM + i*(W + 10), j *(H + 10) + LT, W, H);
            [buttion setView];
            buttion.delegate = self;
            [buttion.coverBtn setEnabled:NO];
    
            [self.imageBg addSubview:buttion];

            if(i == 0){
                if(j == 0){
                    buttion.tag = 1;
                }else if (j == 1){
                    buttion.tag = 2;
                }else if (j == 2){
                    buttion.tag = 3;
                }else{
                    buttion.tag = 4;
                }
            }

            if(i == 1){
                if(j == 0){
                    buttion.tag = 5;
                }else if (j == 1){
                    buttion.tag = 6;
                }else if (j == 2){
                    buttion.tag = 7;
                }else{
                    buttion.tag = 8;
                }
            }
            
            [self.leftArr addObject:buttion];
            [buttion startAnimation];
            
        }
    }
}

    
- (void)setRight{
    
    CGFloat LT = 30;
    CGFloat LM = Iphone_Width/2 + 40;
    CGFloat W = 112;
    CGFloat H = 42;
    
    if kiPhone5 {
        W = 100;
        H = 38;
        LT = 10;
        LM = Iphone_Width/2 + 20;
    }
    
    for (int i = 0; i < 2; i ++) {
        for (int j = 0; j < 4; j ++) {
            
            NMItemView *buttion = [[NMItemView alloc]init];
            buttion.frame = CGRectMake(LM + i*(W + 10), j *(H + 10) + LT, W, H);
            [buttion setView];
            [self.imageBg addSubview:buttion];
            buttion.delegate = self;
            buttion.coverBtn.enabled = NO;

            if(i == 0){
                if(j == 0){
                    buttion.tag = 1 + 100;
                }else if (j == 1){
                    buttion.tag = 2 + 100;
                }else if (j == 2){
                    buttion.tag = 3 + 100;
                }else{
                    buttion.tag = 4 + 100;
                }
            }
            if(i == 1){
                if(j == 0){
                    buttion.tag = 5 + 100;
                }else if (j == 1){
                    buttion.tag = 6 + 100;
                }else if (j == 2){
                    buttion.tag = 7 + 100;
                }else{
                    buttion.tag = 8 + 100;
                }
            }
            
            [self.rightArr addObject:buttion];
            [buttion startAnimation];
        }
    }
}

- (void)randomLeftloction{
    
    [self.leftCurArr removeAllObjects];
    while ([self.leftCurArr count] < [self levelCount:self.level]) {
        int r = arc4random() % [self.leftArr count];
        if([self.leftCurArr containsObject:[self.leftArr objectAtIndex:r]] == NO){
            [self.leftCurArr addObject:[self.leftArr objectAtIndex:r]];
        }
    }
    for (UIButton *btn in self.leftArr) {
        if([self.leftCurArr containsObject:btn]){
            [btn setHidden:NO];
        }else{
            [btn setHidden:YES];
        }
    }
}

- (void)randomRightloction{
    [self.rightCurArr removeAllObjects];
    while ([self.rightCurArr count] <  [self levelCount:self.level]) {
        int r = arc4random() % [self.rightArr count];
        if([self.rightCurArr containsObject:[self.rightArr objectAtIndex:r]] == NO){
            [self.rightCurArr addObject:[self.rightArr objectAtIndex:r]];
        }
    }
    for (UIButton *btn in self.rightArr) {
        if([self.rightCurArr containsObject:btn]){
            [btn setHidden:NO];
        }else{
            [btn setHidden:YES];
        }
    }
}

- (void)showTips{
    NMTipsViewController *vc = [[NMTipsViewController alloc]initWithType:0];
    [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:^(BOOL presented) {
        if(presented == NO){
            [self.okBtn setHidden:NO];
            for (NMItemView *view in self.leftCurArr) {
                [view stopAnimation];
            }
            for (NMItemView *view in self.rightCurArr) {
                [view stopAnimation];
            }
        }
    }];
}

- (NSInteger)levelCount:(NSInteger)level{
    if(level == 1){
        return 4;
    }else if (level == 2){
        return 5;
    }else if (level == 3){
        return 6;
    }else if (level == 4){
        return 7;
    }else {
        return 8;
    }
}


- (IBAction)okBtnAction:(id)sender {
    [self.okBtn setHidden:YES];
    
    for (NMItemView *view in self.leftCurArr) {
        [view hiddenCover];
    }
    for (NMItemView *view in self.rightCurArr) {
        [view hiddenCover];
    }
    
    [self level1];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (NMItemView *view in self.leftCurArr) {
            [view showCover];
            view.coverBtn.enabled = YES;
        }
        for (NMItemView *view in self.rightCurArr) {
            [view showCover];
            view.coverBtn.enabled = YES;
        }
    });
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerChange) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (NSMutableArray*)getRandomArrFrome:(NSArray*)arr{
    NSMutableArray *newArr = [NSMutableArray new];
    while (newArr.count != arr.count) {
        int x =arc4random() % arr.count;
        id obj = arr[x];
        if (![newArr containsObject:obj]) {
            [newArr addObject:obj];
        }
    }
    return newArr;
}

- (void)level1{
    
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    NSMutableArray *targetArr = [[NSMutableArray alloc]init];
    for(int i = 2 ; i < 100 ; i++){
        NSNumber *num = @(i);
        [arr addObject:num];
    }
    while ([targetArr count] < [self levelCount:self.level]) {
        int r = arc4random() % [arr count];
        if([targetArr containsObject:[arr objectAtIndex:r]] == NO){
           [targetArr addObject:[arr objectAtIndex:r]];
        }
    }
    NSMutableArray *left = [self getRandomArrFrome:targetArr];
    NSMutableArray *right = [self getRandomArrFrome:targetArr];
    for(int i = 0; i<self.leftCurArr.count; i++){
        NMItemView *view = self.leftCurArr[i];
        NSNumber *num = left[i];
        view.value = [num integerValue];
        [view.bgBtn setTitle:[NSString stringWithFormat:@"%ld",[num integerValue]] forState:UIControlStateNormal];
    }
    for(int i = 0; i<self.rightCurArr.count; i++){
        NMItemView *view = self.rightCurArr[i];
        NSNumber *num = right[i];
        view.value = [num integerValue];
        NSInteger numxInt = [num integerValue];
        NSInteger leftNum = [NSObject getRandomNumber:0 to:numxInt];
        NSInteger rightNum = numxInt - leftNum;
        NSString *title = [NSString stringWithFormat:@"%ld+%ld",leftNum,rightNum];
        [view.bgBtn setTitle:title forState:UIControlStateNormal];
    }
}

- (void)timerChange{
    
    if(self.count < 0){
        self.count = 0;
    }
    if(self.count == 0){
        [self.timer invalidate];
        self.timer = nil;
        
        NMGameOverViewController *over = [[NMGameOverViewController alloc]initWithType:0];
        over.homeBlock = ^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        };
        over.agianBlock = ^{
            [self.navigationController popToRootViewControllerAnimated:NO];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"gameAction" object:[NSString stringWithFormat: @"%ld-%ld",self.selfType,self.level]];
        };
        [self yc_bottomPresentController:over presentedHeight:Iphone_Height completeHandle:nil];
        
    }else{
        self.count = self.count - 1;
        self.timerCount.text = [NSString stringWithFormat:@"%ldS",self.count];
    }
}

- (void)rightMusic{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"nmRihgt_music.mp3" withExtension:nil];
    self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player1 play];

    self.rightCount = self.rightCount - 1;
    if(self.rightCount == 0){
        
        // save
        if(self.selfType == 0){
            [[NSUserDefaults standardUserDefaults] setObject:@(self.level) forKey:@"easy_ranking"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }else{
            [[NSUserDefaults standardUserDefaults] setObject:@(self.level) forKey:@"hard_ranking"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        
        NMGameOverViewController *over = [[NMGameOverViewController alloc]initWithType:1];
        over.homeBlock = ^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        };
        over.agianBlock = ^{
            if(self.level + 1 <= 5){
                self.level = self.level + 1;
                [self.navigationController popToRootViewControllerAnimated:NO];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"gameAction" object:[NSString stringWithFormat: @"%ld-%ld",self.selfType,self.level]];
            }else{
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        };
        [self yc_bottomPresentController:over presentedHeight:Iphone_Height completeHandle:nil];
    }
}
- (void)wrongMusic{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"nmWrong_music.mp3" withExtension:nil];
    self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player2 play];
    if(self.selfType == 1){
        self.count = self.count - 3;
    }
}

- (NSMutableArray *)leftArr{
    if(_leftArr == nil){
        _leftArr = [[NSMutableArray alloc]init];
    }
    return _leftArr;
}

- (NSMutableArray *)rightArr{
    if(_rightArr == nil){
        _rightArr = [[NSMutableArray alloc]init];
    }
    return _rightArr;
}

- (NSMutableArray *)leftCurArr{
    if(_leftCurArr == nil){
       _leftCurArr = [[NSMutableArray alloc]init];
    }
    return _leftCurArr;
}
- (NSMutableArray *)rightCurArr{
    if(_rightCurArr == nil){
       _rightCurArr = [[NSMutableArray alloc]init];
    }
    return _rightCurArr;
}


- (void)dealloc{
    if(self.timer){
        [self.timer invalidate];
        self.timer = nil;
    }
}

@end
