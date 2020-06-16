//
//  MysteryBoard_GameVC.m
//  MysteryBoard
//
//  Created by luzhaoyang on 2020/4/22.
//  Copyright © 2020 wansheng. All rights reserved.
//

#import "MysteryBoard_GameVC.h"



@interface MysteryBoard_GameVC ()

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;

@property(nonatomic, assign)NSInteger level;
@property(nonatomic, assign)NSInteger score;
@property(nonatomic, assign)NSInteger lenght;
@property(nonatomic, copy)NSString *curTitle;

@property (nonatomic,strong) NSMutableArray *datas;
@property (nonatomic,strong) NSMutableArray *ColorDatas;
@property (nonatomic,strong) NSMutableArray *FruitDatas;
@property (nonatomic,strong) NSMutableArray *AnimalDatas;

@property (nonatomic,strong) NSMutableArray *chars;
@property (nonatomic,strong) NSMutableArray *questionChars;
@property (nonatomic,strong) NSMutableArray *answerChars;

@property (nonatomic,strong) NSMutableArray *answerItems;
@property (nonatomic,strong) NSMutableArray *questionItems;

@property (nonatomic,strong) NSMutableArray *itemFrames;

@property (weak, nonatomic) IBOutlet UIImageView *topimageView;

@property (nonatomic,strong) AVAudioPlayer *player;
@property (nonatomic,strong) AVAudioPlayer *player1;
@property (nonatomic,strong) AVAudioPlayer *player2;

@property (nonatomic,strong) NSMutableArray *questionFrames;

@property(nonatomic, assign)NSInteger qustionCount;
@property(nonatomic, assign)NSInteger totalCount;

@property(nonatomic, strong)NSMutableArray *currentAnswer;
@end

@implementation MysteryBoard_GameVC

- (instancetype)initWithLevel:(NSInteger)level{
    if(self = [super init]){
        self.level = level;
    }
    return self;
}
 
- (void)charsWith:(NSString *)tittle{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (int i = 0; i<tittle.length; i++) {
        NSString *string = [tittle substringWithRange:NSMakeRange(i, 1)];
        [arr addObject:string];
    }
    NSLog(@"%@",arr);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.score = 0;
    self.qustionCount = 0;
    
    if(self.level == 1){
        self.totalCount = 10;
    }else{
        self.totalCount = 20;
    }
    
    self.navigationItem.title = [NSString stringWithFormat:@"%ld/%ld",self.score,self.totalCount];
    self.bgView.layer.cornerRadius = 20;
    self.bgView.layer.masksToBounds = YES;
    self.bgView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    
    if iPhoneX_MORE {
        self.topLayout.constant = 88;
    }

    [self randomAnswer];
    [self ramdom];
}


