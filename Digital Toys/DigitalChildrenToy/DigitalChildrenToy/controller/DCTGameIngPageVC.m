//
//  DCTGameIngPageVC.m
//  DigitalChildrenToy
//
//  Created by luzhaoyang on 2020/4/13.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import "DCTGameIngPageVC.h"

@interface DCTGameIngPageVC ()

@property (nonatomic,assign) NSInteger score;
@property (nonatomic,assign) NSInteger level;
@property (nonatomic,assign) NSInteger life;
@property (nonatomic,assign) NSInteger count;

@property (nonatomic,assign) NSInteger answerCount;

@property (nonatomic,strong) AVAudioPlayer *player1;
@property (nonatomic,strong) AVAudioPlayer *player2;

@property (weak, nonatomic) IBOutlet UIImageView *lifeOne;
@property (weak, nonatomic) IBOutlet UIImageView *lifeTwo;
@property (weak, nonatomic) IBOutlet UIImageView *lifeThree;

@property (weak, nonatomic) IBOutlet UIImageView *doubg;
@property (weak, nonatomic) IBOutlet UIView *bottombg;
@property (weak, nonatomic) IBOutlet UIView *topbg;

@property (weak, nonatomic) IBOutlet UIImageView *middleBg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomBgH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *middleH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsH;

@property (nonatomic,strong) NSMutableArray *topArr;
@property (nonatomic,strong) NSMutableArray *topVauleArr;
@property (nonatomic,strong) NSMutableArray *currentTopArr;
@property (nonatomic,strong) NSMutableArray *currentTopVauleArr;

@property (nonatomic,strong) NSMutableArray *topImages;
@property (nonatomic,strong) NSMutableArray *douImages;
 
@property (nonatomic,strong) NSMutableArray *sunxuArr;
@property (nonatomic,strong) NSMutableArray *rightAnswerArr;

@property (nonatomic,strong) NSTimer *timer;

@property (weak, nonatomic) IBOutlet UIImageView *tipimageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipBottom;

@property (weak, nonatomic) IBOutlet UIView *prossView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *WithLayout;
@property (nonatomic,assign) CGFloat lenth;

@property (nonatomic,strong) NSMutableArray *buttomBtns;
@property (weak, nonatomic) IBOutlet UIImageView *per;

@property (nonatomic,assign) BOOL isTip;

@end

@implementation DCTGameIngPageVC

- (instancetype)initWithLevel:(NSInteger)level isTip:(BOOL)isTip score:(NSInteger)score life:(NSInteger)life{
    if(self = [super init]){
        self.level = level;
        self.isTip = isTip;
        self.score = score;
        self.life = life;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.prossView.layer.cornerRadius = 3.5;
    self.prossView.layer.masksToBounds = YES;

    self.bottomBgH.constant = 0;
    self.middleH.constant = 113;
    
    if kiPhone5 {
        self.middleH.constant = 80;
    }else{
        
    }
    
    self.tipsH.constant = 41;
    self.bottomBgH.constant = 20;
    self.tipBottom.constant = 5;
    self.tipimageView.image = [UIImage imageNamed:@"tips-1"];

    self.answerCount = 0;
    [self setCountLabel];
    
    [self setScore:self.score];
    
    [self setLife:self.life];
    
    self.count = 0;
    self.sunxuArr = [self theOrder];
    
    [self random];
    [self layOutTop];
    [self layMiddle];
    
    self.rightAnswerArr = [self setRightAnswer];
    self.lenth =  198/([self toyCount] + 1);
    self.WithLayout.constant = 198;
    [self setScoreWith:self.score];
    
    [self.per setHidden:YES];
    
    if(self.isTip == YES){
        [self showTips];
    }else{
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerChange) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    }
    
    NSLog(@"%@",self.rightAnswerArr);
    
    DCTNavigation *navi = (DCTNavigation *)self.navigationController;
    navi.backBlock = ^{
        if(self.timer != nil){
            [self.timer invalidate];
            self.timer = nil;
        }
        [self saveAction];
    };
}

