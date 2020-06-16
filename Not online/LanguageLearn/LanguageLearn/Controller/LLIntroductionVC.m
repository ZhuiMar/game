//
//  LLIntroductionVC.m
//  LanguageLearn
//
//  Created by  luzhaoyang on 2020/3/19.
//  Copyright © 2020 haike. All rights reserved.
//

#import "LLIntroductionVC.h"

@interface LLIntroductionVC ()

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation LLIntroductionVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Introduction";
    self.contentLabel.font = [UIFont fontWithName:FontName size:20];
    self.contentLabel.textColor = [UIColor colorWithHexString:@"#892137"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
