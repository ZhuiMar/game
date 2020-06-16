//
//  MatheSpider_GameViewController.m
//  MathematicalSpider
//
//  Created by luzhaoyang on 2020/4/20.
//  Copyright © 2020 teresa. All rights reserved.
//

#import "MatheSpider_GameViewController.h"
 
#define Width 54
#define Height 61
#define TimerCount 120

@interface MatheSpider_GameViewController ()<JSAnalogueStickDelegate>

@property (weak, nonatomic) IBOutlet JSAnalogueStick *analogueStick;

@property(nonatomic, strong) UIImageView *spider;

@property(nonatomic,assign) NSInteger score;
@property(nonatomic,assign) NSInteger type;
@property(nonatomic,assign) BOOL isTips;

@property(nonatomic,assign) CGFloat halfXBi;
@property(nonatomic,assign) CGFloat halfYBi;

@property(nonatomic,assign) CGRect startFrame;
@property(nonatomic,assign) CGPoint point;

@property(nonatomic,strong) UIButton *rightBtn;
@property(nonatomic,strong) UIBarButtonItem *rightItem;

@property(nonatomic,strong) SDDrawView *drawView;

@property (weak, nonatomic) IBOutlet JSAnalogueStick *handleGbView;
@property (weak, nonatomic) IBOutlet UIButton *catchBtn;

@property (weak, nonatomic) IBOutlet UIButton *food1;
@property (weak, nonatomic) IBOutlet UIButton *food2;
@property (weak, nonatomic) IBOutlet UIButton *food3;
@property (weak, nonatomic) IBOutlet UIButton *food4;
@property (weak, nonatomic) IBOutlet UIButton *food5;
@property (weak, nonatomic) IBOutlet UIButton *food6;
@property (weak, nonatomic) IBOutlet UIButton *food7;

@property (nonatomic,strong) NSMutableArray *foods;
@property (nonatomic,strong) NSMutableArray *arrX;
@property (nonatomic,strong) NSMutableArray *arrY;

@property (nonatomic,assign) NSInteger currentValue;
@property (nonatomic,assign) NSInteger rightValue;

@property (weak, nonatomic) IBOutlet UILabel *gonshilabel;

@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign) NSInteger timerCount;

@property (nonatomic,strong) AVAudioPlayer *player1;
@property (nonatomic,strong) AVAudioPlayer *player2;

@property (nonatomic,strong) UIImageView *stone;
@property (nonatomic,strong) NSTimer *downStoneTimer;
@property (nonatomic,strong) NSTimer *findstoneTimer;

@property (nonatomic,strong) NSTimer *moveBallTimer;
@property (nonatomic,assign) CGRect ballStartFrame;

@property (nonatomic,assign) BOOL isTouch;
@property (nonatomic,assign) NSInteger cureentIndex;

@property (nonatomic,strong) NSMutableArray *itemimages;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLeftLayout;

@end

@implementation MatheSpider_GameViewController

- (instancetype)initWithType:(NSInteger)tpye showTip:(BOOL)showTips score:(NSInteger)score{
    if(self = [super init]){
        self.type = tpye;
        self.score = score;
        self.isTips = showTips;
    }
    return self;
}

- (void)showTip{
    MatheSpider_TipsViewController *vc = [[MatheSpider_TipsViewController alloc]initOkBlock:^{
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
        NSInteger jiange = 5;
        if(self.type == 2){
            jiange = 3;
        }
        self.downStoneTimer = [NSTimer scheduledTimerWithTimeInterval:jiange target:self selector:@selector(downStone) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.downStoneTimer forMode:NSDefaultRunLoopMode];
        self.findstoneTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(findStone) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.findstoneTimer forMode:NSDefaultRunLoopMode];
    }];
    [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
}

