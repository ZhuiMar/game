//
//  SmartNumber_RecordViewController.m
//  SmartNumberOff
//
//  Created by zy on 2020/4/29.
//  Copyright © 2020 ximan. All rights reserved.
//

#import "SmartNumber_RecordViewController.h"

@interface SmartNumber_RecordViewController ()

@property(nonatomic,strong)UIImageView *imageView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *simTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *middTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *diffTop;

@property (weak, nonatomic) IBOutlet UILabel *one;
@property (weak, nonatomic) IBOutlet UILabel *two;
@property (weak, nonatomic) IBOutlet UILabel *three;

@end

@implementation SmartNumber_RecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.imageView;
    
    self.simTop.constant = -15;
    self.middTop.constant = 0;
    self.diffTop.constant = 0;
    
    NSArray *arr = [NSObject SmartNumber_getRankingKey:@"SmartNumber_simple"];
    [self setScoreWithArr:arr];
}

- (IBAction)simpleAction:(id)sender {
    self.simTop.constant = -15;
    self.middTop.constant = 0;
    self.diffTop.constant = 0;
    NSArray *arr = [NSObject SmartNumber_getRankingKey:@"SmartNumber_simple"];
    [self setScoreWithArr:arr];
}

- (IBAction)general:(id)sender {
    self.simTop.constant = 0;
    self.middTop.constant = -15;
    self.diffTop.constant = 0;
    NSArray *arr = [NSObject SmartNumber_getRankingKey:@"SmartNumber_general"];
    [self setScoreWithArr:arr];
}
- (IBAction)diffcultAction:(id)sender {
    self.simTop.constant = 0;
    self.middTop.constant = 0;
    self.diffTop.constant = -15;
    NSArray *arr = [NSObject SmartNumber_getRankingKey:@"SmartNumber_difficult"];
    [self setScoreWithArr:arr];
}
- (UIImageView *)imageView{
    if(_imageView == nil){
        _imageView = [[UIImageView alloc]init];
        _imageView.frame = CGRectMake(0, 0, 116*(2/3), 41*(2/3));
        _imageView.image = [UIImage imageNamed:@"record-1"];
    }
    return _imageView;
}


- (void)setScoreWithArr:(NSArray *)arr{
    
    if(arr.count >= 3){
        
        self.one.text = [NSString stringWithFormat:@"%ld",[arr[0] integerValue]];
        self.two.text = [NSString stringWithFormat:@"%ld",[arr[1] integerValue]];
        self.three.text = [NSString stringWithFormat:@"%ld",[arr[2] integerValue]];
        
    }else if (arr.count == 2){
        
        self.one.text = [NSString stringWithFormat:@"%@",arr[0]];
        self.two.text = [NSString stringWithFormat:@"%@",arr[1]];
        self.three.text = @"0";
        
    }else if (arr.count == 1){
        
        self.one.text = [NSString stringWithFormat:@"%@",arr[0]];
        self.two.text = @"0";
        self.three.text = @"0";
        
    }else{
        
        self.one.text = @"0";
        self.two.text = @"0";
        self.three.text = @"0";
    }
}

@end

