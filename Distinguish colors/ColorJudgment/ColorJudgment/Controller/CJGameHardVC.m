//
//  CJGameHardVC.m
//  ColorJudgment
//
//  Created by  luzhaoyang on 2020/3/17.
//  Copyright © 2020 haike. All rights reserved.
//

#import "CJGameHardVC.h"

@interface CJGameHardVC ()
<CJRulesVCDelehgate,
CJGameOverVCDelegate>

@property (weak, nonatomic) IBOutlet UIView *mLine;
@property (weak, nonatomic) IBOutlet UIImageView *leftDui;
@property (weak, nonatomic) IBOutlet UIImageView *rightDui;

@property (weak, nonatomic) IBOutlet UILabel *leftTop;
@property (weak, nonatomic) IBOutlet UILabel *leftBottom;
@property (weak, nonatomic) IBOutlet UILabel *rightTop;
@property (weak, nonatomic) IBOutlet UILabel *rightBottom;
@property (weak, nonatomic) IBOutlet UILabel *soureLabel;


@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign) NSInteger count;
@property (nonatomic,assign) NSInteger socre;

@property (nonatomic,strong) NSMutableArray *colorV;
@property (nonatomic,strong) NSMutableArray *colorStr;

@property (nonatomic,assign) BOOL isRight;
@property (nonatomic,strong) AVAudioPlayer *player1;
@property (nonatomic,strong) AVAudioPlayer *player2;

@property (nonatomic,assign) BOOL isRight_left;
@property (nonatomic,assign) BOOL isRight_right;

@property (nonatomic,assign) NSInteger right_left;
@property (nonatomic,assign) NSInteger right_right;

@property (nonatomic,assign) NSInteger rightCount_left;
@property (nonatomic,assign) NSInteger rightCount_right;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineHeightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topM;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *middleTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *middleRightTop;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sorceTopLayout;

@end

@implementation CJGameHardVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.leftTop.font = [UIFont fontWithName:FontName size:30];
    self.leftBottom.font = [UIFont fontWithName:FontName size:30];
    self.rightTop.font = [UIFont fontWithName:FontName size:30];
    self.rightBottom.font = [UIFont fontWithName:FontName size:30];
    
    self.soureLabel.font = [UIFont fontWithName:FontName size:24];
    self.rightDui.image = [UIImage imageNamed:@""];
    self.leftDui.image = [UIImage imageNamed:@""];
    
    self.mLine.layer.cornerRadius = 3;
    self.mLine.layer.masksToBounds = YES;
    
    self.count = 60;
    self.socre = 0;
    self.soureLabel.text = [NSString stringWithFormat:@"%ld",self.socre];
        
    self.right_left = [self getRandomNumber:1 to:4];
    self.rightCount_left = 0;
    
    self.right_right = [self getRandomNumber:1 to:4];
    self.rightCount_right = 0;
    
    CJRulesVC *rulesVc = [[CJRulesVC alloc]init];
    rulesVc.delegate = self;
    [self yc_bottomPresentController:rulesVc presentedHeight:Iphone_Height completeHandle:nil];
    self.navigationItem.title = [NSString stringWithFormat:@"%lds",self.count];
    
    if kiPhone5 {
        self.lineHeightLayout.constant = 450;
        self.topM.constant = -10;
        self.middleTop.constant = 20;
        self.middleRightTop.constant = 20;
        self.sorceTopLayout.constant = 25;
    }
    
    if kiPhone6 {
        self.sorceTopLayout.constant = 25;
    }
}
- (void)okAction{
}
- (void)startAction{
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerChange) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    [self leftRandom];
    [self rightRandom];
}
- (void)timerChange{
    
    if(self.count == 0 || self.count < 0){
        [self.timer invalidate];
        self.timer = nil;
        CJGameOverVC *overVC = [[CJGameOverVC alloc]initWithSorce:[NSString stringWithFormat:@"%ld",self.socre]];
        overVC.delegate = self;
        [self yc_bottomPresentController:overVC presentedHeight:Iphone_Height completeHandle:nil];
        [NSString saveScore:self.socre key:@"CJHard_type"];
        
    }else{
        self.navigationItem.title = [NSString stringWithFormat:@"%lds",self.count];
    }
    self.count = self.count - 1;
}
- (void)homeAction{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)againAction{
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerChange) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    self.navigationItem.title = @"60s";
    
    self.count = 60;
    self.socre = 0;
    self.soureLabel.text = [NSString stringWithFormat:@"%ld",self.socre];
    
    self.right_left = [self getRandomNumber:1 to:4];
    self.rightCount_left = 0;
    
    self.right_right = [self getRandomNumber:1 to:4];
    self.rightCount_right = 0;
}