- (void)findStone{
    CGRect stoneFrame = self.stone.frame;
    if (CGRectIntersectsRect(stoneFrame, self.spider.frame)) {
        self.stone.frame = self.ballStartFrame;
        [self wrongMusic];
        if(self.moveBallTimer != nil){
            [self.moveBallTimer invalidate];
            self.moveBallTimer = nil;
        }
    }
    if(stoneFrame.origin.y > Iphone_Height){
        if(self.moveBallTimer != nil){
            [self.moveBallTimer invalidate];
            self.moveBallTimer = nil;
        }
    }
}
- (void)random{
    
    if(self.type == 1){
           NSInteger left = [NSObject MatheSpider_getRandomNumber:1 to:9];
           NSInteger middle;
           NSInteger right;
           do{
              middle = [NSObject MatheSpider_getRandomNumber:1 to:9];
           }while (middle == left);
           do{
              right = [NSObject MatheSpider_getRandomNumber:1 to:9];
           }while (right == left && right == middle);
           self.gonshilabel.text = [NSString stringWithFormat:@"%ld+%ld+%ld = ?",left,middle,right];
           self.rightValue = left + middle + right;
           NSLog(@"%@",self.gonshilabel.text);
           NSLog(@"rightValue%d",self.rightValue);
           NSMutableArray *values = [[NSMutableArray alloc]init];
           do{
               NSInteger vaule = [NSObject MatheSpider_getRandomNumber:3 to:29];
               if([values containsObject:@(vaule)] == NO && vaule != self.rightValue){
                   [values addObject:@(vaule)];
               }
           }while (values.count < 6);
           [values addObject:@(self.rightValue)];
           NSMutableArray *new = [NSObject MatheSpider_randamArry:values];
           NSMutableArray *nemwImages = [NSObject MatheSpider_randamArry:self.itemimages];
           for (int i = 0; i<7; i++) {
               UIButton *buttion = self.foods[i];
               [buttion setTitle:[new[i] stringValue] forState:UIControlStateNormal];
               [buttion setBackgroundImage:[UIImage imageNamed:nemwImages[i]] forState:UIControlStateNormal];
           }
    }
    
    if(self.type == 2){
        NSInteger left = [NSObject MatheSpider_getRandomNumber:30 to:60];
        NSInteger middle;
        NSInteger right;
        do{
           middle = [NSObject MatheSpider_getRandomNumber:30 to:60];
        }while (middle == left);
        do{
           right = [NSObject MatheSpider_getRandomNumber:30 to:60];
        }while (right == left && right == middle);
        
        self.gonshilabel.text = [NSString stringWithFormat:@"%ld+%ld+%ld = ?",left,middle,right];
        self.rightValue = left + middle + right;
        
        NSLog(@"%@",self.gonshilabel.text);
        NSLog(@"rightValue%d",self.rightValue);
        NSMutableArray *values = [[NSMutableArray alloc]init];
        do{
            NSInteger vaule = [NSObject MatheSpider_getRandomNumber:90 to:180];
            if([values containsObject:@(vaule)] == NO && vaule != self.rightValue){
                [values addObject:@(vaule)];
            }
        }while (values.count < 6);
        [values addObject:@(self.rightValue)];
        NSMutableArray *new = [NSObject MatheSpider_randamArry:values];
        NSMutableArray *nemwImages = [NSObject MatheSpider_randamArry:self.itemimages];
        for (int i = 0; i<7; i++) {
            UIButton *buttion = self.foods[i];
            [buttion setTitle:[new[i] stringValue] forState:UIControlStateNormal];
            [buttion setBackgroundImage:[UIImage imageNamed:nemwImages[i]] forState:UIControlStateNormal];
        }
    }
}

- (void)dealloc{
    if(self.timer != nil){
        [self.timer invalidate];
        self.timer = nil;
    }
    if(self.downStoneTimer != nil){
        [self.downStoneTimer invalidate];
        self.downStoneTimer = nil;
    }
    if(self.findstoneTimer != nil){
        [self.findstoneTimer invalidate];
        self.findstoneTimer = nil;
    }
    if(self.moveBallTimer != nil){
        [self.moveBallTimer invalidate];
        self.moveBallTimer = nil;
    }
}

- (void)downStone{
    NSInteger duan = Iphone_Height/42;
    self.cureentIndex = [NSObject MatheSpider_getRandomNumber:0 to:duan];
    self.stone.frame = CGRectMake(42*self.cureentIndex, -42.5, 42.5, 42.5);
    self.moveBallTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(moveBall) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.moveBallTimer forMode:NSDefaultRunLoopMode];
}

