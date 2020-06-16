//
//  ArithmeticMagicCup_RankPage.m
//  ArithmeticMagicCup
//
//  Created by zy on 2020/4/23.
//  Copyright © 2020 qingmai. All rights reserved.
//

#import "ArithmeticMagicCup_RankPage.h"

@interface ArithmeticMagicCup_RankPage ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *swifthBg;
@property (weak, nonatomic) IBOutlet UIButton *easyBtn;
@property (weak, nonatomic) IBOutlet UIButton *hardBtn;

@property (nonatomic,strong)UIScrollView *scrollerView;
@property (nonatomic,assign)NSInteger count;

@property (nonatomic,assign)UILabel *easyOne;
@property (nonatomic,assign)UILabel *easyTwo;
@property (nonatomic,assign)UILabel *easyThree;

@property (nonatomic,assign)UILabel *hardOne;
@property (nonatomic,assign)UILabel *hardTwo;
@property (nonatomic,assign)UILabel *hardThree;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fenTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fenHeight;


@end

@implementation ArithmeticMagicCup_RankPage

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:FontName size:TitleSize],NSForegroundColorAttributeName:[UIColor blackColor]}];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if kiPhone5 {
        self.fenTop.constant = 24;
        self.fenHeight.constant = 34;
    }
    
    self.swifthBg.layer.cornerRadius = 10;
    self.swifthBg.layer.masksToBounds = YES;
    self.swifthBg.layer.borderColor = [NSObject ArithmeticMagicCup_colorWithHexString:@"#FF834C"].CGColor;
    self.swifthBg.layer.borderWidth = 1;
    self.easyBtn.titleLabel.font = [UIFont fontWithName:FontName size:22];
    self.hardBtn.titleLabel.font = [UIFont fontWithName:FontName size:22];
    
    self.easyBtn.backgroundColor = [NSObject ArithmeticMagicCup_colorWithHexString:@"#FF834C"];
    [self.easyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.hardBtn.backgroundColor = [UIColor whiteColor];
    [self.hardBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:self.scrollerView];
    
    NSArray *arr = @[@"Easy",@"Hard"];
    
    for (int i=0; i<2; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        CGRect frame = CGRectMake(i * (430 + 30), 0, 430, 251);
        imageView.frame = frame;
        imageView.image = [UIImage imageNamed:@"easy(1)"];
        [self.scrollerView addSubview:imageView];
        
        UILabel *title = [[UILabel alloc]init];
        title.textColor = [NSObject ArithmeticMagicCup_colorWithHexString:@"#000000"];
        title.font = [UIFont fontWithName:FontName size:30];
        title.text = arr[i];
        [imageView addSubview:title];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(imageView.mas_centerX);
            make.top.mas_equalTo(28.5);
        }];
        
        UILabel *one = [[UILabel alloc]init];
        one.textColor = [NSObject ArithmeticMagicCup_colorWithHexString:@"#000000"];
        one.font = [UIFont fontWithName:FontName size:27];
        one.text = @"1";
        [imageView addSubview:one];
        [one mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(55);
            make.top.mas_equalTo(title.mas_bottom).mas_offset(20);
            make.height.mas_equalTo(25);
        }];
        
        UILabel *two = [[UILabel alloc]init];
        two.textColor = [NSObject ArithmeticMagicCup_colorWithHexString:@"#000000"];
        two.font = [UIFont fontWithName:FontName size:27];
        two.text = @"2";
        [imageView addSubview:two];
        [two mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(55);
            make.top.mas_equalTo(one.mas_bottom).mas_offset(20);
            make.height.mas_equalTo(25);
        }];
        
        UILabel *three = [[UILabel alloc]init];
        three.textColor = [NSObject ArithmeticMagicCup_colorWithHexString:@"#000000"];
        three.font = [UIFont fontWithName:FontName size:27];
        three.text = @"3";
        [imageView addSubview:three];
        [three mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(55);
            make.top.mas_equalTo(two.mas_bottom).mas_offset(20);
            make.height.mas_equalTo(25);
        }];
        
        UILabel *oneV = [[UILabel alloc]init];
        oneV.textColor = [NSObject ArithmeticMagicCup_colorWithHexString:@"#FF834C"];
        oneV.font = [UIFont fontWithName:FontName size:27];
        oneV.text = @"Stage 0";
        [imageView addSubview:oneV];
        [oneV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-32);
            make.centerY.mas_equalTo(one.mas_centerY);
            make.height.mas_equalTo(25);
        }];
        
        UILabel *twoV = [[UILabel alloc]init];
        twoV.textColor = [NSObject ArithmeticMagicCup_colorWithHexString:@"#FF834C"];
        twoV.font = [UIFont fontWithName:FontName size:27];
        twoV.text = @"Stage 0";
        [imageView addSubview:twoV];
        [twoV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-32);
            make.centerY.mas_equalTo(two.mas_centerY);
            make.height.mas_equalTo(25);
        }];
        
        UILabel *threeV = [[UILabel alloc]init];
        threeV.textColor = [NSObject ArithmeticMagicCup_colorWithHexString:@"#FF834C"];
        threeV.font = [UIFont fontWithName:FontName size:27];
        threeV.text = @"Stage 0";
        [imageView addSubview:threeV];
        [threeV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-32);
            make.centerY.mas_equalTo(three.mas_centerY);
            make.height.mas_equalTo(25);
        }];
        if(i == 0){
            self.easyOne = oneV;
            self.easyTwo = twoV;
            self.easyThree = threeV;
        }
        if(i == 1){
            self.hardOne = oneV;
            self.hardTwo = twoV;
            self.hardThree = threeV;
        }
    }
    
    [self setVaule];
}

