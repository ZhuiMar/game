//
//  SmartDetective_GameOverViewController.m
//  SmartDetective
//
//  Created by zy on 2020/5/13.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import "SmartDetective_GameOverViewController.h"

@interface SmartDetective_GameOverViewController ()

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property(nonatomic, copy)SmartDetective_Block home;
@property(nonatomic, copy)SmartDetective_Block again;
@property(nonatomic, assign)NSInteger score;
@property(nonatomic, assign)NSInteger level;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *weightLayout;

@end

@implementation SmartDetective_GameOverViewController

- (instancetype)initWithScore:(NSInteger)score level:(NSInteger)level homeBlock:(SmartDetective_Block)homeBlock againBlock:(SmartDetective_Block)againBlock{
    if(self = [super init]){
        self.home = homeBlock;
        self.again = againBlock;
        self.score = score;
        self.level = level;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.score];
    
    if(self.level == 1){
        NSArray *arr = [NSObject SmartDetective_getRankingKey:@"MathForward_simple"];
        NSNumber *num = arr.firstObject;
        if(num.integerValue < self.score){
            self.textLabel.text = @"Set a new record";
        }else{
            self.textLabel.text = [NSString stringWithFormat:@"Top score:%@",num];
        }
    }
    if(self.level == 2){
        NSArray *arr = [NSObject SmartDetective_getRankingKey:@"MathForward_general"];
        NSNumber *num = arr.firstObject;
        if(num.integerValue < self.score){
            self.textLabel.text = @"Set a new record";
        }else{
            self.textLabel.text = [NSString stringWithFormat:@"Top score:%@",num];
        }
    }
    if(self.level == 3){
        NSArray *arr = [NSObject SmartDetective_getRankingKey:@"MathForward_difficult"];
        NSNumber *num = arr.firstObject;
        if(num.integerValue < self.score){
            self.textLabel.text = @"Set a new record";
        }else{
            self.textLabel.text = [NSString stringWithFormat:@"Top score:%@",num];
        }
    }
    
    if kiPhone5 {
        self.weightLayout.constant = 290;
        self.heightLayout.constant = 250;
    }
}

- (IBAction)homeAc:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.home){
        self.home();
    }
}
- (IBAction)againAc:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.again){
        self.again();
    }
}

@end
