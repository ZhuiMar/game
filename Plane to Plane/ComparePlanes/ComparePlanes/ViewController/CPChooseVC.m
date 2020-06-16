//
//  CPChooseVC.m
//  ComparePlanes
//
//  Created by luzhaoyang on 2020/4/16.
//  Copyright © 2020 qingxiriver. All rights reserved.
//


#import "CPChooseVC.h"

@interface CPChooseVC ()

@property(nonatomic,assign) NSInteger type;

@end

@implementation CPChooseVC

- (instancetype)initWithType:(NSInteger)type{
    if(self = [super init]){
        self.type = type;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Choice difficulty";
}

- (void)viewDidLoad {
    [super viewDidLoad];
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jump:) name:@"gameAgain" object:nil];
}

- (void)jump:(NSNotification *)info{
    NSString *str = info.object;
    if([str isEqualToString:@"1"]){
        CPGameCenterVC *vc = [[CPGameCenterVC alloc]initWithLevel:1 type:self.type];
        [self.navigationController pushViewController:vc animated:NO];
    }else if([str isEqualToString:@"2"]){
        CPGameCenterVC *vc = [[CPGameCenterVC alloc]initWithLevel:2 type:self.type];
        [self.navigationController pushViewController:vc animated:NO];
    }else{
        CPGameCenterVC *vc = [[CPGameCenterVC alloc]initWithLevel:3 type:self.type];
        [self.navigationController pushViewController:vc animated:NO ];
    }
}

- (IBAction)simAction:(id)sender {
    CPGameCenterVC *vc = [[CPGameCenterVC alloc]initWithLevel:1 type:self.type];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)comAction:(id)sender {
    CPGameCenterVC *vc = [[CPGameCenterVC alloc]initWithLevel:2 type:self.type];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)diffAction:(id)sender {
    CPGameCenterVC *vc = [[CPGameCenterVC alloc]initWithLevel:3 type:self.type];
    [self.navigationController pushViewController:vc animated:YES];
}

@end

