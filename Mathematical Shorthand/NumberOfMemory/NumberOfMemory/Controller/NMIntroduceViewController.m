//
//  NMIntroduceViewController.m
//  NumberOfMemory
//
//  Created by  luzhaoyang on 2020/4/2.
//  Copyright © 2020 huadu. All rights reserved.
//

#import "NMIntroduceViewController.h"

@interface NMIntroduceViewController ()

@property (weak, nonatomic) IBOutlet UILabel *contentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;

@end

@implementation NMIntroduceViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Introduction";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentView.font = [UIFont fontWithName:FontName size:20];
    
    if kiPhone5 {
        self.topLayout.constant = 40;
    }

}
@end
