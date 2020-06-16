//
//  SmartNumber_GameViewController.m
//  SmartNumberOff
//
//  Created by zy on 2020/4/30.
//  Copyright © 2020 ximan. All rights reserved.
//

#import "SmartNumber_GameViewController.h"

@interface SmartNumber_GameViewController ()

@property(nonatomic,assign) NSInteger level;
@property(nonatomic,assign) NSInteger score;
@property(nonatomic,assign) NSInteger life;
@property(nonatomic,assign) NSInteger showTip;

@property (weak, nonatomic) IBOutlet UIImageView *prossbg;
@property (weak, nonatomic) IBOutlet UIView *prossView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightMargin;

@property (weak, nonatomic) IBOutlet UIImageView *startOne;
@property (weak, nonatomic) IBOutlet UIImageView *startTwo;
@property (weak, nonatomic) IBOutlet UIImageView *startThree;

@property (weak, nonatomic) IBOutlet UIButton *levelNumber;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UIButton *bttnOne;
@property (weak, nonatomic) IBOutlet UIButton *bttnTwo;
@property (weak, nonatomic) IBOutlet UIButton *bttnThree;
@property (weak, nonatomic) IBOutlet UIButton *bttnFour;

@property (nonatomic,strong) AVAudioPlayer *player1;
@property (nonatomic,strong) AVAudioPlayer *player2;
@property (nonatomic,strong) NSMutableArray *peopers;

@property(nonatomic,assign) NSInteger grade;
@property(nonatomic,assign) NSInteger rightAnswer;

@property (nonatomic,strong) NSMutableArray *numberOffs;
@property (nonatomic,strong) NSMutableArray *answerNumber;

@property (nonatomic,strong) NSTimer *runTimer;
@property (nonatomic,assign) NSInteger timerCount;

@property (nonatomic,strong) NSTimer *checkAnswer;
@property (nonatomic,assign) BOOL isAnswer;

@property (nonatomic,assign) NSInteger answerJianGe;
@property (nonatomic,assign) CGFloat magin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sliderTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tittleY;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *jiangeX;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *jiangeBottom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *chooseX;


@end

@implementation SmartNumber_GameViewController

- (instancetype)initWithLevel:(NSInteger)level score:(NSInteger)score life:(NSInteger)life showTip:(BOOL)showTip{
    if(self = [super init]){
        self.level = level;
        self.score = score;
        self.life = life;
        self.showTip = showTip;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.magin = -261;
    self.timerCount = 0;
    self.isAnswer = NO;
    
    [self setUI];
    [self setPeoper];
    
    self.runTimer = [NSTimer timerWithTimeInterval:1.5 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.runTimer forMode:NSDefaultRunLoopMode];
    [self.runTimer setFireDate:[NSDate distantFuture]];
    
    self.checkAnswer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(checkAnswerTimer) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.checkAnswer forMode:NSDefaultRunLoopMode];
    [self.checkAnswer setFireDate:[NSDate distantFuture]];
    
    if(self.showTip == YES){
        SmartNumber_ShoumingViewController *vc = [[SmartNumber_ShoumingViewController alloc]initTypeOK:^{
            SmartNumber_CountdownViewController *countDown = [[SmartNumber_CountdownViewController alloc]initWithBlock:^{
                [self SmartNumber_random];
            }];
            [self yc_bottomPresentController:countDown presentedHeight:Iphone_Height completeHandle:nil];
        }];
        [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
    }else{
        SmartNumber_CountdownViewController *countDown = [[SmartNumber_CountdownViewController alloc]initWithBlock:^{
            [self SmartNumber_random];
        }];
        [self yc_bottomPresentController:countDown presentedHeight:Iphone_Height completeHandle:nil];
    }
    
    SmartNumber_navigation *navigate = (SmartNumber_navigation *)self.navigationController;
    
    navigate.returnBlock = ^{
        if(self.runTimer != nil){
            [self.runTimer invalidate];
            self.runTimer = nil;
        }
        if(self.checkAnswer != nil){
            [self.checkAnswer invalidate];
            self.checkAnswer = nil;
        }
    };
    
    self.rightMargin.constant = self.magin;
    
    if kiPhone5 {
        self.sliderTop.constant = 3;
        self.tittleY.constant = 10;
        
        self.jiangeX.constant = 130;
        self.jiangeBottom.constant = -30;
        
        self.chooseX.constant = -60;
    }
}

- (void)jumpRightOrWrongWith:(NSString *)tittle{
    self.isAnswer = YES;
    
    NSInteger right = [tittle integerValue];
    if(self.rightAnswer == right){
        
        [self curentNumberWith:3];
       
        self.magin = 0;
        [UIView animateWithDuration:0.5 animations:^{
            self.rightMargin.constant = self.magin;
            [self.view layoutIfNeeded];
        }];
        [self.checkAnswer setFireDate:[NSDate distantFuture]];
        [self playrRight];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self SmartNumber_random];
        });

    }else{
        
        self.magin = -261;
        [UIView animateWithDuration:0.5 animations:^{
            self.rightMargin.constant = self.magin;
            [self.view layoutIfNeeded];
        }];
        
        [self.checkAnswer setFireDate:[NSDate distantFuture]];
        [self playrWrong];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self SmartNumber_random];
        });
    }
}

