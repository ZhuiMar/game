//
//  MysteryBoard_IntroductionVC.m
//  MysteryBoard
//
//  Created by luzhaoyang on 2020/4/22.
//  Copyright © 2020 wansheng. All rights reserved.
//

#import "MysteryBoard_IntroductionVC.h"

@interface MysteryBoard_IntroductionVC ()

@property (weak, nonatomic) IBOutlet UIView *contentBgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *width;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height;

@end

@implementation MysteryBoard_IntroductionVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Introduction";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentBgView.layer.cornerRadius = 20;
    self.contentBgView.layer.masksToBounds = YES;
    self.contentBgView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    
    if iPhone5 {
        self.width.constant = 280;
        self.height.constant = 450;
    }
}

@end
