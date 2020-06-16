//
//  SAAboutVC.m
//  SimulateAnimalCall
//
//  Created by luzhaoyang on 2020/4/8.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "SAAboutVC.h"

@interface SAAboutVC ()

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation SAAboutVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"About";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if kiPhone5 {
        self.contentLabel.font = [UIFont systemFontOfSize:13];
    }
}


@end