- (IBAction)answerOne:(UIButton *)buttion {
    NSString *tittle = [buttion titleForState:UIControlStateNormal];
    [self jumpRightOrWrongWith:tittle];
}

- (IBAction)answerTwo:(UIButton *)buttion {
    NSString *tittle = [buttion titleForState:UIControlStateNormal];
    [self jumpRightOrWrongWith:tittle];
}

- (IBAction)answerThree:(UIButton *)buttion {
    NSString *tittle = [buttion titleForState:UIControlStateNormal];
    [self jumpRightOrWrongWith:tittle];
}

- (IBAction)answerFour:(UIButton *)buttion {
    NSString *tittle = [buttion titleForState:UIControlStateNormal];
    [self jumpRightOrWrongWith:tittle];
}

- (void)setPeoper{
    
    CGFloat W = 136;
    CGFloat H = 180;
    NSInteger M = (Iphone_Width - W * 4)/5;
    CGFloat lastW = 136;
    CGFloat Top = 60;
    
    
    if kiPhone6Plus {
        lastW = 136;
    }
    if IS_IPHONE_X_orMore {
        lastW = 150;
    }
    
    if kiPhone5 {
        W = 136;
        H = 150;
        Top = 120;
    }
    
    NSMutableArray *arr = [[NSMutableArray alloc]initWithArray:@[@"0",@"1",@"2",@"3",@"4",@"5"]];
    NSMutableArray *peoper = [NSObject SmartNumber_getNewArrWithOldArr:arr count:4];
    
    for (int i = 0; i < 4; i++) {
        SmartNumber_ItemView *view = [SmartNumber_ItemView getSmartView];
        view.frame = CGRectMake(M + i * (W + M), Top, W, H);
        view.peppleImageView.image = [UIImage imageNamed:peoper[i]];
        view.tag = i;
        [self.peopers addObject:view];
        [self.view addSubview:view];
        if (i == 3){
            UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"marquee"]];
            [view addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(-3);
                make.width.mas_equalTo(lastW);
                make.bottom.mas_equalTo(3);
                if kiPhone5 {
                     make.height.mas_equalTo(H+10);
                }else{
                     make.top.mas_equalTo(-3);
                }
            }];
        }
    }
}

- (void)curentNumberWith:(NSInteger)count{
    
    for (SmartNumber_ItemView *item in self.peopers) {
        
        if(item.tag == count){
            
            [item.arrow setHidden:NO];
            [item.number setHidden:NO];
            NSNumber *num = self.numberOffs[item.tag];
            [item.number setTitle:[NSString stringWithFormat:@"%@",num] forState:UIControlStateNormal];
            
        }else{
            
            [item.arrow setHidden:YES];
            [item.number setHidden:YES];
            [item.number setTitle:@"" forState:UIControlStateNormal];
        }
    }
}

