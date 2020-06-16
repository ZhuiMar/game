//
//  TDTypeOneVC.m
//  TruthOrDare
//
//  Created by  luzhaoyang on 2020/3/10.
//  Copyright © 2020 zhuimar. All rights reserved.
//

#import "TDTypeOneVC.h"

@interface TDTypeOneVC ()<TDSelectedVCDelegate,TDQuestionVCDelegate>

@property (weak, nonatomic) IBOutlet UIButton *descripttion;
@property (weak, nonatomic) IBOutlet UISwitch *myswitch;
@property (weak, nonatomic) IBOutlet UIButton *startBtnAction;
@property (weak, nonatomic) IBOutlet UIImageView *switchBgImage;

@property (weak, nonatomic) IBOutlet UIImageView *bgimageView;

@property (strong, nonatomic) UIView *view1;
@property (strong, nonatomic) UIView *view2;

@property(nonatomic,assign) CGFloat timerNumber;
@property(nonatomic,strong) NSTimer *timer;
@property(nonatomic,assign) BOOL isOne;
@property(nonatomic,assign) NSInteger peopleNum;

@property(nonatomic,strong) NSMutableArray *trueArr;
@property(nonatomic,strong) NSMutableArray *adveArr;

@property(nonatomic,copy) NSString *type;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;


@end

@implementation TDTypeOneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUi];
    self.timerNumber = 0;
    self.isOne = YES;
    self.myswitch.on = NO;
    
    if IS_IPHONE_X_orMore {
        self.topLayout.constant = 0;
    }
    
    TDNavigateVC *navi = (TDNavigateVC *)self.navigationController;
    navi.backBlock = ^{
        if(self.view1){
            [self.view1 removeFromSuperview];
            self.view1 = nil;
        }
        if(self.view2){
            [self.view2 removeFromSuperview];
            self.view2 = nil;
        }
    };
}

- (void)setUi{
    self.myswitch.transform = CGAffineTransformMakeScale(0.75, 0.75);
    self.switchBgImage.transform = CGAffineTransformMakeScale(0.75, 0.7);
    [self.myswitch setOnTintColor: [UIColor blackColor]];
}

- (IBAction)disscripttionAction:(UIButton *)sender {
    TDDescribeVC *desVC = [[TDDescribeVC alloc]init];
    [self yc_bottomPresentController:desVC presentedHeight:180 completeHandle:^(BOOL presented) {
        if(presented == NO){
        }
    }];
}

- (void)setPoint1{
    CGFloat W = 80;
    CGFloat H = 80;
    CGFloat X = [self getRandomNumber:10 to:Iphone_Width-90];
    CGFloat Y = [self getRandomNumber:10 to:Iphone_Height-90];
    
    CGRect frame1 = CGRectMake(X, Y, W, H);
    self.view1 = [[UIView alloc] init];
    self.view1.frame = frame1;
    self.view1.backgroundColor = [UIColor whiteColor];
    self.view1.layer.cornerRadius = 40;
    self.view1.layer.masksToBounds = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:self.view1];

    UIImageView *imageview1 = [[UIImageView alloc]init];
    imageview1.image = [UIImage imageNamed:@"1"];
    imageview1.frame = CGRectMake(25, 25, 30, 30);
    [self.view1 addSubview:imageview1];
    UIPanGestureRecognizer *panGest = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panView1:)];
    [self.view1 addGestureRecognizer:panGest];
}
- (void)panView1:(UIPanGestureRecognizer *)panGest{
    CGPoint trans = [panGest translationInView:panGest.view];
    NSLog(@"%@",NSStringFromCGPoint(trans));
    CGPoint center =  self.view1.center;
    center.x += trans.x;
    center.y += trans.y;
    self.view1.center = center;
    [panGest setTranslation:CGPointZero inView:panGest.view];
}


