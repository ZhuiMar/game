//
//  RSSTipsViewController.m
//  RapidSignSelection
//
//  Created by zy on 2020/6/5.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "RSSTipsViewController.h"

@interface RSSTipsViewController ()

@property(nonatomic,strong) RSSTipsViewBlock ok;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayout;

@end

@implementation RSSTipsViewController

- (instancetype)initWithOkAction:(RSSTipsViewBlock)okAction{
    if(self = [super init]){
        self.ok = okAction;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];

    if kiPhone5 {
        self.widthLayout.constant = 270;
        self.heightLayout.constant = 270;
    }
}

- (IBAction)okAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.ok){
        self.ok();
    }
}

@end