- (void)leftRandom{
    
    if(self.rightCount_left == self.right_left){
        
        NSInteger index1 = [self getRandomNumber:0 to:7];
        NSInteger index2 = [self getRandomNumber:0 to:7];
        NSString *title = self.colorV[index1];
        NSString *colorStr = self.colorStr[index2];
        self.leftTop.text = title;
        self.leftTop.textColor = [UIColor colorWithHexString:colorStr];
        NSInteger bottomIndex = [self getRandomNumber:0 to:7];
        NSString *bottomStr = self.colorV[bottomIndex];
        self.leftBottom.text = bottomStr;
        self.leftBottom.textColor = [UIColor colorWithHexString:[self getColor:title]];
        self.isRight_left = YES;
        self.right_left = [self getRandomNumber:1 to:4];
        self.rightCount_left = 0;
    }
    
    else{
        NSInteger index1 = [self getRandomNumber:0 to:7];
        NSInteger index2 = [self getRandomNumber:0 to:7];
        NSString *title = self.colorV[index1];
        NSString *colorStr = self.colorStr[index2];
        self.leftTop.text = title;
        self.leftTop.textColor = [UIColor colorWithHexString:colorStr];
        NSInteger bottomIndex = [self getRandomNumber:0 to:7];
        NSString *bottomStr = self.colorV[bottomIndex];
        self.leftBottom.text = bottomStr;
        NSString *bottomColorStr = self.colorStr[index2];
        self.leftBottom.textColor = [UIColor colorWithHexString:bottomColorStr];
        if([[self getColor:title] isEqualToString:bottomColorStr] == YES){
            self.isRight_left = YES;
        }else{
            self.isRight_left = NO;
        }
    }
    self.rightCount_left = self.rightCount_left + 1;
}

- (void)rightRandom{
    
    if(self.rightCount_right == self.right_right){
        
        NSInteger index1 = [self getRandomNumber:0 to:7];
        NSInteger index2 = [self getRandomNumber:0 to:7];
        NSString *title = self.colorV[index1];
        NSString *colorStr = self.colorStr[index2];
        self.rightTop.text = title;
        self.rightTop.textColor = [UIColor colorWithHexString:colorStr];
        NSInteger bottomIndex = [self getRandomNumber:0 to:7];
        NSString *bottomStr = self.colorV[bottomIndex];
        self.rightBottom.text = bottomStr;
        self.rightBottom.textColor = [UIColor colorWithHexString:[self getColor:title]];
        self.isRight_right = YES;
        self.right_right= [self getRandomNumber:1 to:4];
        self.rightCount_right = 0;
    }
    
    else{
        NSInteger index1 = [self getRandomNumber:0 to:7];
        NSInteger index2 = [self getRandomNumber:0 to:7];
        NSString *title = self.colorV[index1];
        NSString *colorStr = self.colorStr[index2];
        self.rightTop.text = title;
        self.rightTop.textColor = [UIColor colorWithHexString:colorStr];
        NSInteger bottomIndex = [self getRandomNumber:0 to:7];
        NSString *bottomStr = self.colorV[bottomIndex];
        self.rightBottom.text = bottomStr;
        NSString *bottomColorStr = self.colorStr[index2];
        self.rightBottom.textColor = [UIColor colorWithHexString:bottomColorStr];
        if([[self getColor:title] isEqualToString:bottomColorStr] == YES){
            self.isRight_right = YES;
        }else{
            self.isRight_right = NO;
        }
    }
    self.rightCount_right = self.rightCount_right + 1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)leftYesAction:(id)sender {
    if(self.isRight_left == YES){
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"right.mp3" withExtension:nil];
        self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player1 play];
        self.socre = self.socre + 100;
        self.leftDui.image = [UIImage imageNamed:@"right"];
        
    }else{
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"error.mp3" withExtension:nil];
        self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player2 play];
        self.count = self.count - 3;
        self.leftDui.image = [UIImage imageNamed:@"wrong"];
    }
    self.soureLabel.text = [NSString stringWithFormat:@"%ld",self.socre];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self leftRandom];
        self.leftDui.image = [UIImage imageNamed:@""];
    });
}
- (IBAction)leftNoAction:(id)sender {
    if(self.isRight_left == NO){
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"right.mp3" withExtension:nil];
        self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player1 play];
        self.socre = self.socre + 100;
        self.leftDui.image = [UIImage imageNamed:@"right"];
        
    }else{
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"error.mp3" withExtension:nil];
        self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player2 play];
        self.count = self.count - 3;
        self.leftDui.image = [UIImage imageNamed:@"wrong"];
    }
    self.soureLabel.text = [NSString stringWithFormat:@"%ld",self.socre];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self leftRandom];
        self.leftDui.image = [UIImage imageNamed:@""];
    });
}

