//
//  ECFindDiffViewController.m
//  EnvironmentCognize
//
//  Created by luzhaoyang on 2020/4/7.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "ECFindDiffViewController.h"

@interface ECFindDiffViewController ()

@end

@implementation ECFindDiffViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Find difference";

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goToFindVC:) name:@"goToFindVC" object:nil];
}

- (void)goToFindVC:(NSNotification *)info{
    NSString *string = info.object;
    if([string isEqualToString:@"1"]){
        ECDifferentViewController *vc = [[ECDifferentViewController alloc]initWithTpye:1];
        [self.navigationController pushViewController:vc  animated:YES];
    }else if ([string isEqualToString:@"2"]){
        ECDifferentViewController *vc = [[ECDifferentViewController alloc]initWithTpye:2];
        [self.navigationController pushViewController:vc  animated:YES];
    }else{
        ECDifferentViewController *vc = [[ECDifferentViewController alloc]initWithTpye:3];
        [self.navigationController pushViewController:vc  animated:YES];
    }
}

- (IBAction)oneStart:(id)sender {
    ECDifferentViewController *vc = [[ECDifferentViewController alloc]initWithTpye:1];
    [self.navigationController pushViewController:vc  animated:YES];
}
- (IBAction)twoStart:(id)sender {
    ECDifferentViewController *vc = [[ECDifferentViewController alloc]initWithTpye:2];
    [self.navigationController pushViewController:vc  animated:YES];
}
- (IBAction)threeStart:(id)sender {
    ECDifferentViewController *vc = [[ECDifferentViewController alloc]initWithTpye:3];
    [self.navigationController pushViewController:vc  animated:YES];
}

@end



