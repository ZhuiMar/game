//
//  DonutNotes_LearnViewController.m
//  DonutNotes
//
//  Created by luzhaoyang on 2020/4/18.
//  Copyright © 2020 willows. All rights reserved.
//

#import "DonutNotes_LearnViewController.h"

@interface DonutNotes_LearnViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIButton *rightView;
@property (weak, nonatomic) IBOutlet UIButton *leftView;

@property (weak, nonatomic) IBOutlet UIImageView *starOne;
@property (weak, nonatomic) IBOutlet UIImageView *starTwo;
@property (weak, nonatomic) IBOutlet UIImageView *starThree;
@property (weak, nonatomic) IBOutlet UIImageView *starFour;

@property (weak, nonatomic) IBOutlet UILabel *beatLabel;

@property (nonatomic,strong)UIScrollView *scrollerView;

@property (nonatomic,strong)NSMutableArray *bgViews;
@property (nonatomic,strong)NSMutableArray *fuImages;
@property (nonatomic,strong)NSMutableArray *names;
@property (nonatomic,strong)NSMutableArray *stars;
@property (nonatomic,strong)NSMutableArray *beats;

@property (nonatomic,assign)NSInteger currentCount;

@property (nonatomic,strong)UIView *coverView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *WeightLayout;

@end

@implementation DonutNotes_LearnViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Learn notes";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if kiPhone5 {
        self.heightLayout.constant = 220;
        self.WeightLayout.constant = 220;
    }
    
    self.bgView.backgroundColor = [UIColor clearColor];
    [self.bgView addSubview:self.scrollerView];
    
    CGFloat with = self.bgView.frame.size.width;
    CGFloat hight = self.bgView.frame.size.height;
    
    if kiPhone5 {
        with = 220;
        hight = 220;
    }
    
    for(int i = 0; i<self.bgViews.count; i++){
        UIImageView *imageView = [[UIImageView alloc]init];
        CGRect frame = CGRectMake(i * with, 0, with, hight);
        imageView.frame = frame;
        NSString *string = self.bgViews[i];
        imageView.image = [UIImage imageNamed:string];
        
        UIView *centerView = [[UIView alloc]init];
        centerView.layer.cornerRadius = 8;
        centerView.layer.masksToBounds = YES;
        centerView.backgroundColor = [UIColor whiteColor];
        [imageView addSubview:centerView];
        
        [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.mas_equalTo(65);
            make.centerX.mas_equalTo(imageView.mas_centerX);
            make.top.mas_equalTo(kiPhone5?70:90);
        }];
        
        UIImageView *yingfu = [[UIImageView alloc]init];
        [centerView addSubview:yingfu];
        [yingfu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(centerView.mas_centerX);
            make.centerY.mas_equalTo(centerView.mas_centerY);
        }];
        yingfu.image = [UIImage imageNamed:self.fuImages[i]];
        
        UILabel *name = [[UILabel alloc]init];
        name.font = [UIFont fontWithName:FontNameTitle size:30];
        name.textColor = [NSObject DonutNotes_colorWithHexString:@"#83250A"];
        [imageView addSubview:name];
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(imageView.mas_centerX);
            make.bottom.mas_equalTo(imageView.mas_bottom).mas_offset(kiPhone5?-17:-28);
        }];
        name.text = self.names[i];
        [self.scrollerView addSubview:imageView];
    }
    [self.starOne addSubview:self.coverView];
    [self.coverView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(17);
    }];
    
    [self.coverView setHidden:YES];
    self.currentCount = 0;
    [self setValue:self.currentCount];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x/self.bgView.frame.size.width;
    self.currentCount = index;
    [self setValue:self.currentCount];
}

- (IBAction)rightAction:(id)sender {
     if(self.currentCount + 1 <= self.fuImages.count-1){
           self.currentCount  = self.currentCount + 1;
     }
     [self setValue:self.currentCount];
     [UIView animateWithDuration:0.25 animations:^{
           [self.scrollerView setContentOffset:CGPointMake(self.bgView.frame.size.width * self.currentCount, 0)];
     }];
}
- (IBAction)leftAction:(id)sender {
    if(self.currentCount - 1 >= 0){
        self.currentCount  = self.currentCount - 1;
    }
    [self setValue:self.currentCount];
    [UIView animateWithDuration:0.25 animations:^{
        [self.scrollerView setContentOffset:CGPointMake(self.bgView.frame.size.width * self.currentCount, 0)];
    }];
}

- (void)setValue:(NSInteger)index{
    self.beatLabel.text = self.beats[index];
    [self setStartCount:index];
}

