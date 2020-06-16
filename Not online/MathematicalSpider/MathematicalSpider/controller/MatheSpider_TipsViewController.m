//
//  MatheSpider_TipsViewController.m
//  MathematicalSpider
//
//  Created by luzhaoyang on 2020/4/20.
//  Copyright © 2020 teresa. All rights reserved.
//

#import "MatheSpider_TipsViewController.h"

@interface MatheSpider_TipsViewController ()

@property(nonatomic, copy)OkBlock okblock;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *witdthLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayout;


@end

@implementation MatheSpider_TipsViewController

- (instancetype)initOkBlock:(OkBlock)ok{
    if(self = [super init]){
        self.okblock = ok;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    if kiPhone5 {
        self.witdthLayout.constant = 540;
        self.heightLayout.constant = 300;
    }
}

- (IBAction)OkAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.okblock){
        self.okblock();
    }
}

@end
