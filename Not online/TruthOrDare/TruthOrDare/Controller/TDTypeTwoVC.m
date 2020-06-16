//
//  TDTypeTwoVC.m
//  TruthOrDare
//
//  Created by  luzhaoyang on 2020/3/10.
//  Copyright © 2020 zhuimar. All rights reserved.
//

#import "TDTypeTwoVC.h"

@interface TDTypeTwoVC ()<TDSelectedVCDelegate,TDQuestionVCDelegate>

@property (weak, nonatomic) IBOutlet UIButton *descriptionAction;
@property (weak, nonatomic) IBOutlet UIButton *addBtnAction;
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;

@property(nonatomic,strong) NSMutableArray *trueArr;
@property(nonatomic,strong) NSMutableArray *adveArr;

@property(nonatomic,assign) NSInteger peopleNumber;
@property(nonatomic,assign) NSInteger currentNumber;
@property (weak, nonatomic) IBOutlet UIImageView *selecImageView;

@property (weak, nonatomic) IBOutlet UIImageView *pointImageView;
@property (nonatomic,strong) CALayer *pointLayer; //秒钟

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *painyiLayout;

@property(nonatomic,assign) NSString *type;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerTopLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;

@end

@implementation TDTypeTwoVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if kiPhone5{
        self.centerTopLayout.constant = 0;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUi];
    self.peopleNumber = 1;
    self.mySwitch.on = NO;
    
    NSString *imageName = [NSString stringWithFormat:@"select_%ld",self.peopleNumber];
    self.selecImageView.image = [UIImage imageNamed:imageName];
    
    if IS_IPHONE_X_orMore {
        self.topLayout.constant = 0;
    }
}

- (void)setUi{
    self.mySwitch.transform = CGAffineTransformMakeScale(0.75, 0.75);
    self.bgImageView.transform = CGAffineTransformMakeScale(0.75, 0.7);
    [self.mySwitch setOnTintColor: [UIColor blackColor]];
    [self.startBtn setTintColor:[UIColor whiteColor]];
}

- (IBAction)descriptAction:(UIButton *)sender {
    TDDescribeVC *desVC = [[TDDescribeVC alloc]init];
    [self yc_bottomPresentController:desVC presentedHeight:180 completeHandle:^(BOOL presented) {
        if(presented == NO){
        }
    }];
}

- (IBAction)addAction:(UIButton *)sender {
    if(self.peopleNumber == 1){
        self.peopleNumber = self.peopleNumber + 1;
    }else if (self.peopleNumber == 2){
        self.peopleNumber = self.peopleNumber + 1;
    }else if (self.peopleNumber == 3){
        self.peopleNumber = 1;
    }
    NSString *imageName = [NSString stringWithFormat:@"select_%ld",self.peopleNumber];
    self.selecImageView.image = [UIImage imageNamed:imageName];
}
- (IBAction)switchAction:(UISwitch *)sender {
    
}
- (IBAction)startAction:(UIButton *)sender {
    self.painyiLayout.constant = 0;
    self.currentNumber = [self getRandomNumber:1 to:6];
    CABasicAnimation *layer = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    NSInteger ge = [self getRandomNumber:1 to:15];
    NSInteger dian = [self getRandomNumber:0 to:9];
    NSString *str = [NSString stringWithFormat:@"%ld.%ld",ge,dian];
    CGFloat zhi = [str floatValue];
    layer.toValue = @(zhi*M_PI);
    layer.duration = 3;
    layer.removedOnCompletion = false;
    layer.repeatCount = 1;
    layer.autoreverses = NO;
    layer.fillMode = kCAFillModeForwards;
    layer.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    self.pointImageView.layer.anchorPoint = CGPointMake(0.5, 0.7);
    [self.pointImageView.layer addAnimation:layer forKey:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if(self.mySwitch.on == YES){
            TDSelectedVC *selectVc = [[TDSelectedVC alloc]init];
            selectVc.delegate = self;
            [self yc_bottomPresentController:selectVc presentedHeight:Iphone_Height completeHandle:^(BOOL presented) {
                if(presented == NO){
                }
            }];
        }
    });
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
    
    NSUInteger index = [self getRandomNumber:0 to:self.adveArr.count-1];
    NSString *string = self.adveArr[index];
    TDQuestionVC *qustionVc = [[TDQuestionVC alloc]initWithQuestion:string];
    qustionVc.delagate = self;
    [self yc_bottomPresentController:qustionVc presentedHeight:Iphone_Height completeHandle:^(BOOL presented) {
        if(presented == NO){
        }
    }];
}

- (NSInteger)getRandomNumber:(NSInteger)from to:(NSInteger)to{
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}


- (NSMutableArray *)trueArr{
    if(_trueArr == nil){
        _trueArr = [NSMutableArray arrayWithArray:@[@"Which part of the opposite person do you think is the best to look at",
                                                    @"The end of the world, you will survive, and you can save one person, you will save? Both men and women can?",
                                                    @"What would you do if the previous heterosexual player fell in love with you?",
                                                    @"If there is an afterlife you choose to be?",
                                                    @"What is the most shameful thing from childhood?",
                                                    @"If you were asked to find a GG / mm from the scene, who would you choose? Give three reasons.",
                                                    @"If you were to kiss someone of the opposite sex, who would you choose and why?",
                                                    @"Have you ever thought about suicide? Why?",
                                                    @"What is the ideal partner like?",
                                                    @"Have you ever been dumped in the process of associating with your boyfriend and girlfriend?"]];
    }
    return _trueArr;
}

- (NSMutableArray *)adveArr{
    if(_adveArr == nil){
        _adveArr = [NSMutableArray arrayWithArray:@[@"Hold the ten finger clasp for one round",
                                                    @"10 seconds with the nearest same-sex classmate and look at each other and say:'I love you'",
                                                    @"Drink salty drinks",
                                                    @"Knock your head with a bottle, and knock out the melody",
                                                    @"Hold a heterosexual until the next round of truth Adventure (Princess hold)",
                                                    @"Pick up the first heterosexual on the right",
                                                    @"Choose two boys to put sister Furong's S S shape together",
                                                    @"Change with the first member of the opposite sex on the left",
                                                    @"The forehead of the second opposite sex",
                                                    @"Get a guy to put his leg on his shoulder and let him thump his leg"]];
    }
    return _adveArr;
}

@end
