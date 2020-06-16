//
//  CatchBall_AboutPageVC.m
//  RushingToCatch
//
//  Created by zy on 2020/6/1.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "CatchBall_AboutPageVC.h"

@interface CatchBall_AboutPageVC ()
@property (weak, nonatomic) IBOutlet UILabel *content;

@end

@implementation CatchBall_AboutPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"About";
    
    if kiPhone5 {
        self.content.font = [UIFont fontWithName:TEXTFONT size:18];
    }
}


@end
