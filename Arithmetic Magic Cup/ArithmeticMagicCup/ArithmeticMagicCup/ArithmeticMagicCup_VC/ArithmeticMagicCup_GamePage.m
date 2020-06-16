//
//  ArithmeticMagicCup_GamePage.m
//  ArithmeticMagicCup
//
//  Created by zy on 2020/4/23.
//  Copyright © 2020 qingmai. All rights reserved.
//

#import "ArithmeticMagicCup_GamePage.h"

@interface ArithmeticMagicCup_GamePage ()<ArithmeticMagicCup_CupItemsDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UILabel *targetNumber;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *bottomTip;
@property (weak, nonatomic) IBOutlet UIButton *bottomBall;

@property(nonatomic, assign)NSInteger level;
@property(nonatomic, assign)NSInteger state;
@property(nonatomic, assign)NSInteger countdown;
@property(nonatomic, assign)NSInteger changeCount;

@property(nonatomic, assign)BOOL showTip;
@property (nonatomic,strong) UIButton *rightBtn;
@property (nonatomic,strong) UIBarButtonItem *rightItem;

@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong) NSTimer *changeTimer;

@property (nonatomic,strong) NSMutableArray *cupItems;
@property(nonatomic, strong) NSMutableArray *colors;

@property(nonatomic, assign) NSInteger rightNumber;
@property(nonatomic, assign) NSInteger bottomNumber;
@property(nonatomic, assign) NSInteger hardTagetNumber;

@property (nonatomic,strong) AVAudioPlayer *player;
@property (nonatomic,strong) AVAudioPlayer *player1;
@property (nonatomic,strong) AVAudioPlayer *player2;

@property(nonatomic, strong) UIColor *bottomBallColor;

@end

@implementation ArithmeticMagicCup_GamePage

