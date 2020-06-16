//
//  TDAboutVC.m
//  TruthOrDare
//
//  Created by  luzhaoyang on 2020/3/10.
//  Copyright © 2020 zhuimar. All rights reserved.
//

#import "TDAboutVC.h"

@interface TDAboutVC ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation TDAboutVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"ABOUT";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.userInteractionEnabled = YES;
}




@end
