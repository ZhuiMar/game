//
//  MatheSpider_DescriptionViewController.m
//  MathematicalSpider
//
//  Created by luzhaoyang on 2020/4/20.
//  Copyright © 2020 teresa. All rights reserved.
//

#import "MatheSpider_DescriptionViewController.h"

@interface MatheSpider_DescriptionViewController ()

@property (weak, nonatomic) IBOutlet UILabel *easyOne;
@property (weak, nonatomic) IBOutlet UILabel *easytwo;
@property (weak, nonatomic) IBOutlet UILabel *easyThree;

@property (weak, nonatomic) IBOutlet UILabel *hardOne;
@property (weak, nonatomic) IBOutlet UILabel *hardTwo;
@property (weak, nonatomic) IBOutlet UILabel *hardThree;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightLayout;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height;

@end

@implementation MatheSpider_DescriptionViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Description";
}

- (void)viewDidLoad {
    [super viewDidLoad];

    if kiPhone5 {
        self.leftLayout.constant = 80;
        self.rightLayout.constant = -80;
        self.contentLabel.font = [UIFont fontWithName:FontName size:15];
        self.height.constant = 280;
    }
    if IS_IPHONE_X_orMore {
        self.leftLayout.constant = 180;
        self.rightLayout.constant = -180;
    }
}
- (IBAction)privacy:(id)sender {
    [NSObject MatheSpider_findFromeController:self];
}

@end
