//
//  SmartNumber_ShoumingViewController.m
//  SmartNumberOff
//
//  Created by zy on 2020/4/30.
//  Copyright © 2020 ximan. All rights reserved.
//

#import "SmartNumber_ShoumingViewController.h"

@interface SmartNumber_ShoumingViewController ()

@property(nonatomic,copy) SmartNumber_okAction ok;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toptopLayout;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *H;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *W;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bW;

@end

@implementation SmartNumber_ShoumingViewController

- (instancetype)initTypeOK:(SmartNumber_okAction)okAction{
    if(self = [super init]){
        self.ok = okAction;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    
    if kiPhone5 {
        self.topLayout.constant = -10;
        self.toptopLayout.constant = 5;
        self.H.constant = 230;
        self.W.constant = 280;
        self.bH.constant = 35;
        self.bW.constant = 110;
    }
}

- (IBAction)okAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.ok){
        self.ok();
    }
}

@end
