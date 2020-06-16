//
//  DEGamePage.m
//  DecryptionExperts
//
//  Created by luzhaoyang on 2020/4/14.
//  Copyright © 2020 weilingtou. All rights reserved.
//

#import "DEGamePage.h"

#define timeCount 300

@interface DEGamePage (){
    NSInteger tmptag;
}

@property (nonatomic,assign) NSInteger score;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic,strong) AVAudioPlayer *player1;
@property (nonatomic,strong) AVAudioPlayer *player2;

@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign) NSInteger timerCount;
@property (weak, nonatomic) IBOutlet UILabel *coutDownLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueText;

@property (nonatomic,strong) UIImageView *imageView1;

@property (nonatomic,strong) NSMutableArray *rightArr;
@property (nonatomic,strong) NSMutableArray *currentArr;

@property (nonatomic,assign) NSInteger type;
@property (nonatomic,assign) CGRect startFrame;

@property (nonatomic,assign) BOOL isShowTip;

@property(assign,nonatomic) CGFloat pointX;
@property(assign,nonatomic) CGFloat pointY;

@property (nonatomic,strong) NSMutableArray *cars;
@property (nonatomic,strong) NSMutableArray *carsFrames;
@property (nonatomic,strong) UIImageView *middleView;

@end

@implementation DEGamePage

- (instancetype)initWithLevel:(NSInteger)level isShowTip:(BOOL)isShowTip{
    if(self = [super init]){
        self.level = level;
        self.isShowTip = isShowTip;
    }
    return self;
}

