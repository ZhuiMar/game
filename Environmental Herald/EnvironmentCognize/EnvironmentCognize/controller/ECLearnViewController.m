//
//  ECLearnViewController.m
//  EnvironmentCognize
//
//  Created by luzhaoyang on 2020/4/7.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "ECLearnViewController.h"

@interface ECLearnViewController ()

@end

@implementation ECLearnViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Learning";

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)trashAction:(id)sender {
    ECDrytrashViewController *vc = [[ECDrytrashViewController alloc]initWithTpye:0];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)wasteAction:(id)sender {
    ECDrytrashViewController *vc = [[ECDrytrashViewController alloc]initWithTpye:1];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)tryTrashAction:(id)sender {
    ECDrytrashViewController *vc = [[ECDrytrashViewController alloc]initWithTpye:2];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)wetTrash:(id)sender {
    ECDrytrashViewController *vc = [[ECDrytrashViewController alloc]initWithTpye:3];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
