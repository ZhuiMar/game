//
//  LLOverVC.m
//  LanguageLearn
//
//  Created by  luzhaoyang on 2020/3/19.
//  Copyright © 2020 haike. All rights reserved.
//

#import "LLOverVC.h"

@interface LLOverVC ()

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (nonatomic, assign) NSInteger score;

@end

@implementation LLOverVC

- (instancetype)initWithScored:(NSInteger)score{
    if(self = [super init]){
        self.score = score;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Well done";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setFont];
}

- (void)setFont{
    self.contentLabel.font = [UIFont fontWithName:FontName size:30];
    if(self.score == 10){
        
        self.contentLabel.text = [NSString stringWithFormat:@"Good,\n %d questions \n answered correctly",10];
        self.contentLabel.textColor = [UIColor colorWithHexString:@"#EB2D56"];
        
    }else if (self.score >= 5 && self.score < 10){
        
        self.contentLabel.text = [NSString stringWithFormat:@"Good,\n %ld questions \n answered correctly",self.score];
        self.contentLabel.textColor = [UIColor colorWithHexString:@"#EB2D56"];
        
    }else if (self.score > 0 && self.score < 5){
        
        self.contentLabel.text = [NSString stringWithFormat:@"Keep working hard \n and got %ld questions right",self.score];
        self.contentLabel.textColor = [UIColor colorWithHexString:@"#EB2D56"];
        
    }else if (self.score == 0){
        self.contentLabel.text = @"Please do not lose \n heart,\n try again";
        self.contentLabel.textColor = [UIColor colorWithHexString:@"#9C5623"];
    }
}


- (IBAction)againAction:(id)sender {
    if([self.frome isEqualToString:@"hard"]){
        for (UIViewController *controller in self.navigationController.viewControllers) {
            if ([controller isKindOfClass:[LLQuizVC class]]) {
                LLQuizVC *A =(LLQuizVC *)controller;
                [self.navigationController popToViewController:A animated:NO];
                LLDifficultVC *vc = [[LLDifficultVC alloc]init];
                [A.navigationController pushViewController:vc animated:NO];
            }
        }
    }else{
        [self.navigationController popViewControllerAnimated:YES];
        [self.delegate againAction];
    }
}
- (IBAction)homeAction:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES ];
}

@end
