//
//  MathForward_GameViewController.m
//  MathForward
//
//  Created by luzhaoyang on 2020/4/21.
//  Copyright © 2020 teresa. All rights reserved.
//

#import "MathForward_GameViewController.h"

@interface MathForward_GameViewController ()

@property (nonatomic, assign) NSInteger life;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, assign) NSInteger renwu;

@property (nonatomic, assign) BOOL isTip;

@property (nonatomic, strong) NSMutableArray *bottomBtns;
@property (nonatomic, strong) NSMutableArray *currentBtns;

@property (weak, nonatomic) IBOutlet UIImageView *bottomBg;

@property (nonatomic, strong) NSMutableArray *items;
@property (weak, nonatomic) IBOutlet UIView *scrollerBg;

@property (nonatomic, strong) NSTimer *runTimer;
@property (nonatomic, strong) NSTimer *findTimer;

@property (weak, nonatomic) IBOutlet UIButton *chuBtn;
@property (weak, nonatomic) IBOutlet UIImageView *chuimageView;

@property (nonatomic,strong) AVAudioPlayer *player1;
@property (nonatomic,strong) AVAudioPlayer *player2;
@property (nonatomic,strong) AVAudioPlayer *player3;
@property (nonatomic,strong) AVAudioPlayer *player4;

@property (weak, nonatomic) IBOutlet UIImageView *lifeOne;
@property (weak, nonatomic) IBOutlet UIImageView *lifeTwo;
@property (weak, nonatomic) IBOutlet UIImageView *lifeThree;

@property (nonatomic, strong) MathForward_ItemsView *lastItem;

@property (nonatomic, assign) NSInteger currentIndex;

@property (weak, nonatomic) IBOutlet UILabel *taskLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskCount;

@property (nonatomic, assign) NSInteger task;

@end

@implementation MathForward_GameViewController

- (instancetype)initWithLevel:(NSInteger)level life:(NSInteger)life isTip:(BOOL)isTip score:(NSInteger)score renwu:(NSInteger)renwu{
    if(self = [super init]){
        self.level = level;
        self.score = score;
        self.isTip = isTip;
        self.life = life;
        self.renwu = renwu;
        self.task = 100 + self.renwu * 50;
    }
    return self;
}

- (void)showTip{
    MathForward_TipsViewController *vc = [[MathForward_TipsViewController alloc]initIKnowTip:self.level know:^{
        [self setScroller];
    }];
    [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setSelfLiftWith:self.life];
    
    self.taskLabel.font = [UIFont fontWithName:FontName size:18];
    self.taskCount.font = [UIFont fontWithName:FontName size:18];

    [self bottomButtom];
    self.currentIndex = 0;
    
    if(self.level == 1){
        [self.taskLabel setHidden:YES];
        [self.taskCount setHidden:YES];
        self.navigationItem.title = [NSString stringWithFormat:@"%ld",self.score];
    }else{
        [self.taskLabel setHidden:NO];
        [self.taskCount setHidden:NO];
        self.taskLabel.text = [NSString stringWithFormat:@"task:%ld/%ld",self.score,self.task];
        self.taskCount.text = [NSString stringWithFormat:@"level %ld",self.renwu];
    }

    if(self.isTip){
        [self showTip];
    }else{
        [self setScroller];
    }
   
    MathForward_navigation *navi = (MathForward_navigation *)self.navigationController;
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
}

- (void)startScroller{
    self.runTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.runTimer forMode:NSDefaultRunLoopMode];
    self.findTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(timerFind) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.findTimer forMode:NSDefaultRunLoopMode];
}

- (void)timerRun{
    for (MathForward_ItemsView *item in self.items) {
        CGRect frame = item.frame;
        CGFloat x = frame.origin.x - 0.5;
        item.frame = CGRectMake(x, 0, 94, 110);
    }
}

- (void)timerFind{
    for (MathForward_ItemsView *item in self.items) {
        CGRect frame = item.frame;
        CGFloat x = frame.origin.x;
        if(x <= -((94*6 + 55*5) - Iphone_Width)-55-94){
            item.frame = CGRectMake(Iphone_Width, 0, 94, 110);
            [self setTittleWithItem:item];
        }
        if(x>0 && x < Iphone_Width-94){
            if([self.currentBtns containsObject:item] == NO){
                [self.currentBtns addObject:item];
            }
        }else{
            if([self.currentBtns containsObject:item] == YES){
                [self.currentBtns removeObject:item];
            }
        }
    }
}


- (void)setScroller{
    for (MathForward_ItemsView *item in self.items) {
        [self.scrollerBg addSubview:item];
    }
    [self startScroller];
}

