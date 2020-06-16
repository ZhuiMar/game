//
//  SmartNumber_GameOverViewController.m
//  SmartNumberOff
//
//  Created by zy on 2020/4/30.
//  Copyright © 2020 ximan. All rights reserved.
//

#import "SmartNumber_GameOverViewController.h"

@interface SmartNumber_GameOverViewController ()

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;


@property(nonatomic, assign)NSInteger score;
@property(nonatomic, copy)SmartNumber_OverBlock homeBlock;
@property(nonatomic, copy)SmartNumber_OverBlock againBlcok;

@end

@implementation SmartNumber_GameOverViewController

- (instancetype)initWithScore:(NSInteger)score homeBlock:(SmartNumber_OverBlock)homeBlock againBlock:(SmartNumber_OverBlock)againBlock{
    if(self = [super init]){
        self.homeBlock = homeBlock;
        self.againBlcok = againBlock;
        self.score = score;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.score];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
}

- (IBAction)homeAction:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
    if(self.homeBlock){
        self.homeBlock();
    }
}
- (IBAction)againAction:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
    if(self.againBlcok){
        self.againBlcok();
    }
}

@end
