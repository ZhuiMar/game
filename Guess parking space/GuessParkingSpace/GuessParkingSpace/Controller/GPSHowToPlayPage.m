//
//  GPSHowToPlayPage.m
//  GuessParkingSpace
//
//  Created by luzhaoyang on 2020/4/9.
//  Copyright © 2020 xiangjia. All rights reserved.
//

#import "GPSHowToPlayPage.h"

@interface GPSHowToPlayPage ()

@end

@implementation GPSHowToPlayPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
}

- (IBAction)okAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
