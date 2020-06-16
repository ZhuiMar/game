//
//  NMStudyNextViewController.m
//  NumberOfMemory
//
//  Created by  luzhaoyang on 2020/4/2.
//  Copyright © 2020 huadu. All rights reserved.
//

#import "NMStudyNextViewController.h"

@interface NMStudyNextViewController ()

@property(nonatomic,assign) NSInteger type;
@property(nonatomic,copy) NSString *titles;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@end

@implementation NMStudyNextViewController


- (instancetype)initWithType:(NSInteger)type title:(NSString *)title{
    if (self = [super init]){
        self.type = type;
        self.titles = title;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = self.titles;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    if(self.type == 0){
        [self addUI];
    }else{
        [self muUI];
    }
}

- (void)addUI{
    
    CGFloat W =  (self.bgImageView.frame.size.width - 20)/9;
    CGFloat left = 0;
    
    if(IS_IPHONE_X_orMore){
        left = 70;
    }
    if kiPhone5 {
        W = (self.bgImageView.frame.size.width - 20)/9 - 15;
        left = 15;
    }
    
    
    for (int i = 1; i < 10; i ++) {
        
        UILabel *tittle = [[UILabel alloc]init];
        CGRect frame = CGRectMake(i * W - W + 10 + left, 5 + 10,W, 30);
        tittle.frame = frame;
        tittle.text = [NSString stringWithFormat:@"%d",i];
        tittle.font = [UIFont fontWithName:FontName size:27];
        tittle.textAlignment = NSTextAlignmentCenter;
        tittle.textColor = [NSObject colorWithHexString:@"#7C3E13"];
        [self.bgImageView addSubview:tittle];
        
        for (int j = 1; j < 11 - i; j ++) {
            UILabel *tittle1 = [[UILabel alloc]init];
            CGRect frame = CGRectMake(i * W - W + 10 + left, 5 + 20 + (j * 25), W, 25);
            tittle1.frame = frame;
            tittle1.text = [NSString stringWithFormat:@"%d+%d=%d",i , j - 1, j + (i - 1)];
            tittle1.font = [UIFont fontWithName:FontName size:13];
            tittle1.textAlignment = NSTextAlignmentCenter;
            tittle1.textColor = [NSObject colorWithHexString:@"#7C3E13"];
            [self.bgImageView addSubview:tittle1];
        }
    }
}

- (void)muUI{
    
    CGFloat W =  (self.bgImageView.frame.size.width - 20)/9;
    CGFloat left = 0;
    
    if(IS_IPHONE_X_orMore){
        left = 70;
    }
    
    if kiPhone5 {
        W = (self.bgImageView.frame.size.width - 20)/9 - 15;
        left = 15;
    }
    
    for (int i = 1; i < 10; i ++) {
        
        UILabel *tittle = [[UILabel alloc]init];
        CGRect frame = CGRectMake(i * W - W + 10 + left, 5 + 10, W, 30);
        tittle.frame = frame;
        tittle.text = [NSString stringWithFormat:@"%d",i];
        tittle.font = [UIFont fontWithName:FontName size:27];
        tittle.textAlignment = NSTextAlignmentCenter;
        tittle.textColor = [NSObject colorWithHexString:@"#7C3E13"];
        [self.bgImageView addSubview:tittle];
        
        for (int j = i; j < 10; j ++) {
            UILabel *tittle1 = [[UILabel alloc]init];
            CGRect frame = CGRectMake(i * W - W + 10 + left, 5 + 20 + (j * 25), W, 25);
            tittle1.frame = frame;
            tittle1.text = [NSString stringWithFormat:@"%dx%d=%d",i , j, i * j];
            tittle1.font = [UIFont fontWithName:FontName size:13];
            tittle1.textAlignment = NSTextAlignmentCenter;
            tittle1.textColor = [NSObject colorWithHexString:@"#7C3E13"];
            [self.bgImageView addSubview:tittle1];
        }
    }
}

@end

