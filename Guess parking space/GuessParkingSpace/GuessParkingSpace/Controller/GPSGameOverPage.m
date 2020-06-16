//
//  GPSGameOverPage.m
//  GuessParkingSpace
//
//  Created by luzhaoyang on 2020/4/9.
//  Copyright © 2020 xiangjia. All rights reserved.
//

#import "GPSGameOverPage.h"

@interface GPSGameOverPage ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property(nonatomic, copy)GameOverBlock home;
@property(nonatomic, copy)GameOverBlock again;
@property(nonatomic, assign)NSInteger score;

@end

@implementation GPSGameOverPage

- (instancetype)initWithScore:(NSInteger)score homeBlock:(GameOverBlock)homeBlock againBlock:(GameOverBlock)againBlock{
    if(self = [super init]){
        self.home = homeBlock;
        self.again = againBlock;
        self.score = score;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.score];
}

- (IBAction)homeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.home){
        self.home();
    }
}
- (IBAction)againAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.again){
        self.again();
    }
}

@end