- (instancetype)initWithLevel:(NSInteger)level state:(NSInteger)state showTip:(BOOL)showTip{
    if(self = [super init]){
        self.level = level;
        self.state = state;
        self.showTip = showTip;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = self.rightItem;
    [self.rightBtn setTitle:[NSString stringWithFormat:@"Stage %ld",self.state] forState:UIControlStateNormal];
    
    self.countdown = 8;
    self.navigationItem.title = [NSString stringWithFormat:@"%lds",self.countdown];

    [self setBottomSate];
    [self setBg];
    [self showTips];
    [self back];
    
    if(self.level == 1){
        [self.targetNumber setHidden:YES];
        [self.number setHidden:YES];
        [self.bottomBall setHidden:YES];
        [self.bottomTip setHidden:YES];
        self.bottomTip.text = @"Choice a cup to open";
    }else{
        [self.targetNumber setHidden:NO];
        [self.number setHidden:NO];
        [self.bottomBall setHidden:YES];
        [self.bottomTip setHidden:YES];
        self.bottomTip.text = @"Choose the cup and put the ball in";
    }
    [self setCups];
}

- (void)changeLocation{
    self.changeCount = [NSObject ArithmeticMagicCup_getRandomNumber:3 to:6];
    self.changeTimer = [NSTimer scheduledTimerWithTimeInterval:0.7 target:self selector:@selector(runChangeTimer) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.changeTimer forMode:NSDefaultRunLoopMode];
}

- (void)runTimer{
    if(self.countdown == 0 ){
        if(self.timer != nil){
            [self.timer invalidate];
            self.timer = nil;
        }
        [self changeLocation];
        self.countdown = 8;
        self.navigationItem.title = @"";
        for (ArithmeticMagicCup_CupItems *items in self.cupItems) {
            [items.cup setHidden:NO];
            items.clickBtn.enabled = NO;
        }
    
    }else{
        self.countdown = self.countdown - 1;
        self.navigationItem.title = [NSString stringWithFormat:@"%lds",self.countdown];
    }
}

- (void)runChangeTimer{
    if(self.changeCount == 0){
        if(self.changeTimer != nil){
            [self.changeTimer invalidate];
            self.changeTimer = nil;
        }
        //
        if(self.level == 1){
            [self.bottomTip setHidden:NO];
            [self.bottomBall setHidden:YES];
            [self.targetNumber setHidden:NO];
            [self.number setHidden:NO];
            
            self.number.text = [NSString stringWithFormat:@"%ld",self.rightNumber];
            for (ArithmeticMagicCup_CupItems *items in self.cupItems) {
                items.clickBtn.enabled = YES;
                if(self.rightNumber == items.right){
                    [items.rightView setHidden:NO];
                }
            }
            
        }else{
            [self.bottomTip setHidden:NO];
            [self.bottomBall setHidden:NO];
            NSInteger colorIndex = [NSObject ArithmeticMagicCup_getRandomNumber:0 to:3];
            self.bottomBallColor = self.colors[colorIndex];
            self.bottomBall.backgroundColor = self.bottomBallColor;
            [self.bottomBall setTitle:[NSString stringWithFormat:@"%ld",self.bottomNumber] forState:UIControlStateNormal];
            
             for (ArithmeticMagicCup_CupItems *items in self.cupItems) {
                 items.clickBtn.enabled = YES;
                 if(self.hardTagetNumber == items.right + self.bottomNumber){
                    [items.rightView setHidden:NO];
                 }
             }
        }
        
    }else{
        [self change];
        self.changeCount = self.changeCount - 1;
    }
}

- (void)change{
    
    NSMutableArray *indexs = [[NSMutableArray alloc]initWithArray:@[@(0),@(1),@(2)]];
    NSMutableArray *changeArr = [NSObject ArithmeticMagicCup_getNewArrWithOldArr:indexs count:2];
    
    if(changeArr.count == 2){
        NSInteger one = [changeArr[0] integerValue];
        NSInteger two = [changeArr[1] integerValue];

        ArithmeticMagicCup_CupItems *item1 = self.cupItems[one];
        ArithmeticMagicCup_CupItems *item2 = self.cupItems[two];
        
        CGRect frame1 = item1.frame;
        CGRect frame2 = item2.frame;
        [self music];
        [UIView animateWithDuration:0.4 animations:^{
            item1.frame = frame2;
            item2.frame = frame1;
        } completion:^(BOOL finished) {
            [self.cupItems exchangeObjectAtIndex:one withObjectAtIndex:two];
        }];
    }
}

- (void)clcikItem:(ArithmeticMagicCup_CupItems *)item right:(NSInteger)right{
    
    if(self.level == 1){
        if(self.rightNumber == right){
            [self right];
            self.state = self.state + 1;
            [self.rightBtn setTitle:[NSString stringWithFormat:@"Stage %ld",self.state] forState:UIControlStateNormal];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                for (ArithmeticMagicCup_CupItems *items in self.cupItems) {
                    [items removeFromSuperview];
                }
                [self.cupItems removeAllObjects];
                [self.targetNumber setHidden:YES];
                [self.number setHidden:YES];
                [self.bottomTip setHidden:YES];
                [self setCups];
                
                self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(runTimer) userInfo:nil repeats:YES];
                [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
                for (ArithmeticMagicCup_CupItems *items in self.cupItems) {
                    [items.cup setHidden:YES];
                }
            });
            
        }else{
            [self wrong];
             [self save];
            ArithmeticMagicCup_OverVC *vc = [[ArithmeticMagicCup_OverVC alloc]initWithState:self.state home:^{
                [self.navigationController popToRootViewControllerAnimated:YES];
            } again:^{
                [self.navigationController popToRootViewControllerAnimated:NO];
                NSString *string = [NSString stringWithFormat:@"%ld",self.level];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"MysteryBoard_gameAgain" object:string];
            }];
            [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
        }
    }
    
    if(self.level == 2){
        
        if(self.hardTagetNumber == right + self.bottomNumber){
           [self right];
           self.state = self.state + 1;
           [self.rightBtn setTitle:[NSString stringWithFormat:@"Stage %ld",self.state] forState:UIControlStateNormal];
        
            [UIView animateWithDuration:0.4 animations:^{
                self.bottomBall.frame = CGRectMake(item.frame.origin.x + 48, item.frame.origin.y + 42, 30, 30);
            }];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                for (ArithmeticMagicCup_CupItems *items in self.cupItems) {
                    [items removeFromSuperview];
                }
                [self.cupItems removeAllObjects];
                
                [self.bottomBall setHidden:YES];
                [self.bottomTip setHidden:YES];
                [self setCups];
                
                self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(runTimer) userInfo:nil repeats:YES];
                [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
                for (ArithmeticMagicCup_CupItems *items in self.cupItems) {
                    [items.cup setHidden:YES];
                }
            });
            
        }else{
           [self wrong];
            [self save];
            ArithmeticMagicCup_OverVC *vc = [[ArithmeticMagicCup_OverVC alloc]initWithState:self.state home:^{
                [self.navigationController popToRootViewControllerAnimated:YES];
            } again:^{
                [self.navigationController popToRootViewControllerAnimated:NO];
                NSString *string = [NSString stringWithFormat:@"%ld",self.level];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"MysteryBoard_gameAgain" object:string];
            }];
            [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
        }
    }

    for (ArithmeticMagicCup_CupItems *items in self.cupItems) {
        items.clickBtn.enabled = NO;
    }
}

