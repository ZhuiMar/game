//
//  CHBTipsVC.m
//  ColorHotBalloon
//
//  Created by  luzhaoyang on 2020/3/9.
//  Copyright © 2020 zhuimar. All rights reserved.
//

#import "CHBTipsVC.h"

@interface CHBTipsVC ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;

@property (nonnull,copy) NSString *type;

@end

@implementation CHBTipsVC

- (instancetype)initWithType:(NSString *)type{
    self = [super init];
    if(self){
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([self.type isEqualToString:@"count"]){
        self.contentLabel.text = @"Choose the correct answer based on the math in the hot air balloon.";
    }else{
        self.contentLabel.text = @"Pay attention to the color requirements in the title and answer the answer for the hot air balloon with the specified color.";
    }
    
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    self.titleLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:30];
    self.contentLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:24];
    [self.startBtn setTitle:@"Start" forState:UIControlStateNormal];
    self.startBtn.titleLabel.font = [UIFont fontWithName:@"Pangolin-Regular" size:20];
}
- (IBAction)startAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
