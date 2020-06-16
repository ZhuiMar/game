//
//  ECDrytrashViewController.m
//  EnvironmentCognize
//
//  Created by luzhaoyang on 2020/4/7.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "ECDrytrashViewController.h"

@interface ECDrytrashViewController ()<UIScrollViewDelegate,AVSpeechSynthesizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@property (nonatomic,strong)UIScrollView *scrollerView;

@property (nonatomic,strong)NSMutableArray *data;
@property (nonatomic,strong)NSMutableArray *imageDatas;
@property (nonatomic,assign)NSInteger type;
@property (nonatomic,assign)NSInteger count;
@property (nonatomic,copy) NSString *currentStr;
@property(nonatomic,strong) AVSpeechSynthesizer *synthesizer;
@property(nonatomic,strong) NSTimer *timer;

@property (nonatomic,assign) BOOL isPlay;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerY;

@end


@implementation ECDrytrashViewController


- (instancetype)initWithTpye:(NSInteger)type{
    if(self == [super init]){
        self.type = type;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Dry trash";
}

- (IBAction)playAction:(id)sender {
    if(self.isPlay == NO){
        [self.playBtn setBackgroundImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }else{
        [self.playBtn setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
        [self.timer invalidate];
        self.timer = nil;
    }
    self.isPlay = !self.isPlay;
}

- (void)timeChange{
    [self ovice];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.count = 0;
    self.currentStr = self.data[self.count];
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addSubview:self.scrollerView];
    for(int i = 0; i<self.data.count; i++){
        UIImageView *imageView = [[UIImageView alloc]init];
        CGRect frame = CGRectMake(i * self.imageView.frame.size.width + (self.imageView.frame.size.width - 60)/2, (self.imageView.frame.size.height-60)/2, 60, 60);
        imageView.frame = frame;
        NSString *string = self.imageDatas[i];
        imageView.image = [UIImage imageNamed:string];
        [self.scrollerView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc]init];
        CGRect frame1 = CGRectMake(i * self.imageView.frame.size.width, self.imageView.frame.size.height-60, self.imageView.frame.size.width, 40);
        label.frame = frame1;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont fontWithName:FontNameTitle size:20];
        label.text = self.data[i];
        label.textColor = [NSObject colorWithHexString:@"#65314C"];
        [self.scrollerView addSubview:label];
        
    }
    self.isPlay = NO;
    ECNavigateViewController *navigate = (ECNavigateViewController *)self.navigationController;
    navigate.backBlock = ^{
        if(self.timer != nil){
            [self.timer invalidate];
            self.timer = nil;
        }
    };
    
    self.synthesizer = [[AVSpeechSynthesizer alloc]init];
    self.synthesizer.delegate = self;
    
    if kiPhone5 {
        self.centerY.constant = -50;
    }
}

- (UIScrollView *)scrollerView{
    if(_scrollerView == nil){
        CGRect frame = self.imageView.bounds;
        _scrollerView = [[UIScrollView alloc]initWithFrame:frame];
        _scrollerView.backgroundColor = [UIColor clearColor];
        _scrollerView.contentSize = CGSizeMake(self.imageView.frame.size.width * self.data.count, self.imageView.frame.size.height);
        _scrollerView.bounces = NO;
        _scrollerView.delegate = self;
        _scrollerView.pagingEnabled = YES;
        _scrollerView.scrollEnabled = YES;
        _scrollerView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollerView;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x/self.imageView.frame.size.width;
    self.count = index;
}

- (IBAction)leftAction:(id)sender {
    if(self.count - 1 >= 0){
        self.count  = self.count - 1;
    }
    self.currentStr = self.data[self.count];
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.scrollerView setContentOffset:CGPointMake(self.imageView.frame.size.width * self.count, 0)];
    }];
}

- (IBAction)rightAction:(id)sender {
    if(self.count + 1 <= self.data.count-1){
        self.count  = self.count + 1;
    }
    self.currentStr = self.data[self.count];
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.scrollerView setContentOffset:CGPointMake(self.imageView.frame.size.width * self.count, 0)];
    }];
}


- (void)ovice{
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:self.currentStr];
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
    utterance.rate = 0.5f;
    utterance.volume = 1.0f;
    [self.synthesizer speakUtterance:utterance];
}

- (NSMutableArray *)data{
    if(_data == nil){
        if(self.type == 0){
            _data = [[NSMutableArray alloc]initWithArray:@[@"chopsticks",
                                                        @"towel",
                                                        @"Cigarette butts",
                                                        @"bowl",
                                                        @"boxes",
                                                        @"Old clothes"]];
        }else if (self.type == 1){
            _data = [[NSMutableArray alloc]initWithArray:@[@"Peanut shells",
                                                        @"leaves",
                                                        @"Fish bone",
                                                        @"A banana peel",
                                                        @"An apple core",
                                                        @"The leaves"]];
        }else if (self.type == 2){
            _data = [[NSMutableArray alloc]initWithArray:@[@"pesticides",
                                                        @"drug",
                                                        @"Waste batteries",
                                                        @"Mobile phone",
                                                        @"The thermometer",
                                                        @"The thermometer"]];
        }else if (self.type == 3){
            _data = [[NSMutableArray alloc]initWithArray:@[@"The cartons",
                                                        @"Mineral water",
                                                        @"cans",
                                                        @"The bottle",
                                                        @"The newspaper",
                                                        @"Old clothes"]];
        }
    }
    return _data;
}


- (NSMutableArray *)imageDatas{
    if(_imageDatas == nil){
        if(self.type == 0){
            _imageDatas = [[NSMutableArray alloc]initWithArray:@[@"chopsticks",
                                                             @"towel",
                                                             @"cigarette_butts",
                                                             @"bowl",
                                                             @"lunch_box",
                                                             @"old_clothes"]];
        }else if (self.type == 1){
            _imageDatas = [[NSMutableArray alloc]initWithArray:@[@"peanut_shells",
                                                             @"cauliflower",
                                                             @"fish_bones",
                                                             @"banana_peel",
                                                             @"apple_core",
                                                             @"leaves"]];
        }else if (self.type == 2){
            _imageDatas = [[NSMutableArray alloc]initWithArray:@[@"insecticide",
                                                             @"drug",
                                                             @"battery",
                                                             @"apple_core",
                                                             @"thermometer",
                                                             @"paint_bucket"]];
        }else if (self.type == 3){
            _imageDatas = [[NSMutableArray alloc]initWithArray:@[@"carton",
                                                             @"plastic_bottle",
                                                             @"cans",
                                                             @"glass",
                                                             @"newspaper",
                                                             @"old_clothes"]];
        }
    }
    return _imageDatas;
}

@end
