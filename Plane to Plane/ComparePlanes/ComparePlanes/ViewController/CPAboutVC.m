//
//  CPAboutVC.m
//  ComparePlanes
//
//  Created by luzhaoyang on 2020/4/16.
//  Copyright © 2020 qingxiriver. All rights reserved.
//

#import "CPAboutVC.h"

@interface CPAboutVC ()

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation CPAboutVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"About";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if kiPhone5 {
        self.contentLabel.font = [UIFont fontWithName:FontName size:16];
    }
}
@end
