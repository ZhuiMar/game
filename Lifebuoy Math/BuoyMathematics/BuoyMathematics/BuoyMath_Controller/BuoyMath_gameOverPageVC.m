//
//  BuoyMath_gameOverPageVC.m
//  BuoyMathematics
//
//  Created by zy on 2020/4/26.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "BuoyMath_gameOverPageVC.h"

@interface BuoyMath_gameOverPageVC ()

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property(nonatomic, copy)BuoyMath_Over home;
@property(nonatomic, copy)BuoyMath_Over again;
@property(nonatomic, assign)NSInteger score;

@end

@implementation BuoyMath_gameOverPageVC


- (instancetype)initWithScore:(NSInteger)score home:(BuoyMath_Over)home again:(BuoyMath_Over)again{
    if(self = [super init]){
        self.home = home;
        self.again = again;
        self.score = score;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.score];
}

- (IBAction)againAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.again){
        self.again();
    }
}
- (IBAction)homeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.home){
        self.home();
    }
}

@end
