//
//  MBBall_AboutPageVC.m
//  MathematicsBasketball
//
//  Created by zy on 2020/5/26.
//  Copyright © 2020 zhongba. All rights reserved.
//

#import "MBBall_AboutPageVC.h"

@interface MBBall_AboutPageVC ()
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *weightLayout;

@end

@implementation MBBall_AboutPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Introduction";
    self.contentLabel.font = [UIFont fontWithName:TEXTFONT size:20];
   
    if kiPhone5 {
        self.heightLayout.constant = 430;
        self.weightLayout.constant = 280;
        self.contentLabel.font = [UIFont fontWithName:TEXTFONT size:17];
    }
}

@end
