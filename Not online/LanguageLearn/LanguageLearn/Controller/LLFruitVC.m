//
//  LLFruitVC.m
//  LanguageLearn
//
//  Created by  luzhaoyang on 2020/3/19.
//  Copyright © 2020 haike. All rights reserved.
//

#import "LLFruitVC.h"

@interface LLFruitVC ()<UIScrollViewDelegate>

@property(nonatomic, copy) NSString *string;
@property(nonatomic, strong) UIScrollView *scrollerView;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (nonatomic,strong) NSTimer *timer;

@property (nonatomic,strong) NSMutableArray *friuts;
@property (nonatomic,strong) NSMutableArray *animails;
@property (nonatomic,strong) NSMutableArray *friutsJa;
@property (nonatomic,strong) NSMutableArray *animailsJa;

@property (nonatomic,strong) NSMutableArray *datas;
@property (nonatomic,strong) NSMutableArray *datasJa;
@property (nonatomic,strong) NSMutableArray *names;

@property (nonatomic,assign)NSInteger count;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;

@end

@implementation LLFruitVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = self.string;
}

- (instancetype)initWithType:(NSString *)type{
    if(self = [super init]){
        self.string = type;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.bgView.backgroundColor = [UIColor clearColor];
    [self.bgView addSubview:self.scrollerView];
    self.count = 0;
    [self addImageView];
    
    if  IS_IPHONE_X_orMore {
        self.topLayout.constant = 230;
    }
}

- (void)starTimer{
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerChange) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void)timerChange{
//    self.count = self.count + 1;
}

- (IBAction)englishBtnAction:(id)sender {
    NSString *name = self.datas[self.count];
    UILabel *label = self.names[self.count];
    label.text = name;
}

- (IBAction)japaneseAction:(id)sender {
    NSString *name = self.datasJa[self.count];
    UILabel *label = self.names[self.count];
    label.text = name;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x/338;
    NSLog(@"%ld",index);
    self.count = index;
}

- (void)addImageView{
    for (int i = 0; i < self.datas.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.backgroundColor = [UIColor clearColor];
        CGFloat x = i * 338;
        CGFloat y = 0;
        CGFloat w = 338;
        CGFloat h = 248;
        imageView.frame = CGRectMake(x, y, w, h);
        imageView.image = [UIImage imageNamed:@"box"];
        [self.scrollerView addSubview:imageView];
        
        UIImageView *pictureImageView = [[UIImageView alloc]init];
        [imageView addSubview:pictureImageView];
        [pictureImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(142);
            make.height.mas_equalTo(86);
            make.top.mas_equalTo(46);
            make.centerX.mas_equalTo(imageView.mas_centerX);
        }];
        pictureImageView.image = [UIImage imageNamed:self.datas[i]];
        
        UILabel *nameLabel = [[UILabel alloc]init];
        [imageView addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
             make.centerX.mas_equalTo(imageView.mas_centerX);
             make.top.mas_equalTo(pictureImageView.mas_bottom).offset(20);
        }];
        nameLabel.font = [UIFont fontWithName:FontName size:24];
        nameLabel.textColor = [UIColor colorWithHexString:@"#E01E47"];
        nameLabel.text = self.datas[i];
        [self.names addObject:nameLabel];
    }
}

- (UIScrollView *)scrollerView{
    if(_scrollerView == nil){
       _scrollerView = [[UIScrollView alloc]initWithFrame:self.bgView.bounds];
       _scrollerView.contentSize = CGSizeMake(338*self.datas.count, 224);
       _scrollerView.backgroundColor = [UIColor clearColor];
       _scrollerView.bounces = NO;
       _scrollerView.pagingEnabled = YES;
       _scrollerView.delegate = self;
       _scrollerView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollerView;
}

- (NSMutableArray *)friuts{
    if(_friuts == nil){
       _friuts = [[NSMutableArray alloc]initWithArray:@[@"apple",
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
                                                     @"watermelon"]];
    }
    return _friuts;
}

- (NSMutableArray *)animails{
    if(_animails == nil){
       _animails = [[NSMutableArray alloc]initWithArray:@[@"antelope",
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
    return _animails;
}



- (NSMutableArray *)friutsJa{
    if(_friutsJa == nil){
        _friutsJa = [[NSMutableArray alloc]initWithArray:@[@"アップル",
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
                                                        @"スイカ"]];
    }
    return _friutsJa;
}
- (NSMutableArray *)animailsJa{
    if(_animailsJa == nil){
        _animailsJa = [[NSMutableArray alloc]initWithArray:@[@"アンテロープ",
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
    return _animailsJa;
}


- (NSMutableArray *)datas{
    if(_datas == nil){
        _datas = [[NSMutableArray alloc]init];
        if([self.string isEqualToString:@"fruit"]){
            for (NSString *string in self.friuts) {
                [_datas addObject:string];
            }
        }else{
            for (NSString *string in self.animails) {
                [_datas addObject:string];
            }
        }
    }
    return _datas;
}
- (NSMutableArray *)datasJa{
    if(_datasJa == nil){
        _datasJa = [[NSMutableArray alloc]init];
        if([self.string isEqualToString:@"fruit"]){
            for (NSString *string in self.friutsJa) {
                [_datasJa addObject:string];
            }
        }else{
            for (NSString *string in self.animailsJa) {
                [_datasJa addObject:string];
            }
        }
    }
    return _datasJa;
}

- (NSMutableArray *)names{
    if(_names == nil){
       _names = [[NSMutableArray alloc]init];
    }
    return _names;
}
@end

