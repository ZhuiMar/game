//
//  FFTBall_FormationDetailPageVC.m
//  FootballFormationTactics
//
//  Created by zy on 2020/5/27.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import "FFTBall_FormationDetailPageVC.h"
#import "FFTBall_AddPageVC.h"
#import "FFTBall_PlanPageVC.h"


@interface FFTBall_FormationDetailPageVC ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic,strong)UILabel *tittleLabel;
@property(nonatomic, strong) UIBarButtonItem *backBottonItem;
@property(nonatomic, strong) UIButton *backBottom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@property(nonatomic, strong) UIBarButtonItem *editBottonItem;
@property(nonatomic, strong) UIButton *editBottom;


@end

@implementation FFTBall_FormationDetailPageVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    self.navigationItem.titleView = self.tittleLabel;
    self.navigationItem.leftBarButtonItem = self.backBottonItem;
    self.navigationItem.rightBarButtonItem = self.editBottonItem;
}

- (void)backAction:(UIButton *)buttion{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSData *imageData = [[NSData alloc] initWithBase64EncodedString:self.model.image options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *image = [UIImage imageWithData:imageData];
    self.imageView.image = image;
    if IS_IPHONE_X_orMore {
        self.topLayout.constant = 88;
    }
    self.addBtn.titleLabel.font = [UIFont fontWithName:TEXTFONT size:20];
}

- (void)editBottomAction:(UIButton *)buttion{
    FFTBall_PlanPageVC *pageVC = [[FFTBall_PlanPageVC alloc]init];
    pageVC.model = self.model;
    pageVC.name = self.model.name;
    pageVC.date = self.model.date;
    pageVC.place = self.model.place;
    [self.navigationController pushViewController:pageVC animated:YES];
}

- (IBAction)addAction:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:NO];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NewMycomplation" object:nil];
}

- (UILabel *)tittleLabel{
    if(_tittleLabel == nil){
        _tittleLabel = [[UILabel alloc]init];
        _tittleLabel.font = [UIFont fontWithName:TEXTFONT size:TITTLESIZE];
        _tittleLabel.textColor = [UIColor blackColor];
        _tittleLabel.text = @"Details";
    }
    return _tittleLabel;
}
- (UIButton *)backBottom{
    if(_backBottom == nil){
        _backBottom = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBottom.frame = CGRectMake(0, 0, 30, 30);
        [_backBottom setImage:[UIImage imageNamed:@"back_1"] forState:UIControlStateNormal];
        [_backBottom addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBottom;
}
- (UIBarButtonItem *)backBottonItem{
    if(_backBottonItem == nil){
        _backBottonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBottom];
    }
    return _backBottonItem;
}

- (UIButton *)editBottom{
    if(_editBottom== nil){
        _editBottom = [UIButton buttonWithType:UIButtonTypeCustom];
        _editBottom.frame = CGRectMake(0, 0, 30, 30);
        [_editBottom setImage:[UIImage imageNamed:@"edit"] forState:UIControlStateNormal];
        [_editBottom addTarget:self action:@selector(editBottomAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _editBottom;
}
- (UIBarButtonItem *)editBottonItem{
    if(_editBottonItem == nil){
        _editBottonItem = [[UIBarButtonItem alloc]initWithCustomView:self.editBottom];
    }
    return _editBottonItem;
}

@end