- (void)moveBall{
    CGFloat y = self.stone.frame.origin.y;
    NSInteger sudu = 3;
    if(self.type == 2){
        sudu = 6;
    }
    y = y + sudu;
    self.stone.frame = CGRectMake(42*self.cureentIndex, y, 42.5, 42.5);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.drawView addSubview:self.stone];
    self.timerCount = TimerCount;
    [self.rightBtn setTitle:[NSString stringWithFormat:@"%ldS",self.timerCount] forState:UIControlStateNormal];
    self.navigationItem.title = [NSString stringWithFormat:@"%ld",self.score];
    self.navigationItem.rightBarButtonItem = self.rightItem;
    
    if(self.isTips == YES){
        [self showTip];
    }else{
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
        
        NSInteger jiange = 5;
        if(self.type == 2){
           jiange = 3;
        }
        
        self.downStoneTimer = [NSTimer scheduledTimerWithTimeInterval:jiange target:self selector:@selector(downStone) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.downStoneTimer forMode:NSDefaultRunLoopMode];
        
        self.findstoneTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(findStone) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.findstoneTimer forMode:NSDefaultRunLoopMode];
    }
    
    [self.view addSubview:self.drawView];
    [self.drawView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.height.mas_equalTo(Iphone_Height);
        make.width.mas_equalTo(Iphone_Width);
    }];
    
    self.analogueStick.delegate = self;
    [self.view addSubview:self.spider];
    self.halfXBi = Iphone_Width/2;
    self.halfYBi = Iphone_Height/2;
    [self.view bringSubviewToFront:self.handleGbView];
    [self.view bringSubviewToFront:self.catchBtn];
    
    [self.foods addObject:self.food1];
    [self.foods addObject:self.food2];
    [self.foods addObject:self.food3];
    [self.foods addObject:self.food4];
    [self.foods addObject:self.food5];
    [self.foods addObject:self.food6];
    [self.foods addObject:self.food7];
    
    MatheSpider_navigation *na = (MatheSpider_navigation *)self.navigationController;
    na.backBlock = ^{
        [self saveScore];
        if(self.timer != nil){
            [self.timer invalidate];
            self.timer = nil;
        }
        if(self.downStoneTimer != nil){
            [self.downStoneTimer invalidate];
            self.downStoneTimer = nil;
        }
        if(self.findstoneTimer != nil){
            [self.findstoneTimer invalidate];
            self.findstoneTimer = nil;
        }
        if(self.moveBallTimer != nil){
            [self.moveBallTimer invalidate];
            self.moveBallTimer = nil;
        }
    };
    [self random];
    self.isTouch = NO;
    
    if kiPhone5 {
        self.bottomLeftLayout.constant = 50;
    }
}


- (void)timerRun{
    
    if(self.timerCount < 0){
        self.timerCount = 0;
    }
    if(self.timerCount <= 0){
        if(self.timer != nil){
            [self.timer invalidate];
            self.timer = nil;
        }
        if(self.downStoneTimer != nil){
            [self.downStoneTimer invalidate];
            self.downStoneTimer = nil;
        }
        if(self.findstoneTimer != nil){
            [self.findstoneTimer invalidate];
            self.findstoneTimer = nil;
        }
        if(self.moveBallTimer != nil){
            [self.moveBallTimer invalidate];
            self.moveBallTimer = nil;
        }
        MatheSpider_OverViewController *vc = [[MatheSpider_OverViewController alloc]initScore:self.score home:^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        } again:^{
            [self.navigationController popViewControllerAnimated:NO];
            NSString *string = [NSString stringWithFormat:@"%ld",self.type];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"gameAgain" object:string];
        }];
        [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
        [self saveScore];
    }
    else{
        self.timerCount = self.timerCount - 1;
        [self.rightBtn setTitle:[NSString stringWithFormat:@"%ldS",self.timerCount] forState:UIControlStateNormal];
    }
}

- (void)analogueStickDidChangeValue:(JSAnalogueStick *)analogueStick{
    
    // NSLog(@"%@",[NSString stringWithFormat:@"Analogue: %.1f , %.1f", self.analogueStick.xValue, self.analogueStick.yValue]);
    
    CGFloat handx = self.analogueStick.xValue;
    CGFloat handy = self.analogueStick.yValue;
    CGFloat x = self.startFrame.origin.x + (handx * self.halfXBi)-Width/2;
    CGFloat y = self.startFrame.origin.y - (handy * self.halfYBi)-Height/2;
    self.spider.frame = CGRectMake(x, y, Width, Height);
    
    self.point = CGPointMake(x+33, y+55);
    [self.drawView movingPoint:self.point];
    
    if(self.isTouch == YES){
        [self.arrX addObject:@(self.point.x)];
        [self.arrY addObject:@(self.point.y)];
    }

    if(analogueStick == nil){
        
        if(self.isTouch == NO){
            return;
        }
        
        NSArray *resultX = [self.arrX sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
             return [obj2 compare:obj1];
        }];
        NSArray *resultY = [self.arrY sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
             return [obj2 compare:obj1];
        }];
        
        NSInteger Xda = [resultX.firstObject integerValue];
        NSInteger Xxiao = [resultX.lastObject integerValue];
        NSInteger Yda = [resultY.firstObject integerValue];
        NSInteger Yxiao = [resultY.lastObject integerValue];
        
        UIButton *curBtn;
        for (UIButton *buttion in self.foods) {
            if(buttion.center.x>Xxiao && buttion.center.x<Xda && buttion.center.y>Yxiao && buttion.center.y<Yda){
                curBtn = buttion;
            }
        }
        NSString *currentStr = [curBtn titleForState:UIControlStateNormal];
        
        NSLog(@"<><><><><><><><><><><><>%@",currentStr);
        self.currentValue = [currentStr integerValue];
        
        if(self.currentValue == self.rightValue){
            [self rightMusic];
        }else{
            [self wrongMusic];
        }
        
        [self.drawView cleanAction];
        self.isTouch = NO;
        [self.arrX removeAllObjects];
        [self.arrY removeAllObjects];
        [self random];
    }
}

