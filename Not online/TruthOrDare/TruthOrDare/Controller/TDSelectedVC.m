//
//  TDSelectedVC.m
//  TruthOrDare
//
//  Created by  luzhaoyang on 2020/3/10.
//  Copyright © 2020 zhuimar. All rights reserved.
//

#import "TDSelectedVC.h"

@interface TDSelectedVC ()

@property (weak, nonatomic) IBOutlet UIButton *truthBtn;
@property (weak, nonatomic) IBOutlet UIButton *dereBtn;

@end

@implementation TDSelectedVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
}
- (IBAction)truthBtnAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.delegate truthAction];
}
- (IBAction)dareBtnAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.delegate dareAction];
}

@end
