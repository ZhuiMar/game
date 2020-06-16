//
//  CPGameCenterVC.m
//  ComparePlanes
//
//  Created by luzhaoyang on 2020/4/16.
//  Copyright © 2020 qingxiriver. All rights reserved.
//

#import "CPGameCenterVC.h"

#define MyCount 120

@interface CPGameCenterVC ()

@property(nonatomic, assign) NSInteger level;
@property(nonatomic, assign) NSInteger type;

@property(nonatomic, strong) UIBarButtonItem *right;
@property(nonatomic, strong) UIButton *scoreBtn;

@property(nonatomic, assign) NSInteger score;

@property(nonatomic, strong) WSRollView *wsRoll;

@property (weak, nonatomic) IBOutlet UILabel *miaoshu;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *middleBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UILabel *bottomlabel;
@property (weak, nonatomic) IBOutlet UIView *bottomLine;

@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign) NSInteger timerCount;

@property (nonatomic,assign) CGFloat startLocation;
@property (nonatomic,assign) CGFloat middelLocation;
@property (nonatomic,assign) CGFloat endLocation;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerLayout;

@property (weak, nonatomic) IBOutlet UIImageView *planA;
@property (weak, nonatomic) IBOutlet UIImageView *planB;
@property (weak, nonatomic) IBOutlet UIImageView *planC;

@property (weak, nonatomic) IBOutlet UILabel *A;
@property (weak, nonatomic) IBOutlet UILabel *B;
@property (weak, nonatomic) IBOutlet UILabel *C;

@property (weak, nonatomic) IBOutlet UIButton *ABtn;
@property (weak, nonatomic) IBOutlet UIButton *Btn;
@property (weak, nonatomic) IBOutlet UIButton *CBtn;

@property (nonatomic,strong) AVAudioPlayer *player1;
@property (nonatomic,strong) AVAudioPlayer *player2;
@property (nonatomic,strong) AVAudioPlayer *player3;

@property (nonatomic,assign) NSInteger rightAnswer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttomLayout;

@end

@implementation CPGameCenterVC

- (instancetype)initWithLevel:(NSInteger)level type:(NSInteger)type{
    if(self = [super init]){
        self.level = level;
        self.type = type;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.rightBarButtonItem = self.right;
    self.navigationItem.title = [NSString stringWithFormat:@"%ds",MyCount];
}

- (void)dealloc{
    if(self.wsRoll.rollTimer != nil){
        [self.wsRoll.rollTimer invalidate];
        self.wsRoll = nil;
    }
    if(self.timer != nil){
        [self.timer invalidate];
        self.timer = nil;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBgScroller];
    
    self.startLocation = -(Iphone_Width/2 + 115);
    self.middelLocation = 0.00;
    self.endLocation = Iphone_Width + 115;
    
    self.leftBtn.tag = 1;
    self.middleBtn.tag = 2;
    self.rightBtn.tag = 3;
   
    CPNavigation *na = (CPNavigation *)self.navigationController;
    na.backBlock = ^{
        if(self.wsRoll.rollTimer != nil){
            [self.wsRoll.rollTimer invalidate];
            self.wsRoll = nil;
        }
        if(self.timer != nil){
            [self.timer invalidate];
            self.timer = nil;
        }
        [self saveScore];
    };
    
    if kiPhone5 {
        self.bottomlabel.font = [UIFont fontWithName:FontName size:12];
    }
    
    if IS_IPHONE_X_orMore {
        self.buttomLayout.constant = 54;
    }

    [self.view sendSubviewToBack:self.wsRoll];
    
    self.timerCount = MyCount;
    [UIView  animateWithDuration:2 animations:^{
        self.centerLayout.constant = self.middelLocation;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self can];
        [self random];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    }];
    
    if(self.type == 1){
        self.miaoshu.text = @"Which plane has the\nmost passengers?";
        self.bottomlabel.text = @"The bigger the arithmetic answer,the more people";
        [self.leftBtn setTitle:@"A" forState:UIControlStateNormal];
        [self.middleBtn setTitle:@"B" forState:UIControlStateNormal];
        [self.rightBtn setTitle:@"C" forState:UIControlStateNormal];
    }else{
        self.miaoshu.text = @"Sort the number of aircraft";
        self.bottomlabel.text = @"Arrange the quantity from small to large";
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
        CPGameOverVC *over = [[CPGameOverVC alloc]initWithScore:self.score type:self.type home:^{
            [self.navigationController popToRootViewControllerAnimated:NO];
        } again:^{
            [self.navigationController popViewControllerAnimated:NO];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"gameAgain" object:[NSString stringWithFormat:@"%ld",self.level]];
        }];
        [self yc_bottomPresentController:over presentedHeight:Iphone_Height completeHandle:nil];
        [self saveScore];
    }
    else{
        self.timerCount = self.timerCount - 1;
        self.navigationItem.title = [NSString stringWithFormat:@"%lds",self.timerCount];
    }
}


