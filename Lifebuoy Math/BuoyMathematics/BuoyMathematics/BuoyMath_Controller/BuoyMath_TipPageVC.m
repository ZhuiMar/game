//
//  BuoyMath_TipPageVC.m
//  BuoyMathematics
//
//  Created by zy on 2020/4/26.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "BuoyMath_TipPageVC.h"

@interface BuoyMath_TipPageVC ()

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *okBtn;

@property(nonatomic, copy)BuoyMath_Ok ok;

@property(nonatomic, assign)NSInteger type;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;

@end

@implementation BuoyMath_TipPageVC

- (instancetype)initWithType:(NSInteger)type ok:(BuoyMath_Ok)ok{
    if(self = [super init]){
        self.ok = ok;
        self.type = type;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    
    if(self.type == 1){
        self.contentLabel.text = @"Lifebuoy style is random, two-digit addition and subtraction, the maximum is 55+55. There is no integer addition or subtraction, such as 20+30, because the life buoy cannot represent 0. 1 correct answer +100 points, 3 wrong end of game.";
    }else{
        self.contentLabel.text = @"The same two-digit addition and subtraction operation, known the number, click on any column of life buoy, if the formula is correct, then +100 points, wrong three times at the end of the game, click on a column once, remove the top of a life buoy, click to complete the judgment of right or wrong. One to three life buoys should be removed at random for each problem.";
    }
    
    if kiPhone5 {
        self.contentLabel.font = [UIFont fontWithName:FontName size:16];
        self.topLayout.constant = 30;
    }
}
- (IBAction)okAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.ok){
        self.ok();
    }
}

@end