- (void)timerRun{

    if(self.timerCount == 3){
        
        [self.bttnOne setEnabled:YES];
        [self.bttnTwo setEnabled:YES];
        [self.bttnThree setEnabled:YES];
        [self.bttnFour setEnabled:YES];
        
        [self.runTimer setFireDate:[NSDate distantFuture]];
        [self.checkAnswer setFireDate:[NSDate date]];
        self.timerCount = 0;
        self.answerJianGe = 0;
        
    }else{
        
        [self curentNumberWith:self.timerCount];
        self.timerCount = self.timerCount + 1;
    
        self.magin = self.magin + 216/3;
        [UIView animateWithDuration:0.8 animations:^{
            self.rightMargin.constant = self.magin;
            [self.view layoutIfNeeded];
        }];
        
        [self.bttnOne setEnabled:NO];
        [self.bttnTwo setEnabled:NO];
        [self.bttnThree setEnabled:NO];
        [self.bttnFour setEnabled:NO];
    }
}


- (void)checkAnswerTimer{
    
    if(self.answerJianGe == 500){
       
       [self.checkAnswer setFireDate:[NSDate distantFuture]];
       [self playrWrong];
       self.answerJianGe = 0;
        
        
       self.magin = -261;
       [UIView animateWithDuration:0.5 animations:^{
            self.rightMargin.constant = self.magin;
            [self.view layoutIfNeeded];
       }];
        
       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self SmartNumber_random];
       });

    }else{
        self.answerJianGe = self.answerJianGe + 1;
    }
}


