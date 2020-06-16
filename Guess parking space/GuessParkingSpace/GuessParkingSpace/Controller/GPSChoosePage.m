//
//  GPSChoosePage.m
//  GuessParkingSpace
//
//  Created by luzhaoyang on 2020/4/9.
//  Copyright © 2020 xiangjia. All rights reserved.
//

#import "GPSChoosePage.h"

@interface GPSChoosePage ()

@end

@implementation GPSChoosePage


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"choose";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(againAction:) name:@"againGame" object:nil];
}

- (void)againAction:(NSNotification *)info{
    NSString *string = info.object;
    if([string isEqualToString:@"1"]){
        GPSStartPage *startPage = [[GPSStartPage alloc]initWithLevel:1];
        [self.navigationController pushViewController:startPage animated:YES];
    }else if ([string isEqualToString:@"2"]){
        GPSStartPage *startPage = [[GPSStartPage alloc]initWithLevel:2];
        [self.navigationController pushViewController:startPage animated:YES];
    }else{
        GPSStartPage *startPage = [[GPSStartPage alloc]initWithLevel:3];
        [self.navigationController pushViewController:startPage animated:YES];
    }
}

- (IBAction)simple:(id)sender {
    GPSStartPage *startPage = [[GPSStartPage alloc]initWithLevel:1];
    [self.navigationController pushViewController:startPage animated:YES];
}
- (IBAction)genneral:(id)sender {
    GPSStartPage *startPage = [[GPSStartPage alloc]initWithLevel:2];
    [self.navigationController pushViewController:startPage animated:YES];
}
- (IBAction)difficult:(id)sender {
    GPSStartPage *startPage = [[GPSStartPage alloc]initWithLevel:3];
    [self.navigationController pushViewController:startPage animated:YES];
}

@end
