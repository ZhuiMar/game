//
//  LLSimpleVC.m
//  LanguageLearn
//
//  Created by  luzhaoyang on 2020/3/19.
//  Copyright © 2020 haike. All rights reserved.
//

#import "LLSimpleVC.h"
#import <AVFoundation/AVFoundation.h>

@interface LLSimpleVC ()<AVSpeechSynthesizerDelegate,LLOverVCDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionCount;
@property (weak, nonatomic) IBOutlet UIImageView *imageTop;
@property (weak, nonatomic) IBOutlet UIImageView *imageMiddle;
@property (weak, nonatomic) IBOutlet UIImageView *imageButtion;

@property (weak, nonatomic) IBOutlet UIImageView *topRight;
@property (weak, nonatomic) IBOutlet UIImageView *middleRight;
@property (weak, nonatomic) IBOutlet UIImageView *buttionRight;

@property (nonatomic,strong) NSMutableArray *datas;
@property (nonatomic,strong) NSMutableArray *images;

@property(nonatomic,strong) AVSpeechSynthesizer *synthesizer;

@property(nonatomic,strong) NSTimer *timer;
@property(nonatomic,assign) NSInteger count;

@property(nonatomic,assign) NSInteger right;

@property(nonatomic,assign) NSInteger score;
@property(nonatomic,assign) NSInteger qustionCount;

@property(nonatomic,copy) NSString *type;

@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *middleLabel;
@property (weak, nonatomic) IBOutlet UILabel *buttomLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topBottomLayout;

@end

@implementation LLSimpleVC

- (instancetype)initWithType:(NSString *)type{
    if(self = [super init]){
        self.type = type;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Simple";
}

- (void)dealloc{
    [self.timer invalidate];
    self.timer = nil;
    
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLabel.font = [UIFont fontWithName:FontName size:22];
    self.questionCount.font = [UIFont fontWithName:FontName size:30];
    
    if kiPhone5 {
       self.titleLabel.font = [UIFont fontWithName:FontName size:16];
       self.questionCount.font = [UIFont fontWithName:FontName size:20];
       self.topLayout.constant = 64;
       self.topBottomLayout.constant = 0;
    }
    
    self.count = [self getRandomNumber:0 to:self.datas.count - 1];
    self.score = 0;
    self.qustionCount = 0;
    
    self.questionCount.text = [NSString stringWithFormat:@"%ld/10",self.score];
    self.synthesizer = [[AVSpeechSynthesizer alloc]init];
    self.synthesizer.delegate = self;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self suiji];
    
    LLNavigateVC *naviegate = (LLNavigateVC *)self.navigationController;
    naviegate.backBlock = ^{
        [self.timer invalidate];
        self.timer = nil;
    };
    
    if([self.type isEqualToString:@"simple"]){
        [self.topLabel setHidden:YES];
        [self.middleLabel setHidden:YES];
        [self.buttomLabel setHidden:YES];
        
        [self.imageTop setHidden:NO];
        [self.imageMiddle setHidden:NO];
        [self.imageButtion setHidden:NO];
        
    }else{
        [self.topLabel setHidden:NO];
        [self.middleLabel setHidden:NO];
        [self.buttomLabel setHidden:NO];
        
        [self.imageTop setHidden:YES];
        [self.imageMiddle setHidden:YES];
        [self.imageButtion setHidden:YES];
    }
}

- (void)timeChange{
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:self.datas[self.count]];
    if([self.type isEqualToString:@"simple"]){
        utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
    }else{
        utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"ja-JP"];
    }
    utterance.rate = 0.5f;
    utterance.volume = 1.0f;
    [self.synthesizer speakUtterance:utterance];
}

- (IBAction)topAction:(UIButton *)sender {
    if(self.right == 0){
        self.score = self.score + 1;
        self.questionCount.text = [NSString stringWithFormat:@"%ld/10",self.score];
        self.topRight.image = [UIImage imageNamed:@"right"];
    }else{
        self.topRight.image = [UIImage imageNamed:@"wrong"];
    }
    sender.enabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.topRight.image = [UIImage imageNamed:@""];
        self.qustionCount = self.qustionCount + 1;
        self.count = [self getRandomNumber:0 to:self.datas.count - 1];
        [self suiji];
        sender.enabled = YES;
    });
}

- (IBAction)middleAction:(UIButton *)sender {
    if(self.right == 1){
        self.score = self.score + 1;
        self.questionCount.text = [NSString stringWithFormat:@"%ld/10",self.score];
        self.middleRight.image = [UIImage imageNamed:@"right"];
    }else{
        self.middleRight.image = [UIImage imageNamed:@"wrong"];
    }
    sender.enabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.middleRight.image = [UIImage imageNamed:@""];
        self.qustionCount = self.qustionCount + 1;
        self.count = [self getRandomNumber:0 to:self.datas.count - 1];
        [self suiji];
        sender.enabled = YES;
    });
}

- (IBAction)buttomAction:(UIButton *)sender {
    if(self.right == 2){
        self.score = self.score + 1;
        self.questionCount.text = [NSString stringWithFormat:@"%ld/10",self.score];
        self.buttionRight.image = [UIImage imageNamed:@"right"];
    }else{
        self.buttionRight.image = [UIImage imageNamed:@"wrong"];
    }
    sender.enabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.buttionRight.image = [UIImage imageNamed:@""];
        self.qustionCount = self.qustionCount + 1;
        self.count = [self getRandomNumber:0 to:self.datas.count - 1];
        [self suiji];
        sender.enabled = YES;
    });
}