- (void)dealloc{
    if(self.timer != nil){
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DENavigation *NA = (DENavigation *)self.navigationController;
    NA.backBlock = ^{
        if(self.timer != nil){
            [self.timer invalidate];
            self.timer = nil;
        }
        [self save];
    };

    if(self.isShowTip == YES){
        [self showTips];
    }
    
    self.score = 0;
    [self setScoreWith:self.score];
    self.timerCount = timeCount;
    self.coutDownLabel.text = [NSString stringWithFormat:@"%lds",self.timerCount];

    [self randomValue];
    [self layoutItem];
}

- (void)randomValue{
    [self.rightArr removeAllObjects];
    [self.currentArr removeAllObjects];
    
    self.type = [NSObject DEgetRandomNumber:0 to:1];
    
    NSInteger vaule;
    if(self.level == 1){
        
        if(self.type == 0){
            NSInteger left = [NSObject DEgetRandomNumber:30 to:99];
            NSInteger right = [NSObject DEgetRandomNumber:30 to:99];
            vaule = left + right;
            self.valueText.text = [NSString stringWithFormat:@"%ld",vaule];
            
            NSString *leftStr = [NSString stringWithFormat:@"%ld",left];
            NSString *rightStr = [NSString stringWithFormat:@"%ld",right];
            
            if(leftStr.length == 2){
                NSString *temp = nil;
                for(int i = 0; i < [leftStr length]; i++) {
                    temp = [leftStr substringWithRange:NSMakeRange(i, 1)];
                    [self.rightArr addObject:temp];
                }
            }
            if(rightStr.length == 2){
                NSString *temp = nil;
                for(int i = 0; i < [rightStr length]; i++) {
                    temp = [rightStr substringWithRange:NSMakeRange(i, 1)];
                    [self.rightArr addObject:temp];
                }
            }
            self.currentArr = [self randamArry:self.rightArr];
            
        }else{
            NSInteger left = [NSObject DEgetRandomNumber:60 to:99];
            NSInteger right = [NSObject DEgetRandomNumber:30 to:59];
            vaule = left - right;
            self.valueText.text = [NSString stringWithFormat:@"%ld",vaule];
            NSString *leftStr = [NSString stringWithFormat:@"%ld",left];
            NSString *rightStr = [NSString stringWithFormat:@"%ld",right];
            
            if(leftStr.length == 2){
                NSString *temp = nil;
                for(int i = 0; i < [leftStr length]; i++) {
                    temp = [leftStr substringWithRange:NSMakeRange(i, 1)];
                    [self.rightArr addObject:temp];
                }
            }
            if(rightStr.length == 2){
                NSString *temp = nil;
                for(int i = 0; i < [rightStr length]; i++) {
                    temp = [rightStr substringWithRange:NSMakeRange(i, 1)];
                    [self.rightArr addObject:temp];
                }
            }
            self.currentArr = [self randamArry:self.rightArr];
        }
    }
    
    else if (self.level == 2){
        
        if(self.type == 0){
            NSInteger left = [NSObject DEgetRandomNumber:101 to:199];
            NSInteger right = [NSObject DEgetRandomNumber:101 to:199];
            vaule = left + right;
            self.valueText.text = [NSString stringWithFormat:@"%ld",vaule];
            
            NSString *leftStr = [NSString stringWithFormat:@"%ld",left];
            NSString *rightStr = [NSString stringWithFormat:@"%ld",right];
            
            if(leftStr.length == 3){
                NSString *temp = nil;
                for(int i = 0; i < [leftStr length]; i++) {
                    temp = [leftStr substringWithRange:NSMakeRange(i, 1)];
                    [self.rightArr addObject:temp];
                }
            }
            if(rightStr.length == 3){
                NSString *temp = nil;
                for(int i = 0; i < [rightStr length]; i++) {
                    temp = [rightStr substringWithRange:NSMakeRange(i, 1)];
                    [self.rightArr addObject:temp];
                }
            }
            self.currentArr = [self randamArry:self.rightArr];
        }
        
        else{
            NSInteger left = [NSObject DEgetRandomNumber:150 to:199];
            NSInteger right = [NSObject DEgetRandomNumber:101 to:149];
            vaule = left - right;
            self.valueText.text = [NSString stringWithFormat:@"%ld",vaule];
            NSString *leftStr = [NSString stringWithFormat:@"%ld",left];
            NSString *rightStr = [NSString stringWithFormat:@"%ld",right];
            if(leftStr.length == 3){
                NSString *temp = nil;
                for(int i = 0; i < [leftStr length]; i++) {
                    temp = [leftStr substringWithRange:NSMakeRange(i, 1)];
                    [self.rightArr addObject:temp];
                }
            }
            if(rightStr.length == 3){
                NSString *temp = nil;
                for(int i = 0; i < [rightStr length]; i++) {
                    temp = [rightStr substringWithRange:NSMakeRange(i, 1)];
                    [self.rightArr addObject:temp];
                }
            }
            self.currentArr = [self randamArry:self.rightArr];
        }
    }
    
    else{
        if(self.type == 0){
            NSInteger left = [NSObject DEgetRandomNumber:201 to:499];
            NSInteger right = [NSObject DEgetRandomNumber:501 to:999];
            vaule = left + right;
            self.valueText.text = [NSString stringWithFormat:@"%ld",vaule];
            
            NSString *leftStr = [NSString stringWithFormat:@"%ld",left];
            NSString *rightStr = [NSString stringWithFormat:@"%ld",right];
            
            if(leftStr.length == 3){
                NSString *temp = nil;
                for(int i = 0; i < [leftStr length]; i++) {
                    temp = [leftStr substringWithRange:NSMakeRange(i, 1)];
                    [self.rightArr addObject:temp];
                }
            }
            if(rightStr.length == 3){
                NSString *temp = nil;
                for(int i = 0; i < [rightStr length]; i++) {
                    temp = [rightStr substringWithRange:NSMakeRange(i, 1)];
                    [self.rightArr addObject:temp];
                }
            }
            self.currentArr = [self randamArry:self.rightArr];
        }else{
            NSInteger left = [NSObject DEgetRandomNumber:501 to:999];
            NSInteger right = [NSObject DEgetRandomNumber:201 to:399];
            vaule = left - right;
            self.valueText.text = [NSString stringWithFormat:@"%ld",vaule];
            
            NSString *leftStr = [NSString stringWithFormat:@"%ld",left];
            NSString *rightStr = [NSString stringWithFormat:@"%ld",right];
            
            if(leftStr.length == 3){
                NSString *temp = nil;
                for(int i = 0; i < [leftStr length]; i++) {
                    temp = [leftStr substringWithRange:NSMakeRange(i, 1)];
                    [self.rightArr addObject:temp];
                }
            }
            if(rightStr.length == 3){
                NSString *temp = nil;
                for(int i = 0; i < [rightStr length]; i++) {
                    temp = [rightStr substringWithRange:NSMakeRange(i, 1)];
                    [self.rightArr addObject:temp];
                }
            }
            self.currentArr = [self randamArry:self.rightArr];
        }
    }
}


- (NSMutableArray * )randamArry:(NSMutableArray *)arry{
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

- (void)layoutItem{
    
    CGFloat W = 74;
    CGFloat H = 100;
    CGFloat M = 10;
    CGFloat topM = 64;
    
    if kiPhone5 {
        if(self.level == 2 || self.level == 3){
            M = 5;
        }
    }

    if(self.level == 1){
        CGFloat leftM = (Iphone_Width - (5 * W + M * (5 - 1)))/2;
        for (int i = 0; i<5; i++) {
            UIImageView *car = [[UIImageView alloc]init];
            CGRect frame = CGRectMake(leftM + i * (W + M), topM, W, H);
            car.frame = frame;
            car.userInteractionEnabled = YES;
            if(i == 2){
                if(self.type == 1){
                    car.image = [UIImage imageNamed:@"jian"];
                }else{
                    car.image = [UIImage imageNamed:@"add"];
                }
                car.contentMode = UIViewContentModeCenter;
                self.middleView = car;
            }else{
                car.image = [UIImage imageNamed:@"card"];
                UILabel *label = [[UILabel alloc]init];
                label.frame = CGRectMake(0, 0, W, H);
                if(i < 2){
                    label.text = self.currentArr[i];
                    car.tag = i;
                }
                if(i > 2){
                    label.text = self.currentArr[i-1];
                    car.tag = i - 1;
                }
                label.textColor = [NSObject DEcolorWithHexString:@"#4A4A4A"];
                label.font = [UIFont fontWithName:FontName size:30];
                label.textAlignment = NSTextAlignmentCenter;
                [car addSubview:label];
                [self setUpPan:car];
                [self.cars addObject:car];
                NSString *str = [NSString stringWithFormat:@"%@",NSStringFromCGRect(car.frame)];
                [self.carsFrames addObject:str];
            }
            [self.view addSubview:car];
        }
    }
    else if (self.level == 2 || self.level == 3){
        
        CGFloat leftM = (Iphone_Width - (7 * W + M * (7 - 1)))/2;
        for (int i = 0; i<7; i++) {
            UIImageView *car = [[UIImageView alloc]init];
            CGRect frame = CGRectMake(leftM + i * (W + M), topM, W, H);
            car.frame = frame;
            car.userInteractionEnabled = YES;
            
            if(i == 3){
                if(self.type == 1){
                    car.image = [UIImage imageNamed:@"jian"];
                }else{
                    car.image = [UIImage imageNamed:@"add"];
                }
                car.contentMode = UIViewContentModeCenter;
                self.middleView = car;
            }else{
                car.image = [UIImage imageNamed:@"card"];
                UILabel *label = [[UILabel alloc]init];
                label.frame = CGRectMake(0, 0, W, H);
                if(i < 3){
                    label.text = self.currentArr[i];
                    car.tag = i;
                }
                if(i > 3){
                    label.text = self.currentArr[i-1];
                    car.tag = i - 1;
                }
                label.textColor = [NSObject DEcolorWithHexString:@"#4A4A4A"];
                label.font = [UIFont fontWithName:FontName size:30];
                label.textAlignment = NSTextAlignmentCenter;
                [car addSubview:label];
                [self setUpPan:car];
                [self.cars addObject:car];
                NSString *str = [NSString stringWithFormat:@"%@",NSStringFromCGRect(car.frame)];
                [self.carsFrames addObject:str];
            }
            [self.view addSubview:car];
        }
    }
    else{
        
    }
}

- (void)setUpPan:(UIView *)view{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [view addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)pan{
    CGPoint translation = [pan translationInView:self.view];
    
    if (pan.state == UIGestureRecognizerStateBegan){
        pan.view.alpha = 0.7;
    }
    
    else if(pan.state == UIGestureRecognizerStateChanged){
      
        pan.view.center = CGPointMake(pan.view.center.x + translation.x,
                                      pan.view.center.y + translation.y);
        [pan setTranslation:CGPointZero inView:self.view];
        
        for (int i = 0; i< self.cars.count; i++){
            UIImageView *imageView = self.cars[i];
            NSString* tmprect = self.carsFrames[i];
            if (CGRectContainsPoint(CGRectFromString(tmprect), pan.view.center)){
                tmptag = imageView.tag;
                imageView.layer.borderWidth = 1;
                imageView.layer.borderColor = [[NSObject DEcolorWithHexString:@"#E5474C"] CGColor];
                imageView.layer.cornerRadius = 6;
                imageView.layer.masksToBounds = YES;
                return;
            }
            else{
                imageView.layer.borderWidth = 0;
                imageView.layer.borderColor = [[UIColor clearColor] CGColor];
            }
        }
    }
    
    else if (pan.state == UIGestureRecognizerStateEnded){
        pan.view.alpha = 1;
        [UIView animateWithDuration:0.2 animations:^{
            UIImageView *imageView = self.cars[self->tmptag];
            imageView.layer.borderWidth = 0;
            imageView.layer.borderColor = [[UIColor clearColor]CGColor];
        
            NSString * rect1 = self.carsFrames[imageView.tag];
            NSString * rect2 = self.carsFrames[pan.view.tag];
            
            pan.view.frame = CGRectFromString(rect1);
            imageView.frame = CGRectFromString(rect2);
            
            NSInteger tmp = pan.view.tag;
            pan.view.tag = self->tmptag;
            imageView.tag = tmp;
            [self.cars exchangeObjectAtIndex:pan.view.tag withObjectAtIndex:imageView.tag];
            
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for (UIImageView *imageView in self.cars) {
                for (UIView *view in imageView.subviews) {
                    if([view isKindOfClass:[UILabel class]]){
                        UILabel *label = (UILabel *)view;
                        [arr addObject:label.text];
                    }
                }
            }
            
            if(arr.count == 4){
                NSString *one = arr[0];
                NSString *two = arr[1];
                NSString *leftStr = [NSString stringWithFormat:@"%@%@",one,two];
                NSInteger left = [leftStr integerValue];
                
                NSString *three = arr[2];
                NSString *four = arr[3];
                NSString *rightStr = [NSString stringWithFormat:@"%@%@",three,four];
                NSInteger right = [rightStr integerValue];
                
                NSInteger vaule;
                if(self.type == 0){
                    vaule = left + right;
                }else{
                    vaule = left - right;
                }
                
                if([self.valueText.text integerValue] == vaule){
                    [self rightMusic];
                    for (int i = 0; i< self.cars.count; i++) {
                        UIImageView * btn = self.cars[i];
                        btn.layer.borderColor = [[UIColor clearColor]CGColor];
                        btn.layer.borderWidth = 0;
                    }
                    [self.cars removeAllObjects];
                    [self.carsFrames removeAllObjects];
                    [self.middleView removeFromSuperview];
                    [self randomValue];
                    [self layoutItem];
                }
            }
            
            else if (arr.count == 6){
                
                NSString *one = arr[0];
                NSString *two = arr[1];
                NSString *three = arr[2];
                NSString *leftStr = [NSString stringWithFormat:@"%@%@%@",one,two,three];
                NSInteger left = [leftStr integerValue];
                
                NSString *four = arr[3];
                NSString *five = arr[4];
                NSString *six = arr[5];
        
                NSString *rightStr = [NSString stringWithFormat:@"%@%@%@",four,five,six];
                NSInteger right = [rightStr integerValue];
                
                NSInteger vaule;
                if(self.type == 0){
                   vaule = left + right;
                }else{
                   vaule = left - right;
                }
                
               if([self.valueText.text integerValue] == vaule){
                   [self rightMusic];
                   for (int i = 0; i< self.cars.count; i++) {
                       UIImageView * btn = self.cars[i];
                       btn.layer.borderColor = [[UIColor clearColor]CGColor];
                       btn.layer.borderWidth = 0;
                   }
                   [self.cars removeAllObjects];
                   [self.carsFrames removeAllObjects];
                   [self.middleView removeFromSuperview];
                   [self randomValue];
                   [self layoutItem];
               }
            }
        
        } completion:^(BOOL finished) {
            for (int i = 0; i< self.cars.count; i++) {
                UIImageView * btn = self.cars[i];
                btn.layer.borderColor = [[UIColor clearColor]CGColor];
                btn.layer.borderWidth = 0;
            }
        }];
    }
}

- (void)showTips{
    DETipsPage *tip = [[DETipsPage alloc]initWithIKnow:^{
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerChange) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    }];
    [self yc_bottomPresentController:tip presentedHeight:Iphone_Height completeHandle:nil];
}

- (void)timerChange{
    if(self.timerCount < 0){
        self.timerCount = 0;
    }
    if(self.timerCount <= 0){
        if(self.timer != nil){
            [self.timer invalidate];
            self.timer = nil;
        }
        [self save];
        DEOverPage *over = [[DEOverPage alloc]initWithScore:self.score home:^{
            [self.navigationController popToRootViewControllerAnimated:NO];
        } again:^{
            [self.navigationController popToRootViewControllerAnimated:NO];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"gameAgain" object:[NSString stringWithFormat:@"%ld",self.level]];
        }];
        [self yc_bottomPresentController:over presentedHeight:Iphone_Height completeHandle:nil];
    }
    else{
        self.timerCount = self.timerCount - 1;
        self.coutDownLabel.text = [NSString stringWithFormat:@"%lds",self.timerCount];
    }
}


- (void)save{
    if(self.level == 1){
        [NSObject DEsaveScore:self.score key:@"DE_simple"];
    }else if (self.level == 2){
        [NSObject DEsaveScore:self.score key:@"DE_general"];
    }else{
        [NSObject DEsaveScore:self.score key:@"DE_difficult"];
    }
}


- (void)rightMusic{
    self.score = self.score + 100;
    [self setScoreWith:self.score];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"de_right_music.mp3" withExtension:nil];
    self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player1 play];
}

- (void)wrongMusic{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"de_wrong_music.mp3" withExtension:nil];
    self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player2 play];
}
- (void)setScoreWith:(NSInteger)score{
    self.navigationItem.title = [NSString stringWithFormat:@"%ld",score];
}

- (NSMutableArray *)rightArr{
    if(_rightArr == nil){
        _rightArr = [[NSMutableArray alloc]init];
    }
    return _rightArr;
}

- (NSMutableArray *)currentArr{
    if (_currentArr == nil) {
        _currentArr = [[NSMutableArray alloc]init];
    }
    return _currentArr;
}

- (NSMutableArray *)cars{
    if(_cars == nil){
        _cars = [[NSMutableArray alloc]init];
    }
    return _cars;
}
- (NSMutableArray *)carsFrames{
    if(_carsFrames == nil){
        _carsFrames = [[NSMutableArray alloc]init];
    }
    return _carsFrames;
}


@end
