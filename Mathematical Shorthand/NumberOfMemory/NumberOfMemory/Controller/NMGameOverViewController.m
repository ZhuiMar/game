//
//  NMGameOverViewController.m
//  NumberOfMemory
//
//  Created by  luzhaoyang on 2020/4/2.
//  Copyright © 2020 huadu. All rights reserved.
//

#import "NMGameOverViewController.h"

@interface NMGameOverViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *contentBg;
@property (nonatomic, assign) NSInteger selType;
@property (weak, nonatomic) IBOutlet UIButton *homeAction;
@property (weak, nonatomic) IBOutlet UIButton *againAction;

@end

@implementation NMGameOverViewController

- (instancetype)initWithType:(NSInteger)type{
    if(self = [super init]){
        self.selType = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showImage];
}

- (IBAction)homeAction:(id)sender {
    if (self.homeBlock) {
        self.homeBlock();
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)againAction:(id)sender {
    if (self.agianBlock) {
        self.agianBlock();
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)showImage{
    if(self.selType == 0){
        self.contentBg.image = [UIImage imageNamed:@"defeat"];
    }else{
        self.contentBg.image = [UIImage imageNamed:@"victory"];
        [self.againAction setBackgroundImage:[UIImage imageNamed:@"next"] forState:UIControlStateNormal];
    }
}

@end
