//
//  LLHomeVC.m
//  HandWrittenGothic
//
//  Created by  luzhaoyang on 2020/3/19.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import "LLHomeVC.h"

@interface LLHomeVC ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;

@end

@implementation LLHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    if kiPhone5 {
        self.topLayout.constant = 50;
    }
}

- (IBAction)studybtn:(id)sender {
    LLStudy *studyVC = [[LLStudy alloc]init];
    [self.navigationController pushViewController:studyVC animated:YES];
}
- (IBAction)QuizAction:(id)sender {
    LLQuizVC *quizVC = [[LLQuizVC alloc]init];
    [self.navigationController pushViewController:quizVC animated:YES];
}
- (IBAction)introductionAction:(id)sender {
    LLIntroductionVC *introductionVC = [[LLIntroductionVC alloc]init];
    [self.navigationController pushViewController:introductionVC animated:YES];
}

@end
