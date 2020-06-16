//
//  SmartNumber_CountdownViewController.m
//  SmartNumberOff
//
//  Created by zy on 2020/4/29.
//  Copyright © 2020 ximan. All rights reserved.
//

#import "SmartNumber_CountdownViewController.h"

@interface SmartNumber_CountdownViewController ()

@property (nonatomic,strong) NSTimer *runTimer;
@property (nonatomic,assign) NSInteger timerCount;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@property(nonatomic, copy)SmartNumber_countDownBlock over;

@end

@implementation SmartNumber_CountdownViewController

- (instancetype)initWithBlock:(SmartNumber_countDownBlock)over{
    if(self = [super init]){
        self.over = over;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    
    self.timerCount = 3;
    self.countLabel.text = [NSString stringWithFormat:@"%ld",self.timerCount];
    
    self.runTimer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.runTimer forMode:NSDefaultRunLoopMode];
}


- (void)timerRun{
    
    if(self.timerCount == 0){
        
        if(self.runTimer != nil){
            [self.runTimer invalidate];
            self.runTimer = nil;
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
        if(self.over){
            self.over();
        }
        
    }else{
        self.timerCount = self.timerCount - 1;
        self.countLabel.text = [NSString stringWithFormat:@"%ld",self.timerCount];
        [UIView animateWithDuration:0.3 animations:^{
           self.countLabel.transform = CGAffineTransformMakeScale(1.5, 1.5);
        } completion:^(BOOL finished) {
            self.countLabel.transform = CGAffineTransformIdentity;
        }];
    }
}

- (void)dealloc{
    if(self.runTimer != nil){
        [self.runTimer invalidate];
        self.runTimer = nil;
    }
}

@end