- (void)setPoint2{
    CGFloat W = 80;
    CGFloat H = 80;
    CGFloat X = [self getRandomNumber:10 to:Iphone_Width-90];
    CGFloat Y = [self getRandomNumber:10 to:Iphone_Height-90];
    
    CGRect frame2 = CGRectMake(X, Y, W, H);
    self.view2 = [[UIView alloc] init];
    self.view2.frame = frame2;
    self.view2.backgroundColor = [UIColor whiteColor];
    self.view2.layer.cornerRadius = 40;
    self.view2.layer.masksToBounds = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:self.view2];
    
    UIImageView *imageview2 = [[UIImageView alloc]init];
    imageview2.image = [UIImage imageNamed:@"2"];
    imageview2.frame = CGRectMake(25, 25, 30, 30);
    [self.view2 addSubview:imageview2];
    
    UIPanGestureRecognizer *panGest = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panView2:)];
    [self.view2 addGestureRecognizer:panGest];
}
- (void)panView2:(UIPanGestureRecognizer *)panGest{
    CGPoint trans = [panGest translationInView:panGest.view];
    NSLog(@"%@",NSStringFromCGPoint(trans));
    CGPoint center =  self.view2.center;
    center.x += trans.x;
    center.y += trans.y;
    self.view2.center = center;
    [panGest setTranslation:CGPointZero inView:panGest.view];
}


- (NSInteger)getRandomNumber:(NSInteger)from to:(NSInteger)to{
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}