- (void)ramdom{
    
    [self.currentAnswer removeAllObjects];
    NSInteger index = [NSObject MysteryBoard_getRandomNumber:0 to:self.datas.count-1];
    self.curTitle = self.datas[index];
    self.lenght = self.curTitle.length;
    
    NSMutableArray *arrNew = [[NSMutableArray alloc]init];
    for (int i = 0; i< self.lenght; i++) {
        NSString *str = [NSString stringWithString:@""];
        [arrNew addObject:str];
    }
    
    self.currentAnswer = arrNew;
    
    for (UIButton *buttion in self.questionItems) {
        [buttion removeFromSuperview];
    }

    [self.questionFrames removeAllObjects];
    [self.questionItems removeAllObjects];
    [self randomQuestion];
    for (UIImageView *view in self.answerItems) {
        [view setHidden:NO];
    }
    
    if([self.curTitle isEqualToString:@"red"]){
        self.topimageView.backgroundColor = [UIColor redColor];
        self.topimageView.image = [UIImage imageNamed:@""];
    }else if([self.curTitle isEqualToString:@"white"]){
        self.topimageView.backgroundColor = [UIColor whiteColor];
        self.topimageView.image = [UIImage imageNamed:@""];
    }else if([self.curTitle isEqualToString:@"yellow"]){
        self.topimageView.backgroundColor = [UIColor yellowColor];
        self.topimageView.image = [UIImage imageNamed:@""];
    }else if([self.curTitle isEqualToString:@"green"]){
        self.topimageView.backgroundColor = [UIColor greenColor];
        self.topimageView.image = [UIImage imageNamed:@""];
    }else if([self.curTitle isEqualToString:@"blue"]){
        self.topimageView.backgroundColor = [UIColor blueColor];
        self.topimageView.image = [UIImage imageNamed:@""];
    }else if([self.curTitle isEqualToString:@"purple"]){
        self.topimageView.backgroundColor = [UIColor purpleColor];
        self.topimageView.image = [UIImage imageNamed:@""];
    }else if([self.curTitle isEqualToString:@"cyan"]){
        self.topimageView.backgroundColor = [UIColor cyanColor];
        self.topimageView.image = [UIImage imageNamed:@""];
    }else if([self.curTitle isEqualToString:@"gray"]){
        self.topimageView.backgroundColor = [UIColor grayColor];
        self.topimageView.image = [UIImage imageNamed:@""];
    }else{
        self.topimageView.backgroundColor = [UIColor clearColor];
        self.topimageView.image = [UIImage imageNamed:self.curTitle];
    }
    
    NSMutableArray *temp = [[NSMutableArray alloc]init];
    NSMutableArray *arr = [NSObject MysteryBoard_charsWithString:self.curTitle];
    for (NSString *string in arr) {
        [temp addObject:string];
    }
    
    NSMutableArray *guodu = [[NSMutableArray alloc]init];
    for (NSString *string in self.chars) {
        [guodu addObject:string];
    }
    
    for (int i = 0; i < temp.count; i++) {
        NSString *st = temp[i];
        if([guodu containsObject:st]){
            [guodu removeObject:st];
        }
    }
    
    NSInteger count = 16 - arr.count;
    NSMutableArray *arr1 = [NSObject MysteryBoard_getNewArrWithOldArr:guodu count:count];
    
    for (NSString *string in arr1) {
        [temp addObject:string];
    }
    NSMutableArray *new = [NSObject MysteryBoard_randamArry:temp];
    self.answerChars = [NSObject MysteryBoard_uppercaseStringWithChars:[NSObject MysteryBoard_randamArry:new]];
    self.questionChars = [NSObject MysteryBoard_uppercaseStringWithChars:arr];
    
    NSLog(@"curTitle =========>%@",self.curTitle);
    NSLog(@"answerChars =========>%@",self.answerChars);
    NSLog(@"questionChars =========>%@",self.questionChars);
    
    for (int i = 0; i<self.answerChars.count; i++) {
        UIImageView *item = self.answerItems[i];
        UILabel *label = [[UILabel alloc]init];
        for (UIView *view in item.subviews) {
            if([view isKindOfClass:[UILabel class]]){
                label = (UILabel *)view;
            }
        }
        label.text = self.answerChars[i];
    }
}


- (void)randomQuestion{
    CGFloat Marg = 3;
    CGFloat width = 51;
    CGFloat height = 46;
    
    if iPhone5 {
        width = 45;
        height = 41;
    }
    
    CGFloat leftM = (Iphone_Width - (width * self.lenght) - ((self.lenght - 1) * Marg))/2 - self.lenght * 2;
    
    for (int i = 0; i<self.lenght; i++) {
        CGRect frame = CGRectMake(leftM + i * (width + Marg), 140, width, height);
        UIButton *butn = [UIButton buttonWithType:UIButtonTypeCustom];
        butn.frame = frame;
        [butn setBackgroundImage:[UIImage imageNamed:@"box"] forState:UIControlStateNormal];
        butn.titleLabel.font = [UIFont fontWithName:FontName size:24];
        [butn setTitleColor:[NSObject MysteryBoard_colorWithHexString:@"#FA4C29"] forState:UIControlStateNormal];
        [self.bgView addSubview:butn];
        [self.questionItems addObject:butn];
        NSString *str = [NSString stringWithFormat:@"%@",NSStringFromCGRect(frame)];
        [self.questionFrames addObject:str];
        [self.bgView sendSubviewToBack:butn];
    }
}

