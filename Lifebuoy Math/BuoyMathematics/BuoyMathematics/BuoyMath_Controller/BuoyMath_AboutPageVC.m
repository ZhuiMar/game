//
//  BuoyMath_AboutPageVC.m
//  BuoyMathematics
//
//  Created by zy on 2020/4/26.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "BuoyMath_AboutPageVC.h"

@interface BuoyMath_AboutPageVC ()

@property (weak, nonatomic) IBOutlet UILabel *content;

@end

@implementation BuoyMath_AboutPageVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"About";
}

- (void)viewDidLoad {
    [super viewDidLoad];

    if kiPhone5 {
        self.content.font = [UIFont fontWithName:FontName size:15];
    }
}

@end