- (IBAction)switchAction:(UISwitch *)sender {
    
}
- (IBAction)startAction:(UIButton *)sender {
    
    if(self.view1){
        [self.view1 removeFromSuperview];
        self.view1 = nil;
    }
    if(self.view2){
        [self.view2 removeFromSuperview];
        self.view2 = nil;
    }
    
    [self setPoint1];
    [self setPoint2];
    self.timer = [NSTimer timerWithTimeInterval:0.2 target:self selector:@selector(timerChange) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void)OKAction{
    self.type = @"";
}
- (void)replaceAction:(TDQuestionVC *)vc{
    if([self.type isEqualToString:@"truth"]){
        NSInteger index = [self getRandomNumber:0 to:self.trueArr.count-1];
        NSString *string = self.trueArr[index];
        vc.contentLabel.text = string;
    }
    if([self.type isEqualToString:@"dare"]){
        NSInteger index = [self getRandomNumber:0 to:self.adveArr.count-1];
        NSString *string = self.adveArr[index];
        vc.contentLabel.text = string;
    }
}

- (void)truthAction{
    
     self.type = @"truth";
    
    if(self.view1){
        [self.view1 removeFromSuperview];
        self.view1 = nil;
    }
    if(self.view2){
        [self.view2 removeFromSuperview];
        self.view2 = nil;
    }

    NSInteger index = [self getRandomNumber:0 to:self.trueArr.count];
    NSString *string = self.trueArr[index];
    TDQuestionVC *qustionVc = [[TDQuestionVC alloc]initWithQuestion:string];
    qustionVc.delagate = self;
    
    [self yc_bottomPresentController:qustionVc presentedHeight:Iphone_Height completeHandle:^(BOOL presented) {
        if(presented == NO){
        }
    }];
}
- (void)dareAction{
    
    self.type = @"dare";
    
    if(self.view1){
        [self.view1 removeFromSuperview];
        self.view1 = nil;
    }
    if(self.view2){
        [self.view2 removeFromSuperview];
        self.view2 = nil;
    }
    
    
    NSUInteger index = [self getRandomNumber:0 to:self.adveArr.count-1];
    NSString *string = self.adveArr[index];
    TDQuestionVC *qustionVc = [[TDQuestionVC alloc]initWithQuestion:string];
    qustionVc.delagate = self;
    [self yc_bottomPresentController:qustionVc presentedHeight:Iphone_Height completeHandle:^(BOOL presented) {
        if(presented == NO){
        }
    }];
}

- (void)timerChange{
    if(self.timerNumber >= 4.0){
        [self.timer invalidate];
        self.timer = nil;
        self.timerNumber = 0;
        self.isOne = YES;
        
        self.peopleNum = [self getRandomNumber:1 to:2];
        if(self.peopleNum == 1){
            self.view1.backgroundColor = [UIColor colorWithHexString:@"#F74640"];
            self.view2.backgroundColor = [UIColor whiteColor];
        }else{
            self.view1.backgroundColor = [UIColor whiteColor];
            self.view2.backgroundColor = [UIColor colorWithHexString:@"#F74640"];
        }
        
        if(self.myswitch.on == YES){
            TDSelectedVC *selectVc = [[TDSelectedVC alloc]init];
            selectVc.delegate = self;
            [self yc_bottomPresentController:selectVc presentedHeight:Iphone_Height completeHandle:^(BOOL presented) {
                if(presented == NO){
                }
            }];
        }
        
    }else{
        self.timerNumber = self.timerNumber + 0.2;
        if(self.isOne == YES){
            self.view1.backgroundColor = [UIColor colorWithHexString:@"#F74640"];
            self.view2.backgroundColor = [UIColor whiteColor];
        }else{
            self.view1.backgroundColor = [UIColor whiteColor];
            self.view2.backgroundColor = [UIColor colorWithHexString:@"#F74640"];
        }
        self.isOne = !self.isOne;
    }
}

- (void)dealloc{
    [self.timer invalidate];
    self.timer = nil;
}

- (NSMutableArray *)trueArr{
    if(_trueArr == nil){
        _trueArr = [NSMutableArray arrayWithArray:@[@"Do you have anyone you like? Who is it?",
                                                    @"How old is your first love?",
                                                    @"Who is your first love?",
                                                    @"How old was your first kiss? By whom?",
                                                    @"How many people have you kissed?",
                                                    @"Of all the people on the scene, which of the opposite sex do you think is the most comfortable?",
                                                    @"What's the name of the first heterosexual you like?",
                                                    @"If you are given another chance to go back to high school, what would you like to say to the opposite sex?",
                                                    @"How many times have you been in love?",
                                                    @"Who do you think of before you go to bed every day?",
                                                    @"The name of a heterosexual that you've been thinking about? Why?",
                                                    @"Which opposite sex would you like to elope with most?",
                                                    @"Do you think the opposite sex's lips look like kiss the most?",
                                                    @"Which one do you want to take a big risk with?",
                                                    @"Who do you think is the most similar to the person you used to like?",
                                                    @"Which member of the opposite sex said to you that I like you, you will be the happiest?",
                                                    @"If time can flow back, which time do you want to go back to and why?",
                                                    @"When you take a bath, a very ugly opposite sex rushes in, what will you do?",
                                                    @"Have you ever imagined or hoped to do something with someone you like? Just answer yes or no?",
                                                    @"What do you think of me?"]];
    }
    return _trueArr;
}

- (NSMutableArray *)adveArr{
    if(_adveArr == nil){
        _adveArr = [NSMutableArray arrayWithArray:@[@"Make a face that everyone is satisfied with",
                                                    @"Three minutes to a heterosexual",
                                                    @"Ten fingers of a opposite sex, 10 seconds",
                                                    @"Breathe into the sensitive part of the ear root of the nearest opposite sex for 5 seconds",
                                                    @"Stay in a black house with a heterosexual and come out again",
                                                    @"Kiss with tissue (first fold, second no, third separate!!)",
                                                    @"Choose a member of the opposite sex and touch each other's lips",
                                                    @"Sit on the opposite thigh for 10 seconds",
                                                    @"The man depends on the woman's stomach: the wife has been several months (the boy chooses the girl) should say gently",
                                                    @"Take a picture of the most handsome or beautiful member of the opposite sex",
                                                    @"Please hold a boy and a girl tightly for five seconds. (if you fail, do it yourself)",
                                                    @"Choose two opposite sexes to pass cards with their lips",
                                                    @"Call me a pig",
                                                    @"Choose a boy and beat him on the chest and say, you hate it",
                                                    @"Girls lie on their backs, boys stay up, do five push ups",
                                                    @"Boys lie on their backs, girls stay on them for 5 seconds",
                                                    @"Yes, a drink",
                                                    @"Girls dance on boys' feet",
                                                    @"Girls sit on boys' calves, boys do sit ups"]];
    }
    return _adveArr;
}

- (NSString *)type{
    if(_type == nil){
        _type = [[NSString alloc]init];
    }
    return _type;
}

@end