- (void)randomAnswer{
    
    CGFloat TOP = 230;
    if iPhone5 {
        TOP = 195;
    }
    
    CGFloat bgWidth = Iphone_Width-20-30;
    
    NSInteger hong = 4;
    NSInteger lie = 4;
    CGFloat width = (bgWidth- 6)/4;
    CGFloat height = width;
    
    for (int i = 0; i<hong*lie; i++) {
        
        NSInteger row = i / lie;
        NSInteger col = i % lie;
        CGRect frame = CGRectMake(15 + (width + 2) * row, TOP + (height + 2) * col, width, height);
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = frame;
        imageView.image = [UIImage imageNamed:@"box_2"];
        [self.bgView addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        
        UIImageView *top = [[UIImageView alloc]init];
        top.userInteractionEnabled = YES;
        top.frame = frame;
        top.image = [UIImage imageNamed:@"box_1"];
        [self.bgView addSubview:top];
        
        UILabel *label = [[UILabel alloc]init];
        label.textColor = [NSObject MysteryBoard_colorWithHexString:@"#FA4C29"];
        label.font = [UIFont fontWithName:FontName size:35];
        label.textAlignment = NSTextAlignmentCenter;
        [top addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.left.right.mas_equalTo(0);
        }];
    
        [self setUpPan:top];
        [self.answerItems addObject:top];
        
        NSString *str = [NSString stringWithFormat:@"%@",NSStringFromCGRect(top.frame)];
        [self.itemFrames addObject:str];
        top.tag = i;
    }
}

