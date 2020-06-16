//
//  FMAboutVC.m
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/13.
//  Copyright © 2020 guanhua. All rights reserved.
//

#import "FMAboutVC.h"

@interface FMAboutVC ()

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bgHightLayout;

@end

@implementation FMAboutVC


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"About";
    
    if(kiPhone5){
        self.bgHightLayout.constant = 400;
        self.content.font = [UIFont fontWithName:FontName size:15];
    }else{
        self.bgHightLayout.constant = 480;
        self.content.font = [UIFont fontWithName:FontName size:19];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bgView.layer.cornerRadius = 30;
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.borderWidth = 1;
    self.bgView.layer.borderColor = [UIColor colorWithHexString:@"#187054"].CGColor;
}

@end
