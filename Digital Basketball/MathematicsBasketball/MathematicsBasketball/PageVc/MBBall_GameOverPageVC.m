//
//  MBBall_GameOverPageVC.m
//  MathematicsBasketball
//
//  Created by zy on 2020/5/26.
//  Copyright © 2020 zhongba. All rights reserved.
//

#import "MBBall_GameOverPageVC.h"

@interface MBBall_GameOverPageVC ()

@property(nonatomic,copy) MBBallGameOverBlock home;
@property(nonatomic,copy) MBBallGameOverBlock again;


@property (weak, nonatomic) IBOutlet UILabel *scroeLbel;
@property (weak, nonatomic) IBOutlet UILabel *tittle;

@property(nonatomic,assign) NSInteger score;

@end

@implementation MBBall_GameOverPageVC

- (instancetype)initWithHome:(MBBallGameOverBlock)home again:(MBBallGameOverBlock)again score:(NSInteger)score{
    if(self = [super init]){
        self.home = home;
        self.again = again;
        self.score = score;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scroeLbel.font = [UIFont fontWithName:TEXTFONT size:60];
    self.tittle.font = [UIFont fontWithName:TEXTFONT size:50];
    self.scroeLbel.text = [NSString stringWithFormat:@"%ld",self.score];
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
