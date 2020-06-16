//
//  CJGameCenterVC.m
//  ColorJudgment
//
//  Created by  luzhaoyang on 2020/3/17.
//  Copyright © 2020 haike. All rights reserved.
//

#import "CJGameCenterVC.h"

@interface CJGameCenterVC ()<CJRulesVCDelehgate,CJGameOverVCDelegate>

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *topColor;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;

@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign) NSInteger count;
@property (nonatomic,assign) NSInteger socre;

@property (nonatomic,strong) NSMutableArray *colorV;
@property (nonatomic,strong) NSMutableArray *colorStr;

@property (nonatomic,assign) BOOL isRight;
@property (nonatomic,strong) AVAudioPlayer *player1;
@property (nonatomic,strong) AVAudioPlayer *player2;

@property (nonatomic,assign) NSInteger right;
@property (nonatomic,assign) NSInteger rightCount;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *middleLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *midLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scoureTopLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textTop;

@end



@implementation CJGameCenterVC

- (void)dealloc{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.topColor.font = [UIFont fontWithName:FontName size:50];
    self.bottomLabel.font = [UIFont fontWithName:FontName size:50];
    self.scoreLabel.font = [UIFont fontWithName:FontName size:24];
    
    self.count = 60;
    self.socre = 0;
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.socre];
    self.rightImageView.image = [UIImage imageNamed:@""];
    
    self.rightCount = 0;
    self.right = [self getRandomNumber:1 to:4];
    
    CJRulesVC *rulesVc = [[CJRulesVC alloc]init];
    rulesVc.delegate = self;
    [self yc_bottomPresentController:rulesVc presentedHeight:Iphone_Height completeHandle:nil];
    self.navigationItem.title = [NSString stringWithFormat:@"%lds",self.count];

    if kiPhone5 {
        self.middleLayout.constant = 30;
        self.midLayout.constant = 20;
        self.scoureTopLayout.constant = 25;
        self.textTop.constant = 10;
    }
    if kiPhone6 {
        self.scoureTopLayout.constant = 25;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CJNavigateVC *navi = (CJNavigateVC *)self.navigationController;
    navi.backBlock = ^{
        [self.timer invalidate];
        self.timer = nil;
    };
}

- (NSInteger)getRandomNumber:(NSInteger)from to:(NSInteger)to{
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}
- (void)homeAction{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)againAction{
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerChange) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    self.navigationItem.title = @"60s";
    self.count = 60;
    
    self.count = 60;
    self.socre = 0;
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.socre];
    self.rightImageView.image = [UIImage imageNamed:@""];
    self.rightCount = 0;
    self.right = [self getRandomNumber:1 to:4];
}

- (void)okAction{
    
}
- (void)startAction{
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerChange) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    [self random];
}

- (void)timerChange{
    if(self.count == 0 || self.count < 0){
        [self.timer invalidate];
        self.timer = nil;
        
        CJGameOverVC *overVC = [[CJGameOverVC alloc]initWithSorce:[NSString stringWithFormat:@"%ld",self.socre]];
        overVC.delegate = self;
        [self yc_bottomPresentController:overVC presentedHeight:Iphone_Height completeHandle:nil];
        [NSString saveScore:self.socre key:@"CJEasy_type"];
        
    }else{
        self.navigationItem.title = [NSString stringWithFormat:@"%lds",self.count];
    }
    self.count = self.count - 1;
}

- (IBAction)yesBtnAction:(id)sender {
    
    if(self.isRight == YES){
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"right.mp3" withExtension:nil];
        self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player1 play];
        self.socre = self.socre + 100;
        self.rightImageView.image = [UIImage imageNamed:@"right"];
    }
    else{
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"error.mp3" withExtension:nil];
        self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player2 play];
        self.count = self.count - 3;
        self.rightImageView.image = [UIImage imageNamed:@"wrong"];
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.socre];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self random];
        self.rightImageView.image = [UIImage imageNamed:@""];
    });
}

- (IBAction)noAction:(id)sender {
    if(self.isRight == NO){
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"right.mp3" withExtension:nil];
        self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player1 play];
        self.socre = self.socre + 100;
        self.rightImageView.image = [UIImage imageNamed:@"right"];
        
    }else{
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"error.mp3" withExtension:nil];
        self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [self.player2 play];
        self.count = self.count - 3;
        self.rightImageView.image = [UIImage imageNamed:@"wrong"];
        
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.socre];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self random];
        self.rightImageView.image = [UIImage imageNamed:@""];
    });
}


- (void)random{
    
    if(self.rightCount == self.right){
        
        NSInteger index1 = [self getRandomNumber:0 to:7];
        NSInteger index2 = [self getRandomNumber:0 to:7];
        NSString *title = self.colorV[index1];
        NSString *colorStr = self.colorStr[index2];
        self.topColor.text = title;
        self.topColor.textColor = [UIColor colorWithHexString:colorStr];
        
        NSInteger bottomIndex = [self getRandomNumber:0 to:7];
        NSString *bottomStr = self.colorV[bottomIndex];
        self.bottomLabel.text = bottomStr;
        self.bottomLabel.textColor = [UIColor colorWithHexString:[self getColor:title]];
        
        self.isRight = YES;

        self.right = [self getRandomNumber:1 to:4];
        self.rightCount = 0;
    }
    
    else{
        
        NSInteger index1 = [self getRandomNumber:0 to:7];
        NSInteger index2 = [self getRandomNumber:0 to:7];
        NSString *title = self.colorV[index1];
        NSString *colorStr = self.colorStr[index2];
        self.topColor.text = title;
        self.topColor.textColor = [UIColor colorWithHexString:colorStr];
        
        NSInteger bottomIndex = [self getRandomNumber:0 to:7];
        NSString *bottomStr = self.colorV[bottomIndex];
        self.bottomLabel.text = bottomStr;
        NSString *bottomColorStr = self.colorStr[index2];
        self.bottomLabel.textColor = [UIColor colorWithHexString:bottomColorStr];
        
        if([[self getColor:title] isEqualToString:bottomColorStr] == YES){
            self.isRight = YES;
        }else{
            self.isRight = NO;
        }
    }
    self.rightCount = self.rightCount + 1;
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
@end