- (void)setCups{

    CGFloat width = 86;
    CGFloat height = 112;
    CGFloat top = Iphone_Height - 90 - height;
    CGFloat left = (Iphone_Width - (width * 3) - (134 * 2))/2;
    
    if kiPhone5 {
        if(self.state == 0){
            top = 168;
            left = 71;
        }else{
            top = Iphone_Height - 90 - height + 15;
        }
    }
    
    if IS_IPHONE_X_orMore {
        if(self.state == 0){
            top = Iphone_Height - 90 - height - 30;
            left = (Iphone_Width - (width * 3) - (134 * 2))/2 - 120;
        }
    }
    
    if kiPhone6Plus {
        if(self.state == 0){
            top = Iphone_Height - 90 - height - 30;
            left = (Iphone_Width - (width * 3) - (134 * 2))/2 - 20;
        }
    }
    
    for (int i = 0; i<3; i++) {
        ArithmeticMagicCup_CupItems *item = [ArithmeticMagicCup_CupItems getCupItemsWithLevel:self.level];
        CGRect frame = CGRectMake(left + i * (width + 130), top, width, height);
        item.frame = frame;
        item.tag = i;
        item.delegate = self;
        [self.view addSubview:item];
        [self.cupItems addObject:item];
    }
    NSInteger cu = [NSObject ArithmeticMagicCup_getRandomNumber:0 to:2];
    ArithmeticMagicCup_CupItems *item = self.cupItems[cu];
    
    self.rightNumber = item.right;
    if(self.level == 2){
        self.bottomNumber = [NSObject ArithmeticMagicCup_getRandomNumber:0 to:9];
        self.hardTagetNumber = self.rightNumber + self.bottomNumber;
        [self.bottomBall setTitle:[NSString stringWithFormat:@"%ld",self.bottomNumber] forState:UIControlStateNormal];
        self.number.text = [NSString stringWithFormat:@"%ld",self.hardTagetNumber];
    }
}



- (void)setBottomSate{
    self.bottomTip.font = [UIFont fontWithName:FontName size:24];
    self.bottomBall.backgroundColor = [NSObject ArithmeticMagicCup_colorWithHexString:@"#FFAE00"];
    self.bottomBall.layer.cornerRadius = 15;
    self.bottomBall.layer.masksToBounds = YES;
    self.bottomBall.titleLabel.font = [UIFont fontWithName:FontName size:24];
}
- (void)showTips{
    if(self.showTip == YES){
        ArithmeticMagicCup_TipPage *VC = [[ArithmeticMagicCup_TipPage alloc]initWithType:self.level block:^{
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(runTimer) userInfo:nil repeats:YES];
            [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
            for (ArithmeticMagicCup_CupItems *items in self.cupItems) {
                [items.cup setHidden:YES];
            }
        }];
        [self yc_bottomPresentController:VC presentedHeight:Iphone_Height completeHandle:nil];
    }else{
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(runTimer) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
        for (ArithmeticMagicCup_CupItems *items in self.cupItems) {
            [items.cup setHidden:YES];
        }
    }
}
- (void)back{
    ArithmeticMagicCup_navigate *navi = (ArithmeticMagicCup_navigate *)self.navigationController;
    navi.backBlock = ^{
        if(self.timer != nil){
            [self.timer invalidate];
            self.timer = nil;
        }
        if(self.changeTimer != nil){
            [self.changeTimer invalidate];
            self.changeTimer = nil;
        }
    };
}

- (void)dealloc{
    if(self.timer != nil){
        [self.timer invalidate];
        self.timer = nil;
    }
    if(self.changeTimer != nil){
        [self.changeTimer invalidate];
        self.changeTimer = nil;
    }
}
- (void)setBg{
    if(self.level == 1){
        self.bgImageView.image = [UIImage imageNamed:@"background"];
    }else{
        self.bgImageView.image = [UIImage imageNamed:@"background2"];
    }
}


- (void)save{
    if(self.level == 1){
        [NSObject ArithmeticMagicCup_saveScore:self.state key:@"ArithmeticMagicCup_easy"];
    }
    if(self.level == 2){
        [NSObject ArithmeticMagicCup_saveScore:self.state key:@"ArithmeticMagicCup_hard"];
    }
}

- (UIButton *)rightBtn{
    if(_rightBtn == nil){
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.titleLabel.font = [UIFont fontWithName:FontName size:24];
        [_rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _rightBtn.frame = CGRectMake(0, 0, 100, 35);
        [_rightBtn setTitle:@"Stage 0" forState:UIControlStateNormal];
    }
    return _rightBtn;
}
- (UIBarButtonItem *)rightItem{
    if(_rightItem == nil){
        _rightItem = [[UIBarButtonItem alloc]initWithCustomView:self.rightBtn];
    }
    return _rightItem;
}
- (NSMutableArray *)cupItems{
    if(_cupItems == nil){
        _cupItems = [[NSMutableArray alloc]init];
    }
    return _cupItems;
}
- (NSMutableArray *)colors{
    if(_colors == nil){
        _colors = [[NSMutableArray alloc]initWithArray:@[[NSObject ArithmeticMagicCup_colorWithHexString:@"#FFAE00"],
                                                      [NSObject ArithmeticMagicCup_colorWithHexString:@"#4EAAFF"],
                                                      [NSObject ArithmeticMagicCup_colorWithHexString:@"#079485"],
                                                      [NSObject ArithmeticMagicCup_colorWithHexString:@"#F5463B"]]];
    }
    return _colors;
}
- (void)music{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"ArithmeticMagicCup_change.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player play];
}
- (void)right{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"ArithmeticMagicCup_right.mp3" withExtension:nil];
    self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player1 play];
}
- (void)wrong{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"ArithmeticMagicCup_wrong.mp3" withExtension:nil];
    self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player2 play];
}

@end