- (void)saveScore{
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    CPScoreModel *coreModel = [[CPScoreModel alloc]init];
    coreModel.cp_type = [NSString stringWithFormat:@"%ld",self.type];
    coreModel.cp_level = [NSString stringWithFormat:@"%ld",self.level];
    coreModel.cp_score = [NSString stringWithFormat:@"%ld",self.score];
    [realm transactionWithBlock:^{
       [realm addObject:coreModel];
    }];
    RLMResults *results = [CPScoreModel allObjects];
    NSLog(@"%@",results);
}

- (void)can{
    [self.leftBtn setEnabled:YES];
    [self.middleBtn setEnabled:YES];
    [self.rightBtn setEnabled:YES];
}

- (void)notCan{
    [self.leftBtn setEnabled:NO];
    [self.middleBtn setEnabled:NO];
    [self.rightBtn setEnabled:NO];
}

- (void)ranmdImage{
    NSMutableArray *array = [[NSMutableArray alloc]initWithArray:@[@"1",@"2",@"3",@"4",@"",@"6"]];
    NSMutableArray *randomArray = [[NSMutableArray alloc] init];
    do{
        NSInteger index = [NSObject CPgetRandomNumber:0 to: 5];
        NSString *num = array[index];
        if([randomArray containsObject:num] == NO){
            [randomArray addObject:num];
        }
    }while (randomArray.count < 3);
    
    NSString *one = randomArray[0];
    NSString *two = randomArray[1];
    NSString *three = randomArray[2];
    
    self.planA.image = [UIImage imageNamed:one];
    self.planB.image = [UIImage imageNamed:two];
    self.planC.image = [UIImage imageNamed:three];
    
    if([one isEqualToString:@""] || [two isEqualToString:@""] || [three isEqualToString:@""] || randomArray.count < 3){
       self.planA.image = [UIImage imageNamed:@"1"];
       self.planB.image = [UIImage imageNamed:@"2"];
       self.planC.image = [UIImage imageNamed:@"3"];
    }
    NSLog(@"%@",randomArray);
}

- (IBAction)leftAction:(UIButton *)buttion {
    if(buttion.tag == self.rightAnswer){
        [self rightMusic];
    }else{
        [self wrongMusic];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [self flyRight];
    });
}
- (IBAction)middleAction:(UIButton *)buttion {
    if(buttion.tag == self.rightAnswer){
        [self rightMusic];
    }else{
        [self wrongMusic];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [self flyRight];
    });
}
- (IBAction)rightAction:(UIButton *)buttion {
    if(buttion.tag == self.rightAnswer){
        [self rightMusic];
    }else{
        [self wrongMusic];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [self flyRight];
    });
}