- (void)SmartNumber_random{
    
    self.magin = -261;
    self.rightMargin.constant = self.magin;
    
    self.isAnswer = NO;
    for (SmartNumber_ItemView *view in self.peopers) {
        [view.number setHidden:YES];
    }
    [self.numberOffs removeAllObjects];
    [self.answerNumber removeAllObjects];
    
    if(self.level == 1){
    
        self.grade = [NSObject SmartNumber_getRandomNumber:2 to:5];
        [self.levelNumber setTitle:[NSString stringWithFormat:@"everyone %ld",self.grade] forState:UIControlStateNormal];
        NSInteger start = [NSObject SmartNumber_getRandomNumber:5 to:10];
        NSInteger one = start + self.grade;
        NSInteger two = one + self.grade;
        NSInteger three = two + self.grade;
        NSInteger four = three + self.grade;
        self.rightAnswer = four;
        
        NSLog(@"==========================%ld",self.rightAnswer);
        
        [self.numberOffs addObject:@(one)];
        [self.numberOffs addObject:@(two)];
        [self.numberOffs addObject:@(three)];
        [self.numberOffs addObject:@(four)];
        
        do{
            NSInteger start = [NSObject SmartNumber_getRandomNumber:5 to:30];
            if(start != self.rightAnswer){
                [self.answerNumber addObject:@(start)];
            }
        }while (self.answerNumber.count < 3);
        [self.answerNumber addObject:@(self.rightAnswer)];
        
        NSMutableArray *newArr = [NSObject SmartNumber_randamArry:self.answerNumber];
        
        if(newArr.count == 4){
            [self.bttnOne setTitle:[NSString stringWithFormat:@"%@",newArr[0]] forState:UIControlStateNormal];
            [self.bttnTwo setTitle:[NSString stringWithFormat:@"%@",newArr[1]] forState:UIControlStateNormal];
            [self.bttnThree setTitle:[NSString stringWithFormat:@"%@",newArr[2]] forState:UIControlStateNormal];
            [self.bttnFour setTitle:[NSString stringWithFormat:@"%@",newArr[3]] forState:UIControlStateNormal];
        }
        
        NSMutableArray *arr = [[NSMutableArray alloc]initWithArray:@[@"0",@"1",@"2",@"3",@"4",@"5"]];
        NSMutableArray *peoper = [NSObject SmartNumber_getNewArrWithOldArr:arr count:4];
        
        for (int i = 0; i < peoper.count; i++) {
            SmartNumber_ItemView *view = self.peopers[i];
            view.peppleImageView.image = [UIImage imageNamed:peoper[i]];
        }
    }

    if(self.level == 2){
        
        self.grade = [NSObject SmartNumber_getRandomNumber:6 to:8];
        [self.levelNumber setTitle:[NSString stringWithFormat:@"everyone %ld",self.grade] forState:UIControlStateNormal];
        NSInteger start = [NSObject SmartNumber_getRandomNumber:5 to:10];
        NSInteger one = start + self.grade;
        NSInteger two = one + self.grade;
        NSInteger three = two + self.grade;
        NSInteger four = three + self.grade;
        self.rightAnswer = four;
        
        NSLog(@"==========================%ld",self.rightAnswer);
        
        [self.numberOffs addObject:@(one)];
        [self.numberOffs addObject:@(two)];
        [self.numberOffs addObject:@(three)];
        [self.numberOffs addObject:@(four)];
        
        do{
            NSInteger start = [NSObject SmartNumber_getRandomNumber:11 to:30];
            if(start != self.rightAnswer){
                [self.answerNumber addObject:@(start)];
            }
        }while (self.answerNumber.count < 3);
        [self.answerNumber addObject:@(self.rightAnswer)];
        
        NSMutableArray *newArr = [NSObject SmartNumber_randamArry:self.answerNumber];
        
        if(newArr.count == 4){
            [self.bttnOne setTitle:[NSString stringWithFormat:@"%@",newArr[0]] forState:UIControlStateNormal];
            [self.bttnTwo setTitle:[NSString stringWithFormat:@"%@",newArr[1]] forState:UIControlStateNormal];
            [self.bttnThree setTitle:[NSString stringWithFormat:@"%@",newArr[2]] forState:UIControlStateNormal];
            [self.bttnFour setTitle:[NSString stringWithFormat:@"%@",newArr[3]] forState:UIControlStateNormal];
        }
        
        NSMutableArray *arr = [[NSMutableArray alloc]initWithArray:@[@"0",@"1",@"2",@"3",@"4",@"5"]];
        NSMutableArray *peoper = [NSObject SmartNumber_getNewArrWithOldArr:arr count:4];
        
        for (int i = 0; i < peoper.count; i++) {
            SmartNumber_ItemView *view = self.peopers[i];
            view.peppleImageView.image = [UIImage imageNamed:peoper[i]];
        }
        
    }
    
    if(self.level == 3){
        
        self.grade = [NSObject SmartNumber_getRandomNumber:9 to:11];
        [self.levelNumber setTitle:[NSString stringWithFormat:@"everyone %ld",self.grade] forState:UIControlStateNormal];
        NSInteger start = [NSObject SmartNumber_getRandomNumber:5 to:10];
        NSInteger one = start + self.grade;
        NSInteger two = one + self.grade;
        NSInteger three = two + self.grade;
        NSInteger four = three + self.grade;
        self.rightAnswer = four;
        
        NSLog(@"==========================%ld",self.rightAnswer);
        
        [self.numberOffs addObject:@(one)];
        [self.numberOffs addObject:@(two)];
        [self.numberOffs addObject:@(three)];
        [self.numberOffs addObject:@(four)];
        
        do{
            NSInteger start = [NSObject SmartNumber_getRandomNumber:31 to:70];
            if(start != self.rightAnswer){
                [self.answerNumber addObject:@(start)];
            }
        }while (self.answerNumber.count < 3);
        [self.answerNumber addObject:@(self.rightAnswer)];
        
        NSMutableArray *newArr = [NSObject SmartNumber_randamArry:self.answerNumber];
        
        if(newArr.count == 4){
            [self.bttnOne setTitle:[NSString stringWithFormat:@"%@",newArr[0]] forState:UIControlStateNormal];
            [self.bttnTwo setTitle:[NSString stringWithFormat:@"%@",newArr[1]] forState:UIControlStateNormal];
            [self.bttnThree setTitle:[NSString stringWithFormat:@"%@",newArr[2]] forState:UIControlStateNormal];
            [self.bttnFour setTitle:[NSString stringWithFormat:@"%@",newArr[3]] forState:UIControlStateNormal];
        }
        
        NSMutableArray *arr = [[NSMutableArray alloc]initWithArray:@[@"0",@"1",@"2",@"3",@"4",@"5"]];
        NSMutableArray *peoper = [NSObject SmartNumber_getNewArrWithOldArr:arr count:4];
        
        for (int i = 0; i < peoper.count; i++) {
            SmartNumber_ItemView *view = self.peopers[i];
            view.peppleImageView.image = [UIImage imageNamed:peoper[i]];
        }
    }
    
    [self.runTimer setFireDate:[NSDate date]];
}

