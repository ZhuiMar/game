//
//  ArithmeticMagicCup_AboutPage.m
//  ArithmeticMagicCup
//
//  Created by zy on 2020/4/23.
//  Copyright © 2020 qingmai. All rights reserved.
//

#import "ArithmeticMagicCup_AboutPage.h"
#import "AppDelegate.h"

@interface ArithmeticMagicCup_AboutPage ()

@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *width;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ArithmeticMagicCup_AboutPage

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"About";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:FontName size:TitleSize],NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appdelegate.isForcePortrait = NO;
    appdelegate.isForceLandscape = YES;
    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
    [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeRight) forKey:@"orientation"];
    [UIViewController attemptRotationToDeviceOrientation];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bgView.layer.cornerRadius = 20;
    self.bgView.layer.masksToBounds = YES;
    
    if kiPhone5 {
        self.height.constant = 230;
        self.width.constant = 480;
        self.content.font = [UIFont fontWithName:FontName size:17];
    }
    
    self.button.backgroundColor = [NSObject ArithmeticMagicCup_colorWithHexString:@"#FFAE00"];
    self.button.layer.cornerRadius = 6;
    self.button.layer.masksToBounds = YES;
}
- (IBAction)PrivacyPolicyAction:(id)sender {
    [NSObject ArithmeticMagicCup_findFromeController:self];
}

@end