- (void)dealloc{
    if(self.timer != nil){
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (NSMutableArray *)setRightAnswer{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (NSNumber *num in self.sunxuArr) {
        UIButton *btn = self.douImages[[num integerValue]];
        [arr addObject:@(btn.tag)];
    }
    return arr;
}

- (void)setCountLabel{
    
}

- (void)random{
    while ([self.currentTopArr count] <  [self toyCount]) {
        int r = arc4random() % [self.topArr count];
        if([self.currentTopArr containsObject:[self.topArr objectAtIndex:r]] == NO){
            [self.currentTopArr addObject:[self.topArr objectAtIndex:r]];
        }
        if([self.currentTopVauleArr containsObject:[self.topVauleArr objectAtIndex:r]] == NO){
            [self.currentTopVauleArr addObject:[self.topVauleArr objectAtIndex:r]];
        }
    }
}

- (void)layOutTop{
    
    CGFloat W = 90;
    CGFloat H = 43;
    CGFloat M = 16;
    
    if kiPhone5 {
        W = 70;
        H = 33;
    }
    
    CGFloat leftM = (Iphone_Width - ([self toyCount] * W + M * ([self toyCount] - 1)))/2;
    
    for (int i = 0; i<self.currentTopArr.count; i++) {
        UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *imageName = self.currentTopArr[i];
        [view setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        view.frame = CGRectMake(leftM + i * (W + M), 0, W, H);
        [self.topbg addSubview:view];
        [view setTitle:[NSString stringWithFormat:@"=%d",i+1] forState:UIControlStateNormal];
        [view setTitleColor:[NSObject DCTcolorWithHexString:@"#FAD541"] forState:UIControlStateNormal];
        view.titleLabel.font = [UIFont fontWithName:FontName size:24];
        view.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, -20);
        if kiPhone5 {
            view.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, -15);
        }
        [self.topImages addObject:view];
    }
}

- (void)layMiddle{
    
    CGFloat W = 48;
    CGFloat H = 51;
    CGFloat M = 25;
    
    CGFloat height = (self.middleBg.frame.size.height-H);
    
    if kiPhone5 {
        height = (80-H);
    }
    
    CGFloat leftM = (self.middleBg.frame.size.width  - ([self toyCount] * W + M * ([self toyCount] - 1)))/2;
    
    for (int i = 0; i<self.currentTopVauleArr.count; i++) {
        UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *imageName = self.currentTopVauleArr[i];
        [view setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        view.frame = CGRectMake(leftM + i * (W + M), height/2, W, H);
        [self.middleBg addSubview:view];
        [self.douImages addObject:view];
        view.tag = i + 1;
    }
}


- (NSMutableArray *)theOrder{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    NSInteger count = [self toyCount];
    for (int i = 0 ; i < count ; i ++) {
        [arr addObject:@(i)];
    }
    NSMutableArray *newArr = [self getRandomArrFrome:arr];
    NSInteger ranm;
    do{
        ranm = [NSObject DCTgetRandomNumber:0 to: count-1];
    }while (ranm == [newArr.lastObject integerValue]);
        
    [newArr addObject:@(ranm)];
    
    return newArr;
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

- (void)douDong:(UIButton *)view{
    CAKeyframeAnimation  *keyAnima = [CAKeyframeAnimation animation];
    keyAnima.keyPath = @"transform.rotation";
    keyAnima.values = @[@(-angle2Radian(16)), @(angle2Radian(16)), @(-angle2Radian(16))];
    keyAnima.removedOnCompletion = NO;
    keyAnima.fillMode = kCAFillModeForwards;
    keyAnima.duration = 0.01;
    keyAnima.repeatCount = 50;
    [view.layer addAnimation:keyAnima forKey:nil];
}

- (void)layOutBottom{
    CGFloat W = 84;
    CGFloat H = 64;
    CGFloat M = 20;
    if kiPhone5 {
        W = 61;
        H = 41;
        M = 12;
    }
    
    CGFloat leftM = (Iphone_Width - ([self toyCount] * W + M * ([self toyCount] - 1)))/2;
    
    for (int i = 0; i<[self toyCount]; i++) {
        
        UIView *bg = [[UIView alloc]init];
        bg.frame = CGRectMake(leftM + i * (W + M), 0, W, H);
        
        UIImageView *imageViwe = [[UIImageView alloc]init];
        imageViwe.image = [UIImage imageNamed:@""];
        [bg addSubview:imageViwe];
        [imageViwe mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.mas_equalTo(30);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
        [self.bottombg addSubview:bg];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, W, H);
        [button setBackgroundImage:[UIImage imageNamed:@"answer_bg"] forState:UIControlStateNormal];
        [button setTitle:[NSString stringWithFormat:@"%d",i + 1] forState:UIControlStateNormal];
        [button setTitleColor:[NSObject DCTcolorWithHexString:@"#FAD541"] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont fontWithName:FontName size:24];
        [button addTarget:self action:@selector(clickAnswer:) forControlEvents:UIControlEventTouchUpInside];
        [bg addSubview:button];
        button.tag = i;
        [bg bringSubviewToFront:imageViwe];
        [self.buttomBtns addObject:bg];
    }
}

- (void)clickAnswer:(UIButton *)buttion{
    
    NSInteger curr = [[buttion titleForState:UIControlStateNormal] integerValue];
    self.answerCount = self.answerCount + 1;
    
    if(self.answerCount <= self.rightAnswerArr.count){
        NSNumber *num = self.rightAnswerArr[self.answerCount - 1];
        
        NSInteger numint = [num integerValue];
        if(numint == curr){
            [self rightMusic];
            [UIView animateWithDuration:0.7 animations:^{
                self.WithLayout.constant = self.WithLayout.constant + self.lenth;
                [self.view layoutIfNeeded];
            }];
            if (self.WithLayout.constant > 198){
                self.WithLayout.constant = 198;
            }
            
            UIView *views = self.buttomBtns[buttion.tag];
            [self.per setHidden:NO];
            for (UIView *view in views.subviews) {
                if([view isKindOfClass:[UIImageView class]]){
                    UIImageView *imageView = (UIImageView *)view;
                    imageView.image = [UIImage imageNamed:@"right"];
                }
            }
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                for (UIView *view in views.subviews) {
                    if([view isKindOfClass:[UIImageView class]]){
                        UIImageView *imageView = (UIImageView *)view;
                        imageView.image = [UIImage imageNamed:@""];
                    }
                }
                [self.per setHidden:YES];
            });
            
        }else{
            
            UIView *views = self.buttomBtns[buttion.tag];
            for (UIView *view in views.subviews) {
                if([view isKindOfClass:[UIImageView class]]){
                    UIImageView *imageView = (UIImageView *)view;
                    imageView.image = [UIImage imageNamed:@"wrong"];
                }
            }
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                for (UIView *view in views.subviews) {
                    if([view isKindOfClass:[UIImageView class]]){
                        UIImageView *imageView = (UIImageView *)view;
                        imageView.image = [UIImage imageNamed:@""];
                    }
                }
            });
            
            [self wrongMusic];
        }
        [self setCountLabel];
        
        if(self.answerCount == self.rightAnswerArr.count && self.life == 0){
            DCTGameOverPageVC *vc = [[DCTGameOverPageVC alloc]initWithScore:self.score home:^{
                [self.navigationController popToRootViewControllerAnimated:YES];
            } again:^{
                [self.navigationController popToRootViewControllerAnimated:NO];
                NSString *str = [NSString stringWithFormat:@"%ld=%@=%d=%d",self.level, @"0",0,3];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"gameAgain" object:str];
            }];
            [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
            [self saveAction];
        }
        
        if(self.answerCount == self.rightAnswerArr.count && self.life > 0){
            [self.navigationController popToRootViewControllerAnimated:NO];
            NSString *str = [NSString stringWithFormat:@"%ld=%@=%ld=%ld",self.level, @"0", self.score, self.life];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"gameAgain" object:str];
        }
    }
}