- (IBAction)easyAction:(id)sender {
    self.easyBtn.backgroundColor = [NSObject ArithmeticMagicCup_colorWithHexString:@"#FF834C"];
    [self.easyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.hardBtn.backgroundColor = [UIColor whiteColor];
    [self.hardBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [UIView animateWithDuration:0.3 animations:^{
        [self.scrollerView setContentOffset:CGPointMake(0, 0)];
    }];
}
- (IBAction)hardAction:(id)sender {
    self.hardBtn.backgroundColor = [NSObject ArithmeticMagicCup_colorWithHexString:@"#FF834C"];
    [self.hardBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.easyBtn.backgroundColor = [UIColor whiteColor];
    [self.easyBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [UIView animateWithDuration:0.3 animations:^{
        [self.scrollerView setContentOffset:CGPointMake((430*2 + 30) - (Iphone_Width-46-46), 0)];
    }];
}

- (UIScrollView *)scrollerView{
    if(_scrollerView == nil){
        
        CGFloat TOP = 117;
        if kiPhone5 {
            TOP = 65;
        }
    
        CGRect frame = CGRectMake(46, TOP, Iphone_Width-46, 251);
        _scrollerView = [[UIScrollView alloc]initWithFrame:frame];
        _scrollerView.backgroundColor = [UIColor clearColor];
        _scrollerView.showsHorizontalScrollIndicator = NO;
        _scrollerView.contentSize = CGSizeMake(430*2 + 30, 251);
        _scrollerView.bounces = YES;
        _scrollerView.delegate = self;
        _scrollerView.pagingEnabled = YES;
        _scrollerView.scrollEnabled = YES;
        _scrollerView.layer.cornerRadius = 10;
        _scrollerView.layer.masksToBounds = YES;
    }
    return _scrollerView;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x;
    NSLog(@"%ld",index);
    self.count = index;
    
    if(self.count == 0){
        self.easyBtn.backgroundColor = [NSObject ArithmeticMagicCup_colorWithHexString:@"#FF834C"];
        [self.easyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.hardBtn.backgroundColor = [UIColor whiteColor];
        [self.hardBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }else{
        self.hardBtn.backgroundColor = [NSObject ArithmeticMagicCup_colorWithHexString:@"#FF834C"];
        [self.hardBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.easyBtn.backgroundColor = [UIColor whiteColor];
        [self.easyBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}

- (void)setVaule{
    NSArray *easy = [NSObject ArithmeticMagicCup_getRankingKey:@"ArithmeticMagicCup_easy"];
    
    if(easy.count >= 3){
        NSNumber *number1 = easy[0];
        NSNumber *number2 = easy[1];
        NSNumber *number3 = easy[2];
        self.easyOne.text = [NSString stringWithFormat:@"Stage %ld",[number1 integerValue]];
        self.easyTwo.text = [NSString stringWithFormat:@"Stage %ld",[number2 integerValue]];
        self.easyThree.text = [NSString stringWithFormat:@"Stage %ld",[number3 integerValue]];
        
    }else if(easy.count == 2){
        NSNumber *number1 = easy[0];
        NSNumber *number2 = easy[1];
        self.easyOne.text = [NSString stringWithFormat:@"Stage %ld",[number1 integerValue]];
        self.easyTwo.text = [NSString stringWithFormat:@"Stage %ld",[number2 integerValue]];
        self.easyThree.text = @"Stage 0";
    }else if(easy.count == 1){
        NSNumber *number1 = easy[0];
        self.easyOne.text = [NSString stringWithFormat:@"Stage %ld",[number1 integerValue]];
        self.easyTwo.text = @"Stage 0";
        self.easyThree.text = @"Stage 0";
    }else{
        self.easyOne.text = @"Stage 0";
        self.easyTwo.text = @"Stage 0";
        self.easyThree.text = @"Stage 0";
    }
    
    
    NSArray *hard = [NSObject ArithmeticMagicCup_getRankingKey:@"ArithmeticMagicCup_hard"];
    
    if(hard.count >= 3){
        
        NSNumber *number1 = hard[0];
        NSNumber *number2 = hard[1];
        NSNumber *number3 = hard[2];
        self.hardOne.text = [NSString stringWithFormat:@"Stage %ld",[number1 integerValue]];
        self.hardTwo.text = [NSString stringWithFormat:@"Stage %ld",[number2 integerValue]];
        self.hardThree.text = [NSString stringWithFormat:@"Stage %ld",[number3 integerValue]];
        
    }else if(hard.count == 2){
        
        NSNumber *number1 = hard[0];
        NSNumber *number2 = hard[1];
        self.hardOne.text = [NSString stringWithFormat:@"Stage %ld",[number1 integerValue]];
        self.hardTwo.text = [NSString stringWithFormat:@"Stage %ld",[number2 integerValue]];
        self.hardThree.text = @"Stage 0";
        
    }else if(hard.count == 1){
        
        NSNumber *number1 = hard[0];
        self.hardOne.text = [NSString stringWithFormat:@"Stage %ld",[number1 integerValue]];
        self.hardTwo.text = @"Stage 0";
        self.hardThree.text = @"Stage 0";
        
    }else{
        self.hardOne.text = @"Stage 0";
        self.hardTwo.text = @"Stage 0";
        self.hardThree.text = @"Stage 0";
    }
    
}

@end
