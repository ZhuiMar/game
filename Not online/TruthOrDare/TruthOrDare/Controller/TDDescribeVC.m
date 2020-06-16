//
//  TDDescribeVC.m
//  TruthOrDare
//
//  Created by  luzhaoyang on 2020/3/10.
//  Copyright © 2020 zhuimar. All rights reserved.
//

#import "TDDescribeVC.h"

@interface TDDescribeVC ()

@property (weak, nonatomic) IBOutlet UIImageView *textImageView;


@end

@implementation TDDescribeVC

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)clickBtnAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
