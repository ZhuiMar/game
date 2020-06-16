//
//  HWGJieShaoVC.m
//  HandWrittenGothic
//
//  Created by  luzhaoyang on 2020/3/18.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import "HWGJieShaoVC.h"

@interface HWGJieShaoVC ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *H;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *W;

@end

@implementation HWGJieShaoVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    UIImageView *imaheView = [[UIImageView alloc]init];
    imaheView.frame = CGRectMake(0, 0, 100, 20);
    imaheView.image = [UIImage imageNamed:@"3_Blackletter"];
    self.navigationItem.titleView = imaheView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if kiPhone5 {
       self.H.constant = 400;
       self.W.constant = 300;
    }
}

@end