- (void)random{

        if(self.level == 1){
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            NSInteger vauleA;
            NSInteger faA = [NSObject CPgetRandomNumber:0 to: 1];
            if(faA == 0){ // jia
                NSInteger leftA = [NSObject CPgetRandomNumber:11 to: 29];
                NSInteger rightA = [NSObject CPgetRandomNumber:11 to: 29];
                NSString *str = [NSString stringWithFormat:@"%ld+%ld",leftA,rightA];
                self.A.text = str;
                vauleA = leftA + rightA;
            }else{
                NSInteger leftA = [NSObject CPgetRandomNumber:25 to: 49];
                NSInteger rightA = [NSObject CPgetRandomNumber:11 to: 24];
                NSString *str = [NSString stringWithFormat:@"%ld-%ld",leftA,rightA];
                self.A.text = str;
                vauleA = leftA - rightA;
            }
            [arr addObject:@(vauleA)];
            NSInteger vauleB;
            do{
                 NSInteger faB = [NSObject CPgetRandomNumber:0 to: 1];
                if(faB == 0){ // jia
                    NSInteger leftB = [NSObject CPgetRandomNumber:11 to: 29];
                    NSInteger rightB = [NSObject CPgetRandomNumber:11 to: 29];
                    NSString *str = [NSString stringWithFormat:@"%ld+%ld",leftB,rightB];
                    self.B.text = str;
                    vauleB = leftB + rightB;
                }else{
                    NSInteger leftB = [NSObject CPgetRandomNumber:25 to: 49];
                    NSInteger rightB = [NSObject CPgetRandomNumber:11 to: 24];
                    NSString *str = [NSString stringWithFormat:@"%ld-%ld",leftB,rightB];
                    self.B.text = str;
                    vauleB = leftB - rightB;
                }
            }while (vauleB == vauleA);
            [arr addObject:@(vauleB)];
            
            NSInteger vauleC;
            do{
                NSInteger faC = [NSObject CPgetRandomNumber:0 to: 1];
                if(faC == 0){ // jia
                    NSInteger leftC = [NSObject CPgetRandomNumber:11 to: 29];
                    NSInteger rightC = [NSObject CPgetRandomNumber:11 to: 29];
                    NSString *str = [NSString stringWithFormat:@"%ld+%ld",leftC, rightC];
                    self.C.text = str;
                    vauleC = leftC + rightC;
                }else{
                    NSInteger leftC = [NSObject CPgetRandomNumber:25 to: 49];
                    NSInteger rightC = [NSObject CPgetRandomNumber:11 to: 24];
                    NSString *str = [NSString stringWithFormat:@"%ld-%ld",leftC,rightC];
                    self.C.text = str;
                    vauleC = leftC - rightC;
                }
            }while (vauleC == vauleB || vauleC == vauleA);
            [arr addObject:@(vauleC)];
            
            if(self.type == 1){
                NSArray *result = [arr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                    return [obj2 compare:obj1];
                }];
                NSInteger kk = [result.firstObject integerValue];
                if(kk == vauleA){
                    self.rightAnswer = 1;
                }else if (kk == vauleB){
                    self.rightAnswer = 2;
                }else if (kk == vauleC){
                    self.rightAnswer = 3;
                }
                 NSLog(@"======>%ld",self.rightAnswer);
            }else{
                
                NSArray *result = [arr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                    return [obj1 compare:obj2];
                }];
                NSInteger one = [result[0] integerValue];
                NSInteger two = [result[1] integerValue];
                NSInteger three = [result[2] integerValue];
                
                NSString *xiao;
                if(one == vauleA){
                    xiao = @"A";
                }
                if(one == vauleB){
                    xiao = @"B";
                }
                if(one == vauleC){
                    xiao = @"C";
                }
                
                NSString *zhong;
                if(two == vauleA){
                    zhong = @"A";
                }
                if(two == vauleB){
                    zhong = @"B";
                }
                if(two == vauleC){
                    zhong = @"C";
                }
                
                NSString *da;
                if(three == vauleA){
                    da = @"A";
                }
                if(three == vauleB){
                    da = @"B";
                }
                if(three == vauleC){
                    da = @"C";
                }
                
                NSString *ringtStr = [NSString stringWithFormat:@"%@<%@<%@",xiao,zhong,da];
                self.rightAnswer = [NSObject CPgetRandomNumber:1 to: 3];
                if(self.rightAnswer == 1){
                    [self.leftBtn setTitle:ringtStr forState:UIControlStateNormal];
                    
                    NSArray *arr = [ringtStr componentsSeparatedByString:@"<"];
                    NSString *stringTwo;
                    do{
                        NSMutableArray *new = [self randamArry:arr];
                        stringTwo = [new componentsJoinedByString:@"<"];
                    }while([stringTwo isEqualToString:ringtStr]);
                    [self.middleBtn setTitle:stringTwo forState:UIControlStateNormal];
                    
                    NSString *stringThree;
                    do{
                        NSMutableArray *new = [self randamArry:arr];
                        stringThree = [new componentsJoinedByString:@"<"];
                    }while([stringThree isEqualToString:stringTwo] && [stringThree isEqualToString:ringtStr]);
                    [self.rightBtn setTitle:stringThree forState:UIControlStateNormal];
                }
                if(self.rightAnswer == 2){
                    [self.middleBtn setTitle:ringtStr forState:UIControlStateNormal];
                    NSArray *arr = [ringtStr componentsSeparatedByString:@"<"];
                    NSString *stringTwo;
                    do{
                        NSMutableArray *new = [self randamArry:arr];
                        stringTwo = [new componentsJoinedByString:@"<"];
                    }while([stringTwo isEqualToString:ringtStr]);
                    [self.leftBtn setTitle:stringTwo forState:UIControlStateNormal];
                    
                    NSString *stringThree;
                    do{
                        NSMutableArray *new = [self randamArry:arr];
                        stringThree = [new componentsJoinedByString:@"<"];
                    }while([stringThree isEqualToString:stringTwo] && [stringThree isEqualToString:ringtStr]);
                    [self.rightBtn setTitle:stringThree forState:UIControlStateNormal];
                }
                if(self.rightAnswer == 3){
                    [self.rightBtn setTitle:ringtStr forState:UIControlStateNormal];
                    NSArray *arr = [ringtStr componentsSeparatedByString:@"<"];
                    NSString *stringTwo;
                    do{
                        NSMutableArray *new = [self randamArry:arr];
                        stringTwo = [new componentsJoinedByString:@"<"];
                    }while([stringTwo isEqualToString:ringtStr]);
                    [self.leftBtn setTitle:stringTwo forState:UIControlStateNormal];
                    
                    NSString *stringThree;
                    do{
                        NSMutableArray *new = [self randamArry:arr];
                        stringThree = [new componentsJoinedByString:@"<"];
                    }while([stringThree isEqualToString:stringTwo] && [stringThree isEqualToString:ringtStr]);
                    [self.middleBtn setTitle:stringThree forState:UIControlStateNormal];
                }
                NSLog(@"======>%ld",self.rightAnswer);
            }
        }
    
    
    
        else if (self.level == 2){
            
            NSMutableArray *arr = [[NSMutableArray alloc]init];
             NSInteger vauleA;
             NSInteger faA = [NSObject CPgetRandomNumber:0 to: 1];
             if(faA == 0){ // jia
                 NSInteger leftA = [NSObject CPgetRandomNumber:101 to: 199];
                 NSInteger rightA = [NSObject CPgetRandomNumber:101 to: 199];
                 NSString *str = [NSString stringWithFormat:@"%ld+%ld",leftA,rightA];
                 self.A.text = str;
                 vauleA = leftA + rightA;
             }else{
                 NSInteger leftA = [NSObject CPgetRandomNumber:149 to:199];
                 NSInteger rightA = [NSObject CPgetRandomNumber:101 to: 149];
                 NSString *str = [NSString stringWithFormat:@"%ld-%ld",leftA,rightA];
                 self.A.text = str;
                 vauleA = leftA - rightA;
             }
             [arr addObject:@(vauleA)];
             
             NSInteger vauleB;
             do{
                 NSInteger faB = [NSObject CPgetRandomNumber:0 to: 1];
                 if(faB == 0){ // jia
                     NSInteger leftB = [NSObject CPgetRandomNumber:101 to: 199];
                     NSInteger rightB = [NSObject CPgetRandomNumber:101 to: 199];
                     NSString *str = [NSString stringWithFormat:@"%ld+%ld",leftB,rightB];
                     self.B.text = str;
                     vauleB = leftB + rightB;
                 }else{
                     NSInteger leftB = [NSObject CPgetRandomNumber:149 to: 199];
                     NSInteger rightB = [NSObject CPgetRandomNumber:101 to: 149];
                     NSString *str = [NSString stringWithFormat:@"%ld-%ld",leftB,rightB];
                     self.B.text = str;
                     vauleB = leftB - rightB;
                 }
             }while (vauleB == vauleA);
             [arr addObject:@(vauleB)];
             
             NSInteger vauleC;
             do{
                 NSInteger faC = [NSObject CPgetRandomNumber:0 to: 1];
                 if(faC == 0){ // jia
                     NSInteger leftC = [NSObject CPgetRandomNumber:101 to: 199];
                     NSInteger rightC = [NSObject CPgetRandomNumber:101 to: 199];
                     NSString *str = [NSString stringWithFormat:@"%ld+%ld",leftC, rightC];
                     self.C.text = str;
                     vauleC = leftC + rightC;
                 }else{
                     NSInteger leftC = [NSObject CPgetRandomNumber:149 to: 199];
                     NSInteger rightC = [NSObject CPgetRandomNumber:101 to: 149];
                     NSString *str = [NSString stringWithFormat:@"%ld-%ld",leftC,rightC];
                     self.C.text = str;
                     vauleC = leftC - rightC;
                 }
             }while (vauleC == vauleB || vauleC == vauleA);
             [arr addObject:@(vauleC)];
             
             if(self.type == 1){
                 NSArray *result = [arr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                     return [obj2 compare:obj1];
                 }];
                 NSInteger kk = [result.firstObject integerValue];
                 if(kk == vauleA){
                     self.rightAnswer = 1;
                 }else if (kk == vauleB){
                     self.rightAnswer = 2;
                 }else if (kk == vauleC){
                     self.rightAnswer = 3;
                 }
                 
                  NSLog(@"======>%ld",self.rightAnswer);
             }else{
                 
                 NSArray *result = [arr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                     return [obj1 compare:obj2];
                 }];
                 NSInteger one = [result[0] integerValue];
                 NSInteger two = [result[1] integerValue];
                 NSInteger three = [result[2] integerValue];
                 
                 NSString *xiao;
                 if(one == vauleA){
                     xiao = @"A";
                 }
                 if(one == vauleB){
                     xiao = @"B";
                 }
                 if(one == vauleC){
                     xiao = @"C";
                 }
                 
                 NSString *zhong;
                 if(two == vauleA){
                     zhong = @"A";
                 }
                 if(two == vauleB){
                     zhong = @"B";
                 }
                 if(two == vauleC){
                     zhong = @"C";
                 }
                 
                 NSString *da;
                 if(three == vauleA){
                     da = @"A";
                 }
                 if(three == vauleB){
                     da = @"B";
                 }
                 if(three == vauleC){
                     da = @"C";
                 }
                 
                 NSString *ringtStr = [NSString stringWithFormat:@"%@<%@<%@",xiao,zhong,da];
                 self.rightAnswer = [NSObject CPgetRandomNumber:1 to: 3];
                 if(self.rightAnswer == 1){
                     [self.leftBtn setTitle:ringtStr forState:UIControlStateNormal];
                     
                     NSArray *arr = [ringtStr componentsSeparatedByString:@"<"];
                     NSString *stringTwo;
                     do{
                         NSMutableArray *new = [self randamArry:arr];
                         stringTwo = [new componentsJoinedByString:@"<"];
                     }while([stringTwo isEqualToString:ringtStr]);
                     [self.middleBtn setTitle:stringTwo forState:UIControlStateNormal];
                     
                     NSString *stringThree;
                     do{
                         NSMutableArray *new = [self randamArry:arr];
                         stringThree = [new componentsJoinedByString:@"<"];
                     }while([stringThree isEqualToString:stringTwo] && [stringThree isEqualToString:ringtStr]);
                     [self.rightBtn setTitle:stringThree forState:UIControlStateNormal];
                 }
                 if(self.rightAnswer == 2){
                     [self.middleBtn setTitle:ringtStr forState:UIControlStateNormal];
                     NSArray *arr = [ringtStr componentsSeparatedByString:@"<"];
                     NSString *stringTwo;
                     do{
                         NSMutableArray *new = [self randamArry:arr];
                         stringTwo = [new componentsJoinedByString:@"<"];
                     }while([stringTwo isEqualToString:ringtStr]);
                     [self.leftBtn setTitle:stringTwo forState:UIControlStateNormal];
                     
                     NSString *stringThree;
                     do{
                         NSMutableArray *new = [self randamArry:arr];
                         stringThree = [new componentsJoinedByString:@"<"];
                     }while([stringThree isEqualToString:stringTwo] && [stringThree isEqualToString:ringtStr]);
                     [self.rightBtn setTitle:stringThree forState:UIControlStateNormal];
                 }
                 if(self.rightAnswer == 3){
                     [self.rightBtn setTitle:ringtStr forState:UIControlStateNormal];
                     NSArray *arr = [ringtStr componentsSeparatedByString:@"<"];
                     NSString *stringTwo;
                     do{
                         NSMutableArray *new = [self randamArry:arr];
                         stringTwo = [new componentsJoinedByString:@"<"];
                     }while([stringTwo isEqualToString:ringtStr]);
                     [self.leftBtn setTitle:stringTwo forState:UIControlStateNormal];
                     
                     NSString *stringThree;
                     do{
                         NSMutableArray *new = [self randamArry:arr];
                         stringThree = [new componentsJoinedByString:@"<"];
                     }while([stringThree isEqualToString:stringTwo] && [stringThree isEqualToString:ringtStr]);
                     [self.middleBtn setTitle:stringThree forState:UIControlStateNormal];
                 }
                 NSLog(@"======>%ld",self.rightAnswer);
             }
        }
    
    
    
    
        else if (self.level == 3){
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            NSInteger vauleA;
            NSInteger faA = [NSObject CPgetRandomNumber:0 to: 1];
            if(faA == 0){ // jia
                NSInteger leftA = [NSObject CPgetRandomNumber:301 to: 499];
                NSInteger rightA =  [NSObject CPgetRandomNumber:301 to: 499];
                NSString *str = [NSString stringWithFormat:@"%ld+%ld",leftA,rightA];
                self.A.text = str;
                vauleA = leftA + rightA;
            }else{
                NSInteger leftA = [NSObject CPgetRandomNumber:499 to: 999];
                NSInteger rightA = [NSObject CPgetRandomNumber:101 to: 498];
                NSString *str = [NSString stringWithFormat:@"%ld-%ld",leftA,rightA];
                self.A.text = str;
                vauleA = leftA - rightA;
            }
            [arr addObject:@(vauleA)];
            
            NSInteger vauleB;
            do{
                NSInteger faB = [NSObject CPgetRandomNumber:0 to: 1];
                if(faB == 0){ // jia
                    NSInteger leftB = [NSObject CPgetRandomNumber:301 to: 499];
                    NSInteger rightB =  [NSObject CPgetRandomNumber:301 to: 499];
                    NSString *str = [NSString stringWithFormat:@"%ld+%ld",leftB,rightB];
                    self.B.text = str;
                    vauleB = leftB + rightB;
                }else{
                    NSInteger leftB = [NSObject CPgetRandomNumber:499 to: 999];
                    NSInteger rightB = [NSObject CPgetRandomNumber:101 to: 498];
                    NSString *str = [NSString stringWithFormat:@"%ld-%ld",leftB,rightB];
                    self.B.text = str;
                    vauleB = leftB - rightB;
                }
            }while (vauleB == vauleA);
            [arr addObject:@(vauleB)];
            
            NSInteger vauleC;
            do{
                NSInteger faC = [NSObject CPgetRandomNumber:0 to: 1];
                if(faC == 0){ // jia
                    NSInteger leftC = [NSObject CPgetRandomNumber:301 to: 499];
                    NSInteger rightC =  [NSObject CPgetRandomNumber:301 to: 499];
                    NSString *str = [NSString stringWithFormat:@"%ld+%ld",leftC, rightC];
                    self.C.text = str;
                    vauleC = leftC + rightC;
                }else{
                    NSInteger leftC = [NSObject CPgetRandomNumber:499 to: 999];
                    NSInteger rightC = [NSObject CPgetRandomNumber:101 to: 498];
                    NSString *str = [NSString stringWithFormat:@"%ld-%ld",leftC,rightC];
                    self.C.text = str;
                    vauleC = leftC - rightC;
                }
            }while (vauleC == vauleB || vauleC == vauleA);
            [arr addObject:@(vauleC)];
            
            if(self.type == 1){
                NSArray *result = [arr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                    return [obj2 compare:obj1];
                }];
                NSInteger kk = [result.firstObject integerValue];
                if(kk == vauleA){
                    self.rightAnswer = 1;
                }else if (kk == vauleB){
                    self.rightAnswer = 2;
                }else if (kk == vauleC){
                    self.rightAnswer = 3;
                }
                 NSLog(@"======>%ld",self.rightAnswer);
            }else{
                
                NSArray *result = [arr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                    return [obj1 compare:obj2];
                }];
                NSInteger one = [result[0] integerValue];
                NSInteger two = [result[1] integerValue];
                NSInteger three = [result[2] integerValue];
                
                NSString *xiao;
                if(one == vauleA){
                    xiao = @"A";
                }
                if(one == vauleB){
                    xiao = @"B";
                }
                if(one == vauleC){
                    xiao = @"C";
                }
                
                NSString *zhong;
                if(two == vauleA){
                    zhong = @"A";
                }
                if(two == vauleB){
                    zhong = @"B";
                }
                if(two == vauleC){
                    zhong = @"C";
                }
                
                NSString *da;
                if(three == vauleA){
                    da = @"A";
                }
                if(three == vauleB){
                    da = @"B";
                }
                if(three == vauleC){
                    da = @"C";
                }
                
                NSString *ringtStr = [NSString stringWithFormat:@"%@<%@<%@",xiao,zhong,da];
                self.rightAnswer = [NSObject CPgetRandomNumber:1 to: 3];
                if(self.rightAnswer == 1){
                    [self.leftBtn setTitle:ringtStr forState:UIControlStateNormal];
                    
                    NSArray *arr = [ringtStr componentsSeparatedByString:@"<"];
                    NSString *stringTwo;
                    do{
                        NSMutableArray *new = [self randamArry:arr];
                        stringTwo = [new componentsJoinedByString:@"<"];
                    }while([stringTwo isEqualToString:ringtStr]);
                    [self.middleBtn setTitle:stringTwo forState:UIControlStateNormal];
                    
                    NSString *stringThree;
                    do{
                        NSMutableArray *new = [self randamArry:arr];
                        stringThree = [new componentsJoinedByString:@"<"];
                    }while([stringThree isEqualToString:stringTwo] && [stringThree isEqualToString:ringtStr]);
                    [self.rightBtn setTitle:stringThree forState:UIControlStateNormal];
                }
                if(self.rightAnswer == 2){
                    [self.middleBtn setTitle:ringtStr forState:UIControlStateNormal];
                    NSArray *arr = [ringtStr componentsSeparatedByString:@"<"];
                    NSString *stringTwo;
                    do{
                        NSMutableArray *new = [self randamArry:arr];
                        stringTwo = [new componentsJoinedByString:@"<"];
                    }while([stringTwo isEqualToString:ringtStr]);
                    [self.leftBtn setTitle:stringTwo forState:UIControlStateNormal];
                    
                    NSString *stringThree;
                    do{
                        NSMutableArray *new = [self randamArry:arr];
                        stringThree = [new componentsJoinedByString:@"<"];
                    }while([stringThree isEqualToString:stringTwo] && [stringThree isEqualToString:ringtStr]);
                    [self.rightBtn setTitle:stringThree forState:UIControlStateNormal];
                }
                if(self.rightAnswer == 3){
                    [self.rightBtn setTitle:ringtStr forState:UIControlStateNormal];
                    NSArray *arr = [ringtStr componentsSeparatedByString:@"<"];
                    NSString *stringTwo;
                    do{
                        NSMutableArray *new = [self randamArry:arr];
                        stringTwo = [new componentsJoinedByString:@"<"];
                    }while([stringTwo isEqualToString:ringtStr]);
                    [self.leftBtn setTitle:stringTwo forState:UIControlStateNormal];
                    
                    NSString *stringThree;
                    do{
                        NSMutableArray *new = [self randamArry:arr];
                        stringThree = [new componentsJoinedByString:@"<"];
                    }while([stringThree isEqualToString:stringTwo] && [stringThree isEqualToString:ringtStr]);
                    [self.middleBtn setTitle:stringThree forState:UIControlStateNormal];
                }
                NSLog(@"======>%ld",self.rightAnswer);
            }
        }
    
   
}

