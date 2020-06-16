//
//  MBBall_ReadyPageVC.m
//  MathematicsBasketball
//
//  Created by zy on 2020/5/26.
//  Copyright © 2020 zhongba. All rights reserved.
//

#import "MBBall_ReadyPageVC.h"

@interface MBBall_ReadyPageVC ()
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *readyLabel;
@property (weak, nonatomic) IBOutlet UILabel *subOne;
@property (weak, nonatomic) IBOutlet UILabel *subTwo;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger count;

@end

@implementation MBBall_ReadyPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.count = 3;
    self.numberLabel.text = [NSString stringWithFormat:@"%ld",self.count];
    self.numberLabel.font = [UIFont fontWithName:TEXTFONT size:200];
    self.readyLabel.font = [UIFont fontWithName:TEXTFONT size:75];
    self.subOne.font = [UIFont fontWithName:TEXTFONT size:40];
    self.subTwo.font = [UIFont fontWithName:TEXTFONT size:40];
    
    if kiPhone5 {
        self.readyLabel.font = [UIFont fontWithName:TEXTFONT size:60];
        self.subOne.font = [UIFont fontWithName:TEXTFONT size:30];
        self.subTwo.font = [UIFont fontWithName:TEXTFONT size:30];
    }
    
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerChange) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void)timerChange{
    if(self.count == 0){
        if(self.timer != nil){
            [self.timer invalidate];
            self.timer = nil;
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ReadyGo" object:nil];
        
    }else{
        self.count --;
        self.numberLabel.text = [NSString stringWithFormat:@"%ld",self.count];
    }
}

@end