- (NSInteger)toyCount{
    if(self.level == 1){
        return 4;
    }else if (self.level == 2){
        return 5;
    }else{
        return 6;
    }
}

- (void)timerChange{
    if(self.count == self.sunxuArr.count){
        [self.timer invalidate];
        self.timer = nil;
        
        self.middleH.constant = 0;
        self.bottomBgH.constant = 64;
        self.tipsH.constant = 59;
        self.bottomLayout.constant = 50;
        self.tipBottom.constant = 50;
        self.tipimageView.image = [UIImage imageNamed:@"tips_2"];
        
        if kiPhone5 {
            self.tipBottom.constant = 10;
            self.bottomLayout.constant = 20;
        }
        
        [self layOutBottom];
        self.WithLayout.constant = 0;
    }
    else{
        NSNumber *number = self.sunxuArr[self.count];
        UIButton *tabtu = [self.douImages objectAtIndex:[number integerValue]];
        [self douDong:tabtu];
        self.count = self.count + 1;
        
        [UIView animateWithDuration:1 animations:^{
            self.WithLayout.constant = self.WithLayout.constant - self.lenth;
            [self.view layoutIfNeeded];
        }];
    }
}

- (void)showTips{
    DCTInstructionsPageVC *vc = [[DCTInstructionsPageVC alloc]initWithOKAction:^{
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerChange) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    }];
    [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
}

