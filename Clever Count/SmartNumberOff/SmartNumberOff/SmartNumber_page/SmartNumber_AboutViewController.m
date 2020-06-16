//
//  SmartNumber_AboutViewController.m
//  SmartNumberOff
//
//  Created by zy on 2020/4/29.
//  Copyright © 2020 ximan. All rights reserved.
//

#import "SmartNumber_AboutViewController.h"

@interface SmartNumber_AboutViewController ()

@property(nonatomic,strong)UIImageView *imageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *with;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height;
@property (weak, nonatomic) IBOutlet UIButton *PrivacyBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerX;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *H;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *W;

@end

@implementation SmartNumber_AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.imageView;
    if kiPhone5 {
        self.with.constant = 250;
        self.height.constant = 530;
        self.centerX.constant = -10;
        self.with.constant = 220;
        self.height.constant = 480;
    }
    self.PrivacyBtn.titleLabel.font = [UIFont fontWithName:FontName size:22];
}

- (UIImageView *)imageView{
    if(_imageView == nil){
        _imageView = [[UIImageView alloc]init];
        _imageView.frame = CGRectMake(0, 0, 116*(2/3), 41*(2/3));
        _imageView.image = [UIImage imageNamed:@"about-1"];
    }
    return _imageView;
}

- (IBAction)PrivacyAction:(id)sender {
    [NSObject SmartNumber_findFromeController:self];
}

@end