- (void)setStartCount:(NSInteger)index{
    NSNumber *num = self.stars[index];
    CGFloat count = [num floatValue];
    
    if(count == 0.5){
        self.starOne.image = [UIImage imageNamed:@"star"];
        self.starTwo.image = [UIImage imageNamed:@""];
        self.starThree.image = [UIImage imageNamed:@""];
        self.starFour.image = [UIImage imageNamed:@""];
        [self.coverView setHidden:NO];
        
    }else if (count == 1){
        
        self.starOne.image = [UIImage imageNamed:@"star"];
        self.starTwo.image = [UIImage imageNamed:@""];
        self.starThree.image = [UIImage imageNamed:@""];
        self.starFour.image = [UIImage imageNamed:@""];
        [self.coverView setHidden:YES];
        
    }else if (count == 2){
        
        self.starOne.image = [UIImage imageNamed:@"star"];
        self.starTwo.image = [UIImage imageNamed:@"star"];
        self.starThree.image = [UIImage imageNamed:@""];
        self.starFour.image = [UIImage imageNamed:@""];
        [self.coverView setHidden:YES];
        
    }else if (count == 3){
        
        self.starOne.image = [UIImage imageNamed:@"star"];
        self.starTwo.image = [UIImage imageNamed:@"star"];
        self.starThree.image = [UIImage imageNamed:@"star"];
        self.starFour.image = [UIImage imageNamed:@""];
        [self.coverView setHidden:YES];
        
    }else if (count == 4){
        
        self.starOne.image = [UIImage imageNamed:@"star"];
        self.starTwo.image = [UIImage imageNamed:@"star"];
        self.starThree.image = [UIImage imageNamed:@"star"];
        self.starFour.image = [UIImage imageNamed:@"star"];
        [self.coverView setHidden:YES];
    }
}

- (UIScrollView *)scrollerView{
    if(_scrollerView == nil){
        CGRect frame = self.bgView.bounds;
        
        if kiPhone5 {
            frame = CGRectMake(0, 0, 220, 220);
        }
        
        _scrollerView = [[UIScrollView alloc]initWithFrame:frame];
        _scrollerView.backgroundColor = [UIColor clearColor];
        _scrollerView.contentSize = CGSizeMake(self.bgView.frame.size.width * self.bgViews.count, self.bgView.frame.size.height);
        if kiPhone5 {
            _scrollerView.contentSize = CGSizeMake(220 * self.bgViews.count, 220);
        }
        _scrollerView.bounces = NO;
        _scrollerView.delegate = self;
        _scrollerView.pagingEnabled = YES;
        _scrollerView.scrollEnabled = YES;
        _scrollerView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollerView;
}

- (NSMutableArray *)bgViews{
    if(_bgViews == nil){
        _bgViews = [[NSMutableArray alloc]init];
        do{
            NSInteger index = [NSObject DonutNotes_getRandomNumber:1 to:6];
            NSString *str  = [NSString stringWithFormat:@"bg_%ld",index];
            [_bgViews addObject:str];
        }while (_bgViews.count < 8);
        
        if(_bgViews.count != 8){
            _bgViews = [[NSMutableArray alloc]initWithArray:@[@"bg_1",
                                                           @"bg_2",
                                                           @"bg_3",
                                                           @"bg_4",
                                                           @"bg_5",
                                                           @"bg_6",
                                                           @"bg_2",
                                                           @"bg_3"]];
        }
    }
    return _bgViews;
}
- (NSMutableArray *)fuImages{
    if(_fuImages == nil){
       _fuImages = [[NSMutableArray alloc]initWithArray:@[@"note",
                                                      @"note3",
                                                      @"note4",
                                                      @"note5",
                                                      @"note6",
                                                      @"note8",
                                                      @"note10",
                                                      @"note11"]];
           
    }
    return _fuImages;
}
- (NSMutableArray *)stars{
    if(_stars == nil){
        _stars = [[NSMutableArray alloc]initWithArray:@[@(0.5),@(0.5),@(3),@(4),@(1),@(1),@(4),@(2)]];
    }
    return _stars;
}
- (NSMutableArray *)beats{
    if(_beats == nil){
        _beats = [[NSMutableArray alloc]initWithArray:@[@"Half racket",@"Half racket",@"Two beat",@"Four beat",@"One beat",@"One beat",@"Four beat",@"Two brat"]];
    }
    return _beats;
}
- (NSMutableArray *)names{
    if(_names == nil){
        _names = [[NSMutableArray alloc]initWithArray:@[@"quaver",@"quaver rest",@"half note",@"Whole note",@"quarter note",@"Quarter rest",@"whole rest",@"half rest"]];
    }
    return _names;
}
- (UIView *)coverView{
    if(_coverView == nil){
       _coverView = [[UIView alloc]init];
       _coverView.backgroundColor = [UIColor whiteColor];
       _coverView.backgroundColor = [NSObject DonutNotes_colorWithHexString:@"#FFE88B"];
    }
    return _coverView;
}
@end