- (void)setUI{
    self.prossbg.layer.cornerRadius = 3;
    self.prossbg.layer.masksToBounds = YES;
    self.prossbg.layer.borderColor = [NSObject SmartNumber_colorWithHexString:@"#FBB03B"].CGColor;
    self.prossbg.layer.borderWidth = 1;
    self.prossView.layer.cornerRadius = 2.5;
    self.prossView.layer.masksToBounds = YES;
    self.rightMargin.constant = -262;
}

- (IBAction)questionAction:(id)sender {
    
    [self.checkAnswer setFireDate:[NSDate distantFuture]];
    [self.runTimer setFireDate:[NSDate distantFuture]];
    
    SmartNumber_ShoumingViewController *vc = [[SmartNumber_ShoumingViewController alloc]initTypeOK:^{
        [self.checkAnswer setFireDate:[NSDate date]];
        [self.runTimer setFireDate:[NSDate date]];
    }];
    [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
}

- (void)playrRight{
    
    self.score = self.score + 10;
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.score];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"SmartNumber_right.mp3" withExtension:nil];
    self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player1 play];
}

- (void)playrWrong{
    self.life = self.life - 1;
    [self SmartNumber_liftWith:self.life];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"SmartNumber_wrong.mp3" withExtension:nil];
    self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player2 play];
}

- (void)SmartNumber_liftWith:(NSUInteger)life{
    
    if(self.life == 3){
        
        [self.startOne setHidden:NO];
        [self.startTwo setHidden:NO];
        [self.startThree setHidden:NO];
        
    }else if (self.life == 2){
        
        [self.startOne setHidden:YES];
        [self.startTwo setHidden:NO];
        [self.startThree setHidden:NO];
        
    }else if (self.life == 1){
        
        [self.startOne setHidden:YES];
        [self.startTwo setHidden:YES];
        [self.startThree setHidden:NO];
        
    }else {
        
        [self.startOne setHidden:YES];
        [self.startTwo setHidden:YES];
        [self.startThree setHidden:YES];
        [self saveRecord];
        
        if(self.runTimer != nil){
            [self.runTimer invalidate];
            self.runTimer = nil;
        }
        if(self.checkAnswer != nil){
            [self.checkAnswer invalidate];
            self.checkAnswer = nil;
        }
        
        SmartNumber_GameOverViewController *overVc = [[SmartNumber_GameOverViewController alloc]initWithScore:self.score homeBlock:^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        } againBlock:^{
            [self.navigationController popToRootViewControllerAnimated:NO];
            NSString *string = [NSString stringWithFormat:@"%ld",self.level];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"SmartNumber_againJump" object:string];
        }];
        [self yc_bottomPresentController:overVc presentedHeight:Iphone_Height completeHandle:nil];
    }
}

- (void)saveRecord{
    if(self.level == 1){
        [NSObject SmartNumber_saveScore:self.score key:@"SmartNumber_simple"];
    }
    if(self.level == 2){
        [NSObject SmartNumber_saveScore:self.score key:@"SmartNumber_general"];
    }
    if(self.level == 3){
        [NSObject SmartNumber_saveScore:self.score key:@"SmartNumber_difficult"];
    }
}

- (NSMutableArray *)peopers{
    if(_peopers == nil){
       _peopers = [[NSMutableArray alloc]init];
    }
    return _peopers;
}
- (NSMutableArray *)numberOffs{
    if(_numberOffs == nil){
       _numberOffs = [[NSMutableArray alloc]init];
    }
    return _numberOffs;
}
- (NSMutableArray *)answerNumber{
    if(_answerNumber == nil){
       _answerNumber = [[NSMutableArray alloc]init];
    }
    return _answerNumber;
}

- (void)dealloc{
    if(self.runTimer != nil){
        [self.runTimer invalidate];
        self.runTimer = nil;
    }
    if(self.checkAnswer != nil){
        [self.checkAnswer invalidate];
        self.checkAnswer = nil;
    }
}

@end
