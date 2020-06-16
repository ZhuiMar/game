//
//  NMStudyViewController.m
//  NumberOfMemory
//
//  Created by  luzhaoyang on 2020/4/2.
//  Copyright © 2020 huadu. All rights reserved.
//

#import "NMStudyViewController.h"

@interface NMStudyViewController ()

@end

@implementation NMStudyViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Study";
}
- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)additionAction:(id)sender {
    NMStudyNextViewController *vc = [[NMStudyNextViewController alloc] initWithType:0 title:@"Addition"];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)multiplicationAction:(id)sender {
    NMStudyNextViewController *vc = [[NMStudyNextViewController alloc] initWithType:1 title:@"Multiplication"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