- (void)bottomButtom{
    self.bottomBg.userInteractionEnabled = YES;
    CGFloat W = (Iphone_Width-250)/9;
    CGFloat H = 30;
    for(int i = 0; i < 9; i++){
        UIButton *buttion = [UIButton buttonWithType:UIButtonTypeCustom];
        CGRect frame = CGRectMake(25 + i * (W + 25), 26, W, H);
        buttion.frame = frame;
        [buttion setBackgroundImage:[UIImage imageNamed:self.bottomBtns[i]] forState:UIControlStateNormal];
        [buttion addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        buttion.tag = i + 1;
        [self.bottomBg addSubview:buttion];
    }
}

- (void)clickBtn:(UIButton *)buttion{
    
    [self.chuBtn setHidden:YES];
    [self.chuimageView setHidden:YES];
    [self.lastItem.topImageView setHidden:YES];
    
    MathForward_ItemsView *item = self.items[self.currentIndex];
    NSInteger tag = buttion.tag;
    [item.topImageView setHidden:NO];

    if(tag == item.rightVaule){
        [self rightMusic];
    }else{
        [self wrongMusic];
    }

    self.lastItem = item;
    self.currentIndex = self.currentIndex + 1;
    if(self.currentIndex == 6){
        self.currentIndex = 0;
    }
}

- (void)rightMusic{
    self.score = self.score + 10;
    
    if(self.level == 2){
        
        self.taskLabel.text = [NSString stringWithFormat:@"task:%ld/%ld",self.score,self.task];
        self.taskCount.text = [NSString stringWithFormat:@"level %ld",self.renwu];
        
        if(self.score == self.task){
                    
            MathForward_OverViewController *vc = [[MathForward_OverViewController alloc]initWithScore:self.score type:self.level isSu:YES home:^{
                [self.navigationController popToRootViewControllerAnimated:YES];
            } again:^{
                [self.navigationController popToRootViewControllerAnimated:NO];
                NSString *str = [NSString stringWithFormat:@"%ld=%ld=%d=%d=%ld",self.level, (long)self.life ,0 ,0,(long)self.renwu + 1];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"gameAgain" object:str];
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
        
    }else{
        self.navigationItem.title = [NSString stringWithFormat:@"%ld",self.score];
    }

    NSURL *url = [[NSBundle mainBundle] URLForResource:@"MathForward_right.mp3" withExtension:nil];
    self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player1 play];
}
- (void)wrongMusic{
    self.life = self.life - 1;
    [self setSelfLiftWith:self.life];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"MathForward_wrong.mp3" withExtension:nil];
    self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player2 play];
}

- (void)jumpMusic{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"MathForward_jump.mp3" withExtension:nil];
    self.player4 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player4 play];
}

- (NSMutableArray *)bottomBtns{
    if(_bottomBtns == nil){
        _bottomBtns = [[NSMutableArray alloc]init];
        for (NSInteger i = 1; i < 10; i++) {
            NSString *string = [NSString stringWithFormat:@"%ld",i];
            [_bottomBtns addObject:string];
        }
    }
    return _bottomBtns;
}

- (NSMutableArray *)items{
    if(_items == nil){
        _items = [[NSMutableArray alloc]init];
        for (int i = 0; i<6; i++) {
            CGRect frame = CGRectMake(Iphone_Width + i * (110 + 55) , 0, 94, 110);
            MathForward_ItemsView *item = [MathForward_ItemsView getItem];
            item.originFrame = frame;
            item.frame = frame;
            [self setTittleWithItem:item];
            [_items addObject:item];
        }
    }
    return _items;
}

- (void)setTittleWithItem:(MathForward_ItemsView *)item{
    NSInteger one = [NSObject MathForward_getRandomNumber:1 to:9];
    NSInteger two = [NSObject MathForward_getRandomNumber:1 to:9];
    NSInteger three = [NSObject MathForward_getRandomNumber:1 to:9];
    NSInteger four = one + two + three;
    [item.titleBtn setTitle:[NSString stringWithFormat:@"%ld+%ld+?=%ld",one,two,four] forState:UIControlStateNormal];
    item.rightVaule = three;
}

- (NSMutableArray *)currentBtns{
    if(_currentBtns == nil){
        _currentBtns = [[NSMutableArray alloc]init];
    }
    return _currentBtns;
}

- (void)setSelfLiftWith:(NSUInteger)life{
    
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

        [self saveAction];
        MathForward_OverViewController *vc = [[MathForward_OverViewController alloc]initWithScore:self.score type:self.level isSu:NO home:^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        } again:^{
            
            if(self.level == 1){
                [self.navigationController popToRootViewControllerAnimated:NO];
                NSString *str = [NSString stringWithFormat:@"%ld=%d=%d=%d=%d",self.level, 3 ,0 ,0,0];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"gameAgain" object:str];
            }else{
                [self.navigationController popToRootViewControllerAnimated:NO];
                NSString *str = [NSString stringWithFormat:@"%ld=%d=%d=%d=%d",self.level, 3 ,0 ,0,0];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"gameAgain" object:str];
            }
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
    if(self.level == 1){
        [NSObject MathForward_saveScore:self.score key:@"MathForward_easy"];
    }else{
        [NSObject MathForward_saveScore:self.renwu key:@"MathForward_hard"];
    }
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
