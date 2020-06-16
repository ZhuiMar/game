//
//  ECTipsViewController.m
//  EnvironmentCognize
//
//  Created by luzhaoyang on 2020/4/7.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "ECTipsViewController.h"

#define oneTip @"The purpose of waste classification is to divert and treat waste, use existing production capacity, recycle recycled products, including material use and energy use, and dispose of waste that is temporarily unavailable.The benefits of garbage sorting are obvious.The waste is sorted and sent to factories instead of landfills, which saves land, avoids pollution from landfills or incineration, and can be turned into waste"

#define twoTip @"In this battle of people and trash, people turned trash from friends into friends.Therefore, waste separation and collection can reduce the amount of waste treatment and equipment, reduce the cost of treatment, reduce the consumption of land resources, and have social, economic, and ecological benefits."

@interface ECTipsViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic,strong)UIScrollView *scrollerView;
@property (nonatomic,strong)NSMutableArray *datas;
@property (nonatomic,assign)NSInteger count;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *W;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *H;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttionTop;

@end

@implementation ECTipsViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Tips";
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.imageView addSubview:self.scrollerView];
    
    if kiPhone5 {
        self.W.constant = 280;
        self.H.constant = 480;
        self.buttionTop.constant = -10;
    }
    
    for(int i = 0; i<self.datas.count; i++){
        
        UILabel *label = [[UILabel alloc]init];
        label.textAlignment = NSTextAlignmentCenter;
    
        if kiPhone5 {
             CGRect frame1 = CGRectMake(i * 280, 40, 280, 480-80-40);
             label.font = [UIFont fontWithName:FontNameTitle size:20];
             label.frame = frame1;
        }else{
            CGRect frame1 = CGRectMake(i * self.imageView.frame.size.width+40, 40, self.imageView.frame.size.width-80, self.imageView.frame.size.height - 80);
            label.font = [UIFont fontWithName:FontNameTitle size:24];
            label.frame = frame1;
        }

        label.text = self.datas[i];
        label.textColor = [NSObject colorWithHexString:@"#65314C"];
        label.numberOfLines = 0;
        
        [self.scrollerView addSubview:label];
    }
    self.count = 0;
}

- (IBAction)leftAction:(id)sender {
    if(self.count - 1 >= 0){
        self.count  = self.count - 1;
    }
    [UIView animateWithDuration:0.25 animations:^{
        [self.scrollerView setContentOffset:CGPointMake(self.imageView.frame.size.width * self.count, 0)];
    }];
}

- (IBAction)rightAction:(id)sender {
    if(self.count + 1 <= self.datas.count-1){
        self.count  = self.count + 1;
    }
    [UIView animateWithDuration:0.25 animations:^{
        [self.scrollerView setContentOffset:CGPointMake(self.imageView.frame.size.width * self.count, 0)];
    }];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x/self.imageView.frame.size.width;
    self.count = index;
}

- (UIScrollView *)scrollerView{
    if(_scrollerView == nil){
        
        if kiPhone5 {
            CGRect frame = CGRectMake(0, 0, 280, 480);
            _scrollerView = [[UIScrollView alloc]initWithFrame:frame];
        }else{
            CGRect frame = CGRectMake(0, 0, self.imageView.frame.size.width, self.imageView.frame.size.height);
            _scrollerView = [[UIScrollView alloc]initWithFrame:frame];
        }
        
        CGRect frame = CGRectMake(0, 0, self.imageView.frame.size.width, self.imageView.frame.size.height);
        _scrollerView = [[UIScrollView alloc]initWithFrame:frame];
        _scrollerView.backgroundColor = [UIColor clearColor];
        _scrollerView.contentSize = CGSizeMake(self.imageView.frame.size.width * 2, self.imageView.frame.size.height);
        _scrollerView.bounces = NO;
        _scrollerView.delegate = self;
        _scrollerView.pagingEnabled = YES;
        _scrollerView.scrollEnabled = YES;
        _scrollerView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollerView;
}

- (NSMutableArray *)datas {
    if(_datas == nil){
        _datas = [[NSMutableArray alloc]initWithArray:@[oneTip,twoTip]];
    }
    return _datas;
}

@end