- (IBAction)rightYesAction:(id)sender {
    if(self.isRight_right == YES){
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"right.mp3" withExtension:nil];
        self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player1 play];
        self.socre = self.socre + 100;
        self.rightDui.image = [UIImage imageNamed:@"right"];
        
    }else{
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"error.mp3" withExtension:nil];
        self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player2 play];
        self.count = self.count - 3;
        self.rightDui.image = [UIImage imageNamed:@"wrong"];
    }
    self.soureLabel.text = [NSString stringWithFormat:@"%ld",self.socre];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self rightRandom];
        self.rightDui.image = [UIImage imageNamed:@""];
    });
}
- (IBAction)rightNoAction:(id)sender {
    if(self.isRight_right == NO){
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"right.mp3" withExtension:nil];
        self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player1 play];
        self.socre = self.socre + 100;
        self.rightDui.image = [UIImage imageNamed:@"right"];
        
    }else{
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"error.mp3" withExtension:nil];
        self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player2 play];
        self.count = self.count - 3;
        self.rightDui.image = [UIImage imageNamed:@"wrong"];
    }
    self.soureLabel.text = [NSString stringWithFormat:@"%ld",self.socre];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self rightRandom];
        self.rightDui.image = [UIImage imageNamed:@""];
    });
}



- (NSString *)getColor:(NSString *)str{
    if([str isEqualToString:@"RED"]){
        return @"#E45345";
    }else if ([str isEqualToString:@"YELLOW"]){
        return @"#FFEA59";
    }else if ([str isEqualToString:@"BLUE"]){
        return @"#59ABFF";
    }else if ([str isEqualToString:@"GRAY"]){
        return @"#9C9C9C";
    }else if ([str isEqualToString:@"BLACK"]){
        return @"#000000";
    }else if ([str isEqualToString:@"ORANGE"]){
        return @"#FFB359";
    }else if ([str isEqualToString:@"GREEN"]){
        return @"#9CE77E";
    }else if ([str isEqualToString:@"PURPLE"]){
        return @"#D977DD";
    }else{
        return @"";
    }
}
- (NSMutableArray *)colorV{
    if(_colorV == nil){
        _colorV = [[NSMutableArray alloc]initWithArray:@[@"RED",
                                                         @"YELLOW",
                                                         @"BLUE",
                                                         @"GRAY",
                                                         @"BLACK",
                                                         @"ORANGE",
                                                         @"GREEN",
                                                         @"PURPLE"]];
    }
    return _colorV;
}
- (NSMutableArray *)colorStr{
    if(_colorStr == nil){
        _colorStr = [[NSMutableArray alloc]initWithArray:@[@"#E45345",
                                                           @"#FFEA59",
                                                           @"#59ABFF",
                                                           @"#9C9C9C",
                                                           @"#000000",
                                                           @"#FFB359",
                                                           @"#9CE77E",
                                                           @"#9CE77E"]];
    }
    return _colorStr;
}
- (NSInteger)getRandomNumber:(NSInteger)from to:(NSInteger)to{
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}
@end