- (void)saveScore{
    if(self.type == 1){
        [NSObject MatheSpider_saveScore:self.score key:@"MatheSpider_easy"];
    }
    if(self.type == 2){
        [NSObject MatheSpider_saveScore:self.score key:@"MatheSpider_hard"];
    }
}

- (UIImageView *)spider{
    if(_spider == nil){
        _spider = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"spider"]];
        _spider.frame = CGRectMake(self.view.center.x, self.view.center.y, Width, Height);
        self.startFrame = _spider.frame;
        self.point = CGPointMake(self.startFrame.origin.x+33, self.startFrame.origin.y+55);
    }
    return _spider;
}
- (SDDrawView *)drawView{
    if(_drawView == nil){
        _drawView = [[SDDrawView alloc]init];
        _drawView.backgroundColor = [UIColor clearColor];
        _drawView.lineWidth = 5;
        _drawView.drawStyle = DrawStyleLine;
        _drawView.lineColor = [UIColor whiteColor];
    }
    return _drawView;
}

- (IBAction)catchAction:(id)sender {
    self.isTouch = YES;
    [self.arrY removeAllObjects];
    [self.arrX removeAllObjects];
    [self.drawView startPoint:self.point];
}

- (IBAction)outcatchAction:(id)sender {

}

- (NSMutableArray *)arrX{
    if(_arrX == nil){
        _arrX = [[NSMutableArray alloc]init];
    }
    return _arrX;
}
- (NSMutableArray *)arrY{
    if(_arrY == nil){
        _arrY = [[NSMutableArray alloc]init];
    }
    return _arrY;
}
- (NSMutableArray *)foods{
    if(_foods == nil){
        _foods = [[NSMutableArray alloc]init];
    }
    return _foods;
}
- (UIBarButtonItem *)rightItem{
    if(_rightItem == nil){
        _rightItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
    }
    return _rightItem;
}
- (UIButton *)rightBtn{
    if(_rightBtn == nil){
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.frame = CGRectMake(0, 0, 100 , 44);
        _rightBtn.titleLabel.font = [UIFont fontWithName:FontName size:21];
        [_rightBtn setTitleColor:[NSObject MatheSpider_colorWithHexString:@"#E4FF00"] forState:UIControlStateNormal];
        [_rightBtn setTitle:@"120s" forState:UIControlStateNormal];
    }
    return _rightBtn;
}
- (void)rightMusic{
    self.score = self.score + 100;
    self.navigationItem.title = [NSString stringWithFormat:@"%ld",self.score];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"MatheSpider_right.mp3" withExtension:nil];
    self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player1 play];
}
- (void)wrongMusic{
    NSInteger jiange = 3;
    if(self.type == 2){
        jiange = 5;
    }
    self.timerCount = self.timerCount - jiange;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"MatheSpider_wrong.mp3" withExtension:nil];
    self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player2 play];
}
- (UIImageView *)stone{
    if(_stone == nil){
        _stone = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ball"]];
        self.ballStartFrame = CGRectMake(-42.5, -42.5, 42.5, 42.5);
        _stone.frame = self.ballStartFrame;
    }
    return _stone;
}
- (NSMutableArray *)itemimages{
    if(_itemimages == nil){
        _itemimages = [[NSMutableArray alloc]initWithArray:@[@"food_1",@"food_2",@"food_3",@"food_4",@"food_5",@"food_6",@"food_2"]];
    }
    return _itemimages;
}
@end
