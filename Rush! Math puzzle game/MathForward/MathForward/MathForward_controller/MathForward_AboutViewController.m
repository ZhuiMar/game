//
//  MathForward_AboutViewController.m
//  MathForward
//
//  Created by luzhaoyang on 2020/4/21.
//  Copyright © 2020 teresa. All rights reserved.
//

#import "MathForward_AboutViewController.h"

@interface MathForward_AboutViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *W;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *H;

@end

@implementation MathForward_AboutViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"about";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if kiPhone5 {
        self.W.constant = 380;
        self.H.constant = 240;
    }
}
- (IBAction)privacyPolicyAction:(id)sender {
    [NSObject MathForward_findFromeController:self];
}

@end
