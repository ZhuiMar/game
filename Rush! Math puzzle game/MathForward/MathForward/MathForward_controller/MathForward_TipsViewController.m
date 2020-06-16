//
//  MathForward_TipsViewController.m
//  MathForward
//
//  Created by luzhaoyang on 2020/4/21.
//  Copyright © 2020 teresa. All rights reserved.
//

#import "MathForward_TipsViewController.h"

@interface MathForward_TipsViewController ()

@property(nonatomic, copy)MathForward_IKnowBlock block;
@property(nonatomic, assign)NSInteger tip;
@property (weak, nonatomic) IBOutlet UIImageView *tipImage;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *H;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *W;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *IW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *IH;

@end

@implementation MathForward_TipsViewController

- (instancetype)initIKnowTip:(NSInteger)tip know:(MathForward_IKnowBlock)iknow{
    if(self == [self init]){
        self.block = iknow;
        self.tip = tip;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    if(self.tip == 1){
        self.tipImage.image = [UIImage imageNamed:@"tips_1"];
    }else{
        self.tipImage.image = [UIImage imageNamed:@"tips_0"];
    }
    
    if kiPhone5 {
        self.W.constant = 230;
        self.H.constant = 180;
        self.IW.constant = 130;
        self.IH.constant = 50;
    }
}

- (IBAction)iknowAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.block){
        self.block();
    }
}

@end