- (void)setUpPan:(UIView *)view{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [view addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)pan{
    
    CGPoint translation = [pan translationInView:self.view];

    if (pan.state == UIGestureRecognizerStateBegan){
        [UIView animateWithDuration:0.3 animations:^{
            pan.view.transform = CGAffineTransformMakeScale(0.4, 0.4);
        }];
    }

    else if(pan.state == UIGestureRecognizerStateChanged){
        pan.view.center = CGPointMake(pan.view.center.x + translation.x,
                                      pan.view.center.y + translation.y);
        [pan setTranslation:CGPointZero inView:self.view];
        
    }
    else if (pan.state == UIGestureRecognizerStateEnded){
       
        for (int i = 0; i<self.questionItems.count; i++) {
            
            UIButton *question = self.questionItems[i];
            NSString *string = self.questionFrames[i];
            
            if (CGRectContainsPoint(CGRectFromString(string), pan.view.center)){
                UILabel *imageLabel = [[UILabel alloc]init];
                for (UIView *view in pan.view.subviews) {
                    if([view isKindOfClass:[UILabel class]]){
                        imageLabel = (UILabel *)view;
                    }
                }
                [question setTitle:imageLabel.text forState:UIControlStateNormal];
                [pan.view setHidden:YES];
                [self music];
                [self.currentAnswer replaceObjectAtIndex:i withObject:imageLabel.text];
                break;
            }
        }
        
        pan.view.transform = CGAffineTransformMakeScale(1, 1);
        CGRect frame = CGRectFromString(self.itemFrames[pan.view.tag]);
        pan.view.frame = frame;
    
        [self rightOrWrong];
    }
}

- (void)rightOrWrong{
    
    if(self.currentAnswer.count == self.curTitle.length && [self.currentAnswer containsObject:@""] == NO){
    
        self.qustionCount = self.qustionCount + 1;
        NSString *curstr = [self.currentAnswer componentsJoinedByString:@""];
        NSString *rightStr = [self.questionChars componentsJoinedByString:@""];
        if([curstr isEqualToString:rightStr]){
            self.score = self.score + 1;
            self.navigationItem.title = [NSString stringWithFormat:@"%ld/%ld",self.score, self.totalCount];
            [self right];
        }else{
            [self wrong];
        }
        
        if(self.qustionCount == self.totalCount){
            MysteryBoard_OverVC *vc = [[MysteryBoard_OverVC alloc]initWithScore:self.score totalCount:self.totalCount home:^{
                [self.navigationController popViewControllerAnimated:YES];
            } again:^{
                [self.navigationController popViewControllerAnimated:NO];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"MysteryBoard_gameAgain" object:[NSString stringWithFormat:@"%ld",self.level]];
            }];
            [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
        }else{
            [self ramdom];
        }
    }
}

- (NSMutableArray *)datas{
    if(_datas == nil){
        
        NSNumber *count = [[NSUserDefaults standardUserDefaults] objectForKey:@"MysteryBoard_star"];
        if(count == nil){
            
            NSArray *arr = @[@"red",@"white",@"yellow",@"green",@"blue",@"purple",@"cyan",@"gray",
                           @"apple",@"banana",@"cherry",@"grape",@"lemon",@"mango",@"orange",
                             @"pear"];
            NSMutableArray *new = [NSObject MysteryBoard_randamArry:arr];
            NSArray *lastArr = [NSObject MysteryBoard_getNewArrWithOldArr:new count:10];
            _datas = [[NSMutableArray alloc]initWithArray:lastArr];
            
        }else{
            
            NSInteger COUNT = [count integerValue];
            if(COUNT >= 20){
                NSArray *arr = @[@"red",@"white",@"yellow",@"green",@"blue",@"purple",@"cyan",@"gray",
                               @"apple",@"banana",@"cherry",@"grape",@"lemon",@"mango",@"orange",
                                 @"pear",@"bear",@"bird",@"cat",@"dolphin",@"monkey",@"panda",@"pig",@"tiger"];
                NSMutableArray *new = [NSObject MysteryBoard_randamArry:arr];
                NSArray *lastArr = [NSObject MysteryBoard_getNewArrWithOldArr:new count:10];
                _datas = [[NSMutableArray alloc]initWithArray:lastArr];
            }else{
                NSArray *arr = @[@"red",@"white",@"yellow",@"green",@"blue",@"purple",@"cyan",@"gray",
                               @"apple",@"banana",@"cherry",@"grape",@"lemon",@"mango",@"orange",
                                 @"pear"];
                NSMutableArray *new = [NSObject MysteryBoard_randamArry:arr];
                NSArray *lastArr = [NSObject MysteryBoard_getNewArrWithOldArr:new count:10];
                _datas = [[NSMutableArray alloc]initWithArray:lastArr];
            }
        }
    }
    return _datas;
}
 
- (NSMutableArray *)chars{
    if(_chars == nil){
        NSArray *cha = @[@"q",@"w",@"e",@"r",@"t",@"y",@"u",@"i",@"o",@"p",@"a",@"s",@"d",@"f",@"g",@"h",@"j",@"k",@"l",@"z",@"x",@"c",@"v",@"b",@"n",@"m"];
        _chars = [[NSMutableArray alloc]initWithArray:cha];
    }
    return _chars;
}
 
- (NSMutableArray *)questionChars{
    if(_questionChars == nil){
        _questionChars = [[NSMutableArray alloc]init];
    }
    return _questionChars;
}

- (NSMutableArray *)answerChars{
    if(_answerChars == nil){
        _answerChars = [[NSMutableArray alloc]init];
    }
    return _answerChars;
}
- (NSMutableArray *)answerItems{
    if(_answerItems == nil){
        _answerItems = [[NSMutableArray alloc]init];
    }
    return _answerItems;
}
- (NSMutableArray *)questionItems{
    if(_questionItems == nil){
        _questionItems = [[NSMutableArray alloc]init];
    }
    return _questionItems;
}
- (NSMutableArray *)itemFrames{
    if(_itemFrames == nil){
        _itemFrames = [[NSMutableArray alloc]init];
    }
    return _itemFrames;
}
- (void)music{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"MysteryBoard_sui.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player play];
}
- (void)right{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"MysteryBoard_right.mp3" withExtension:nil];
    self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player1 play];
}
- (void)wrong{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"MysteryBoard_wrong.mp3" withExtension:nil];
    self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player2 play];
}

- (NSMutableArray *)questionFrames{
    if(_questionFrames == nil){
       _questionFrames = [[NSMutableArray alloc]init];
    }
    return _questionFrames;
}

//- (NSMutableArray *)currentAnswer{
//    if(_currentAnswer == nil){
//        _currentAnswer = [[NSMutableArray alloc]init];
//    }
//    return _currentAnswer;
//}

@end

