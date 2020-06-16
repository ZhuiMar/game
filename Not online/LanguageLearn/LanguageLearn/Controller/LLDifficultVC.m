//
//  LLDifficultVC.m
//  LanguageLearn
//
//  Created by  luzhaoyang on 2020/3/19.
//  Copyright © 2020 haike. All rights reserved.
//

#import "LLDifficultVC.h"

#define KScreenWidth  [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height
#define TheStatusBarHeight  ([[UIApplication sharedApplication] statusBarFrame].size.height)
#define TheNavBarHeight 44
#define StatusBar_NavBar_Height ((TheStatusBarHeight) + (TheNavBarHeight))

@interface LLDifficultVC ()<LLOverVCDelegate>

@property (weak, nonatomic) IBOutlet UILabel *contentView;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;

@property (nonatomic,assign)NSInteger count;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topButtomLayout;

@end

@implementation LLDifficultVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Difficult";
    self.contentView.font = [UIFont fontWithName:FontName size:15];
    self.questionLabel.font = [UIFont fontWithName:FontName size:30];
    self.count = 0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    DrawLineVC *vc = [[DrawLineVC alloc] init];
    [self.view addSubview:vc.view];
    
    vc.view.frame = self.view.bounds;
    
    [self.view addSubview:vc.view];
    self.questionLabel.text = @"0/3";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange:) name:@"textChange" object:nil];
    
    if kiPhone5 {
        self.topLayout.constant = 64;
        self.topButtomLayout.constant = 0;
        self.contentView.font = [UIFont fontWithName:FontName size:16];
        self.questionLabel.font = [UIFont fontWithName:FontName size:16];
    }
}

- (void)textChange:(NSNotification *)info{
    
    self.count = self.count + 1;
    NSString *str = (NSString *)info.object;
    self.questionLabel.text = [NSString stringWithFormat:@"%@/3",str];
    
    if(self.count == 3){
        if ([str intValue] == 3) {
            LLOverVC *overVC = [[LLOverVC alloc]initWithScored:10];
            overVC.delegate = self;
            [self.navigationController pushViewController:overVC animated:YES];
        }else{
            LLOverVC *overVC = [[LLOverVC alloc]initWithScored:[str intValue]];
            overVC.delegate = self;
            overVC.frome = @"hard";
            [self.navigationController pushViewController:overVC animated:YES];
        }
    }
}

- (void)againAction{
    
}

@end
