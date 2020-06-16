//
//  ECAboutViewController.m
//  EnvironmentCognize
//
//  Created by luzhaoyang on 2020/4/7.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "ECAboutViewController.h"


@interface ECAboutViewController ()

@property (weak, nonatomic) IBOutlet UILabel *content;
@property (nonatomic,strong)UIScrollView *scrollerView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *withLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayout;

@end

@implementation ECAboutViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"About";

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.content.font = [UIFont fontWithName:FontNameTitle size:22];
    if kiPhone5 {
        self.withLayout.constant = 280;
        self.heightLayout.constant = 250;
        self.content.font = [UIFont fontWithName:FontNameTitle size:18];
    }
}


@end