- (void)rightMusic{
    self.score = self.score + 100;
    self.navigationItem.title = [NSString stringWithFormat:@"%ld",self.score];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"dct_right_music.mp3" withExtension:nil];
    self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player1 play];
}

- (void)wrongMusic{
    self.life = self.life - 1;
    [self setSelfLiftWith:self.life];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"dct_wrong_music.mp3" withExtension:nil];
    self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player2 play];
}

- (void)setScoreWith:(NSInteger)score{
    self.navigationItem.title = [NSString stringWithFormat:@"%ld",score];
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
        
        DCTGameOverPageVC *vc = [[DCTGameOverPageVC alloc]initWithScore:self.score home:^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        } again:^{
            [self.navigationController popToRootViewControllerAnimated:NO];
            NSString *str = [NSString stringWithFormat:@"%ld=%@=%d=%d",self.level, @"0",0,3];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"gameAgain" object:str];
        }];
        [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
        [self saveAction];
    }
}

- (void)saveAction{
    if(self.level == 1){
        [NSObject DCTsaveScore:self.score key:@"DCT_easy"];
    }else if (self.level == 2){
        [NSObject DCTsaveScore:self.score key:@"DCT_general"];
    }else{
        [NSObject DCTsaveScore:self.score key:@"DCT_hard"];
    }
}

- (NSMutableArray *)topArr{
    if(_topArr == nil){
        _topArr = [[NSMutableArray alloc]init];
        for (int i = 0 ; i < 8; i++) {
            NSString *string = [NSString stringWithFormat:@"1_%d",i+1];
            [_topArr addObject:string];
        }
    }
    return _topArr;
}

- (NSMutableArray *)topVauleArr{
    if(_topVauleArr == nil){
       _topVauleArr = [[NSMutableArray alloc]init];
       for (int i = 0 ; i < 8; i++) {
           NSString *string = [NSString stringWithFormat:@"0_%d",i+1];
           [_topVauleArr addObject:string];
       }
    }
    return _topVauleArr;
}

- (NSMutableArray *)currentTopArr{
    if(_currentTopArr == nil){
        _currentTopArr = [[NSMutableArray alloc]init];
    }
    return _currentTopArr;
}

- (NSMutableArray *)currentTopVauleArr{
    if(_currentTopVauleArr == nil){
        _currentTopVauleArr = [[NSMutableArray alloc]init];
    }
    return _currentTopVauleArr;
}

- (NSMutableArray *)douImages{
    if(_douImages == nil){
        _douImages = [[NSMutableArray alloc]init];
    }
    return _douImages;
}

- (NSMutableArray *)topImages{
    if(_topImages == nil){
        _topImages = [[NSMutableArray alloc]init];
    }
    return _topImages;
}
- (NSMutableArray *)rightAnswerArr{
    if(_rightAnswerArr == nil){
        _rightAnswerArr = [[NSMutableArray alloc]init];
    }
    return _rightAnswerArr;
}
- (NSMutableArray *)buttomBtns{
    if(_buttomBtns == nil){
        _buttomBtns = [[NSMutableArray alloc]init];
    }
    return _buttomBtns;
}
@end


