//
//  ArithmeticMagicCup_TipPage.m
//  ArithmeticMagicCup
//
//  Created by zy on 2020/4/23.
//  Copyright © 2020 qingmai. All rights reserved.
//

#import "ArithmeticMagicCup_TipPage.h"

@interface ArithmeticMagicCup_TipPage ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;

@property(nonatomic, copy) ArithmeticMagicCup_TipBlock start;
@property(nonatomic, assign) NSInteger type;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;

@end

@implementation ArithmeticMagicCup_TipPage

- (instancetype)initWithType:(NSInteger)type block:(ArithmeticMagicCup_TipBlock)block{
    if(self = [super init]){
        self.type = type;
        self.start = block;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    if(self.type == 1){
        self.icon.image = [UIImage imageNamed:@"decoration"];
        self.content.text = @"Look at the numbers on each set of balls and remember the result of adding them up. Find the same cup as the target number after the cup exchange";
        if kiPhone5 {
            self.topLayout.constant = 60;
        }
    }else{
        self.icon.image = [UIImage imageNamed:@"decoration2"];
        self.content.text = @"Look at the numbers on each set of balls and remember the result of adding them up. Put the fourth ball in the cup after the cup exchange to make it the same as the target number.";
        if kiPhone5 {
            self.topLayout.constant = 40;
        }
    }
    self.startBtn.layer.cornerRadius = 8;
    self.startBtn.layer.masksToBounds = YES;
}

- (IBAction)startAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.start){
        self.start();
    }
}
@end
