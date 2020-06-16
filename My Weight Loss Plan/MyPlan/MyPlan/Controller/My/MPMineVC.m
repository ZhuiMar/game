//
//  MPMineVC.m
//  MyPlan
//
//  Created by  luzhaoyang on 2020/3/20.
//  Copyright © 2020 yunxi. All rights reserved.
//

#import "MPMineVC.h"

@interface MPMineVC ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *daysLabel;
@property (weak, nonatomic) IBOutlet UIView *topBg;
@property (weak, nonatomic) IBOutlet UIView *bottomBg;
@property (weak, nonatomic) IBOutlet UILabel *weightKey;
@property (weak, nonatomic) IBOutlet UILabel *weightVaule;
@property (weak, nonatomic) IBOutlet UILabel *aboutKey;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;

@end

@implementation MPMineVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"My";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUi];
    
    RLMResults *realts = [SetModel objectsWhere:@"type == %@",@"weightSet"];
    SetModel *model = realts.firstObject;
    NSArray *arr = [model.weight componentsSeparatedByString:@"="];
    self.weightVaule.text = arr.lastObject;
    NSString *startTime = [[NSUserDefaults standardUserDefaults] objectForKey:@"startTime"];
    
    self.daysLabel.text = [NSString stringWithFormat:@"%@ Days",model.days];
    
    if kiPhone5 {
        self.topH.constant = 200;
        self.topW.constant = 280;
        self.top.constant = 64;
    }
}

- (void)setUi{
    
    self.titleLabel.font = [UIFont fontWithName:FontName size:20];
    self.weightKey.font = [UIFont fontWithName:FontName size:25];
    self.weightVaule.font = [UIFont fontWithName:FontName size:25];
    self.aboutKey.font = [UIFont fontWithName:FontName size:25];
    self.daysLabel.font = [UIFont fontWithName:FontName size:30];
    
    self.topBg.layer.cornerRadius = 6;
    self.topBg.layer.masksToBounds = YES;
    self.topBg.layer.borderWidth = 1;
    self.topBg.layer.borderColor = [UIColor colorWithHexString:@"#284962"].CGColor;
    
    self.bottomBg.layer.cornerRadius = 6;
    self.bottomBg.layer.masksToBounds = YES;
    self.bottomBg.layer.borderWidth = 1;
    self.bottomBg.layer.borderColor = [UIColor colorWithHexString:@"#284962"].CGColor;
}

- (IBAction)aboutAction:(id)sender {
    MPAboutVC *aboutVC = [[MPAboutVC alloc]init];
    [self.navigationController pushViewController:aboutVC animated:YES];
}

@end