- (void)againAction{
    
    self.count = [self getRandomNumber:0 to:self.datas.count - 1];
    self.score = 0;
    self.qustionCount = 0;

    self.questionCount.text = [NSString stringWithFormat:@"%ld/10",self.score];
    self.synthesizer = [[AVSpeechSynthesizer alloc]init];
    self.synthesizer.delegate = self;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self suiji];
}

- (void)suiji{
    
    if(self.qustionCount == 10 || self.qustionCount > 10){
        [self.timer invalidate];
        self.timer = nil;
        LLOverVC *overVC = [[LLOverVC alloc]initWithScored:self.score];
        overVC.delegate = self;
        [self.navigationController pushViewController:overVC animated:YES];
        return;
    }
    
    NSInteger su = [self getRandomNumber:0 to:2];
    self.right = su;
    if(su == 0){
        
        self.imageTop.image = [UIImage imageNamed:self.images[self.count]];
        self.topLabel.text = self.datas[self.count];
        
        NSInteger image2;
        do{
            image2 = [self getRandomNumber:0 to:self.images.count - 1];
        }while (image2 == self.count);
        
        NSInteger image3;
        do{
            image3 = [self getRandomNumber:0 to:self.images.count - 1];
        }while (image3 == self.count || image3 == image2);
        
        self.imageMiddle.image = [UIImage imageNamed:self.images[image2]];
        self.imageButtion.image = [UIImage imageNamed:self.images[image3]];
        
        self.middleLabel.text = self.datas[image2];
        self.buttomLabel.text = self.datas[image3];
        
        
    }else if (su == 1){
        
        NSInteger image1;
        do{
            image1 = [self getRandomNumber:0 to:self.images.count - 1];
        }while (image1 == self.count);
        
        NSInteger image3;
        do{
            image3 = [self getRandomNumber:0 to:self.images.count - 1];
        }while (image3 == self.count || image3 == image1);
        
        self.imageTop.image = [UIImage imageNamed:self.images[image1]];
        self.imageMiddle.image = [UIImage imageNamed:self.images[self.count]];
        self.imageButtion.image = [UIImage imageNamed:self.images[image3]];
        
        self.topLabel.text = self.datas[image1];
        self.middleLabel.text = self.datas[self.count];
        self.buttomLabel.text = self.datas[image3];
        
    }else{
        
        NSInteger image1;
        do{
            image1 = [self getRandomNumber:0 to:self.images.count - 1];
        }while (image1 == self.count);
        
        NSInteger image2;
        do{
            image2 = [self getRandomNumber:0 to:self.images.count - 1];
        }while (image2 == self.count || image2 == image1);
        
        self.imageTop.image = [UIImage imageNamed:self.images[image1]];
        self.imageMiddle.image = [UIImage imageNamed:self.images[image2]];
        self.imageButtion.image = [UIImage imageNamed:self.images[self.count]];
        
        self.topLabel.text = self.datas[image1];
        self.middleLabel.text = self.datas[image2];
        self.buttomLabel.text = self.datas[self.count];
    }
}


- (NSInteger)getRandomNumber:(NSInteger)from to:(NSInteger)to{
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}


- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance{
    NSLog(@"didStartSpeechUtterance->%@",utterance.speechString);
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance{
    NSLog(@"didFinishSpeechUtterance->%@",utterance.speechString);
    
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance *)utterance{
    NSLog(@"didPauseSpeechUtterance->%@",utterance.speechString);
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance *)utterance{
    NSLog(@"didContinueSpeechUtterance->%@",utterance.speechString);
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance{
    NSLog(@"didCancelSpeechUtterance->%@",utterance.speechString);
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterance{
    NSLog(@"willSpeakRangeOfSpeechString->characterRange.location = %zd->characterRange.length = %zd->utterance.speechString= %@",characterRange.location,characterRange.length,utterance.speechString);
}


- (NSMutableArray *)datas{
    if(_datas == nil){
        if([self.type isEqualToString:@"simple"]){
            
            _datas = [[NSMutableArray alloc]initWithArray:@[@"apple",
            @"avocado",
            @"banana",
            @"cherry",
            @"grape",
            @"lemon",
            @"orange",
            @"peach",
            @"pear",
            @"pomegranate",
            @"strawberry",
            @"watermelon",@"antelope",
            @"bird",
            @"cheetah",
            @"giraffe",
            @"hedgehog",
            @"hippopotamus",
            @"jackal",
            @"lizard",
            @"rhinoceros",
            @"snake",
            @"tiger",
            @"turkey"]];
            
        }else{
            
            _datas = [[NSMutableArray alloc]initWithArray:@[@"アップル",
            @"アボカド",
            @"バナナ",
            @"チェリー",
            @"グレープ",
            @"レモン",
            @"オレンジ",
            @"ピーチ",
            @"梨",
            @"ザクロ",
            @"いちご",
            @"スイカ",
            @"アンテロープ",
            @"バード",
            @"チーター",
            @"キリン",
            @"ハリネズミ",
            @"カバ類",
            @"ジャッカル",
            @"トカゲ",
            @"サイ",
            @"蛇",
            @"タイガー",
            @"トルコ"]];
        }
    }
    return _datas;
}

- (NSMutableArray *)images{
    if(_images == nil){
        _images = [[NSMutableArray alloc]initWithArray:@[@"apple",
        @"avocado",
        @"banana",
        @"cherry",
        @"grape",
        @"lemon",
        @"orange",
        @"peach",
        @"pear",
        @"pomegranate",
        @"strawberry",
        @"watermelon",@"antelope",
        @"bird",
        @"cheetah",
        @"giraffe",
        @"hedgehog",
        @"hippopotamus",
        @"jackal",
        @"lizard",
        @"rhinoceros",
        @"snake",
        @"tiger",
        @"turkey"]];
        
    }
    return _images;
}
@end
