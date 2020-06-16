//
//  MPAboutVC.m
//  MyPlan
//
//  Created by  luzhaoyang on 2020/3/28.
//  Copyright © 2020 yunxi. All rights reserved.
//

#import "MPAboutVC.h"

@interface MPAboutVC ()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *w;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hei;

@end

@implementation MPAboutVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"About";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bgView.layer.cornerRadius = 10;
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.borderColor = [UIColor colorWithHexString:@""].CGColor;
    self.bgView.layer.borderWidth = 0.7;
    self.content.font = [UIFont fontWithName:FontName size:20];
    
    if kiPhone5 {
        self.w.constant = 280;
        self.hei.constant = 360;
        self.content.font = [UIFont fontWithName:FontName size:16];
    }
}

@end