- (void)flyMiddle{
    [UIView animateWithDuration:1 animations:^{
        self.centerLayout.constant = self.middelLocation;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self can];
        [self random];
    }];
}
- (void)flyRight{
    [self notCan];
    [self flyMusic];
    [UIView animateWithDuration:1 animations:^{
        self.centerLayout.constant = self.endLocation;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.001 animations:^{
            self.centerLayout.constant = self.startLocation;
            [self.view layoutIfNeeded];
        }];
        [self ranmdImage];
        [self flyMiddle];
    }];
}

- (void)rightMusic{
    self.score = self.score + 100;
    [self.scoreBtn setTitle:[NSString stringWithFormat:@"%ld",self.score] forState:UIControlStateNormal];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"cp_right_music.mp3" withExtension:nil];
    self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player1 play];
}
- (void)wrongMusic{
    self.timerCount = self.timerCount - 5;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"cp_wrong_music.mp3" withExtension:nil];
    self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player2 play];
}
- (void)flyMusic{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"cp_fei_music.mp3" withExtension:nil];
    self.player3 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player3 play];
}

- (void)setBgScroller{
    self.wsRoll = [[WSRollView alloc]initWithFrame:CGRectMake(0, 0, Iphone_Width,Iphone_Height )];
    self.wsRoll.backgroundColor = [UIColor whiteColor];
    self.wsRoll.timeInterval = 0.005;
    self.wsRoll.rollSpace = 0.3;
    self.wsRoll.image = [UIImage imageNamed:@"background"];
    [self.wsRoll startRoll];
    [self.view addSubview:self.wsRoll];
}
- (UIButton *)scoreBtn{
    if(_scoreBtn == nil){
        _scoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _scoreBtn.frame = CGRectMake(0, 0, 100, 44);
        _scoreBtn.titleLabel.font = [UIFont fontWithName:FontName size:24];
        _scoreBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [_scoreBtn setTitleColor:[NSObject CPcolorWithHexString:@"#F3430C"] forState:UIControlStateNormal];
        [_scoreBtn setTitle:@"0" forState:UIControlStateNormal];
    }
    return _scoreBtn;
}
- (UIBarButtonItem *)right{
    if(_right == nil){
      _right = [[UIBarButtonItem alloc]initWithCustomView:self.scoreBtn];
    }
    return _right;
}
- (NSMutableArray *)randamArry:(NSArray *)arry{
    NSMutableArray *newArr = [NSMutableArray new];
    arry = [arry sortedArrayUsingComparator:^NSComparisonResult(NSString *str1, NSString *str2) {
        int seed = arc4random_uniform(2);
        if (seed) {
            return [str1 compare:str2];
        } else {
            return [str2 compare:str1];
        }
    }];
    for (NSString *str in arry) {
        [newArr addObject:str];
    }
    return newArr;
}
@end
