//
//  NMTipsViewController.m
//  NumberOfMemory
//
//  Created by  luzhaoyang on 2020/4/2.
//  Copyright © 2020 huadu. All rights reserved.
//

#import "NMTipsViewController.h"

@interface NMTipsViewController ()

@property(nonatomic,assign)NSInteger type;
@property (weak, nonatomic) IBOutlet UIImageView *tip;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *H;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *w;


@end

@implementation NMTipsViewController

- (instancetype)initWithType:(NSInteger)type{
    if(self = [super init]){
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    if (self.type == 0){
        self.tip.image = [UIImage imageNamed:@"tip_1"];
    }else{
        self.tip.image = [UIImage imageNamed:@"tip_2"];
    }
    
    if kiPhone5 {
        self.H.constant = 240;
        self.w.constant = 500;
    }
}
- (IBAction)okAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
