//
//  HWGDescribeVC.m
//  HandWrittenGothic
//
//  Created by  luzhaoyang on 2020/3/18.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import "HWGDescribeVC.h"

@interface HWGDescribeVC ()

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UITextView *contentLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *H;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *W;

@property(nonatomic, strong) UIButton *privacyBtn;

@end

@implementation HWGDescribeVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.bgView.layer.cornerRadius = 10;
    self.bgView.layer.masksToBounds = YES;
    self.bgView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    self.contentLabel.backgroundColor = [UIColor clearColor];
    self.contentLabel.font = [UIFont fontWithName:FontNameq1 size:24];
    
    UIImageView *imaheView = [[UIImageView alloc]init];
    imaheView.frame = CGRectMake(0, 0, 100, 20);
    imaheView.image = [UIImage imageNamed:@"9_tittle"];
    self.navigationItem.titleView = imaheView;
    self.contentLabel.showsVerticalScrollIndicator = NO; 
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if kiPhone5 {
        self.H.constant = 400;
        self.W.constant = 300;
        self.contentLabel.font = [UIFont fontWithName:FontNameq1 size:2];
    }
    
    [self.view addSubview:self.privacyBtn];
    [self.privacyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.bgView.mas_bottom).mas_offset(30);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(150);
    }];
}

- (void)privacyAction:(UIButton *)buttion{
    [NSString changeThemeFromeController:self];
}

- (UIButton *)privacyBtn{
    if(_privacyBtn == nil){
        _privacyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _privacyBtn.frame = CGRectMake(0, 0, 40, 150);
        [_privacyBtn setTitle:@"Privacy Policy" forState:UIControlStateNormal];
        [_privacyBtn addTarget:self action:@selector(privacyAction:) forControlEvents:UIControlEventTouchUpInside];
        _privacyBtn.titleLabel.font = [UIFont fontWithName:FontNameq1 size:27];
        [_privacyBtn setTitleColor:[UIColor colorWithHexString:@"#6882F7"] forState:UIControlStateNormal];
    }
    return _privacyBtn;
}
@end
