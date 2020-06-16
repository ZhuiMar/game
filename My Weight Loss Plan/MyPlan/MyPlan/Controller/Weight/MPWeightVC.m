//
//  MPWeightVC.m
//  MyPlan
//
//  Created by  luzhaoyang on 2020/3/20.
//  Copyright © 2020 yunxi. All rights reserved.
//

#import "MPWeightVC.h"

@interface MPWeightVC ()<UIScrollViewDelegate>

@property(strong,nonatomic)UIScrollView *baseScrollView;

@property (weak, nonatomic) IBOutlet UIView *topBg;
@property (weak, nonatomic) IBOutlet UILabel *bottomTitle;
@property (weak, nonatomic) IBOutlet UILabel *leftValue;
@property (weak, nonatomic) IBOutlet UILabel *rightValue;

@property (weak, nonatomic) IBOutlet UILabel *leftSub;
@property (weak, nonatomic) IBOutlet UILabel *rightSub;

@property (weak, nonatomic) IBOutlet UIImageView *leftImage;
@property (weak, nonatomic) IBOutlet UIImageView *rightImage;

@end

@implementation MPWeightVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Weight";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RLMResults *result = [SetModel objectsWhere:@"type == %@",@"weightSet"];
    SetModel *model = result.firstObject;
    
    NSString *string = model.targetWeight;
    NSArray *arr = [model.weight componentsSeparatedByString:@"="];
    
    NSString *weight = arr.lastObject;
    
    NSInteger we = [weight integerValue];
    NSInteger ta = [string integerValue];
    
    NSInteger va = ta - we;
    
    if(va >= 0){
        self.rightValue.text = [NSString stringWithFormat:@"%ld d",va];
        self.leftImage.image = [UIImage imageNamed:@"decline"];
    }else{
        self.rightValue.text = [NSString stringWithFormat:@"%ld d",-va];
        self.leftImage.image = [UIImage imageNamed:@"rise"];
    }
    
    NSString *daoER;
    if(arr.count > 1){
        daoER = arr[arr.count-2];
    }
    NSInteger dao = [daoER integerValue];
    NSInteger va2 = we - dao;
    if(va2 >= 0){
        self.leftValue.text = [NSString stringWithFormat:@"%ld d",va2];
        self.rightImage.image = [UIImage imageNamed:@"rise"];
    }else{
        self.leftValue.text = [NSString stringWithFormat:@"%ld d",-va2];
        self.rightImage.image = [UIImage imageNamed:@"decline"];
    }
    [self lineGraphView]; 
}


- (void)lineGraphView {

    FBYLineGraphView *LineGraphView = [[FBYLineGraphView alloc] initWithFrame:CGRectMake(10, 0, Iphone_Width - 20, 220)];
    LineGraphView.backgroundColor = [UIColor clearColor];
    LineGraphView.title = @"";
    LineGraphView.maxValue = 200;
    LineGraphView.yMarkTitles = @[@"0",@"40",@"80",@"120",@"160",@"200"];
    
    RLMResults *result = [SetModel objectsWhere:@"type == %@",@"weightSet"];
    SetModel *model = result.firstObject;
    NSArray *arr = [model.weight componentsSeparatedByString:@"="];
    
    NSInteger one = 0;
    NSInteger two = 0;
    NSInteger three = 0;
    NSInteger four = 0;
    NSInteger five = 0;
    NSInteger six = 0;
    NSInteger seven = 0;
    
    if( arr.count == 1){
        one = [arr[0] integerValue];
    }
    if( arr.count > 2){
        one = [arr[0] integerValue];
        two = [arr[1] integerValue];
    }
    if( arr.count > 3 ){
        one = [arr[0] integerValue];
        two = [arr[1] integerValue];
        three = [arr[2] integerValue];
    }
    if( arr.count > 4 ){
        one = [arr[0] integerValue];
        two = [arr[1] integerValue];
        three = [arr[2] integerValue];
        four = [arr[3] integerValue];
    }
    if( arr.count > 5 ){
        one = [arr[0] integerValue];
        two = [arr[1] integerValue];
        three = [arr[2] integerValue];
        four = [arr[3] integerValue];
        five = [arr[4] integerValue];
    }
    if( arr.count > 6 ){
        one = [arr[0] integerValue];
        two = [arr[1] integerValue];
        three = [arr[2] integerValue];
        four = [arr[3] integerValue];
        five = [arr[4] integerValue];
        six = [arr[5] integerValue];
    }
    if( arr.count > 7 ){
        one = [arr[0] integerValue];
        two = [arr[1] integerValue];
        three = [arr[2] integerValue];
        four = [arr[3] integerValue];
        five = [arr[4] integerValue];
        six = [arr[5] integerValue];
        seven = [arr[6] integerValue];
    }
    
    [LineGraphView setXMarkTitlesAndValues:@[@{@"item":@"Mon",@"count":@(one)},@{@"item":@"Tues",@"count":@(two)},@{@"item":@"Wed",@"count":@(three)},@{@"item":@"Thur",@"count":@(four)},@{@"item":@"Fri",@"count":@(five)},@{@"item":@"Sat",@"count":@(six)},@{@"item":@"Sun",@"count":@(seven)}] titleKey:@"item" valueKey:@"count"];
    [LineGraphView mapping];
    self.topBg.backgroundColor = [UIColor clearColor];
    [self.topBg addSubview:LineGraphView];
}

@end
