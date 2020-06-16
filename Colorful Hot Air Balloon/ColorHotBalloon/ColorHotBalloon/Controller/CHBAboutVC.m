//
//  CHBAboutVC.m
//  ColorHotBalloon
//
//  Created by  luzhaoyang on 2020/3/9.
//  Copyright © 2020 zhuimar. All rights reserved.
//

#import "CHBAboutVC.h"
#import "myPch.pch"

@interface CHBAboutVC ()

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *withLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayout;

@end

@implementation CHBAboutVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"About the game";
    
    if kiPhone5 {
        self.withLayout.constant = 300;
        self.heightLayout.constant = 450;
    }
    if kiPhone6 {
        self.withLayout.constant = 330;
        self.heightLayout.constant = 480;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contentLabel.text = @"Colorful Hot Air Balloon is a puzzle game that trains players to observe and mathematical skills.In Calculation, choose the correct answer based on the mathematical formula in the hot air balloon.In Guess, pay attention to the color requirements in the title, and answer the answer of the designated color hot air balloon.";
    
    if kiPhone5 {
         self.contentLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:20];
    } else if kiPhone6 {
         self.contentLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:23];
    } else{
         self.contentLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:25];
    }
}

@end
