//
//  MysteryBoard_OverVC.m
//  MysteryBoard
//
//  Created by zy on 2020/4/23.
//  Copyright © 2020 wansheng. All rights reserved.
//

#import "MysteryBoard_OverVC.h"

@interface MysteryBoard_OverVC ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@property (weak, nonatomic) IBOutlet UILabel *wrongLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;
@property (weak, nonatomic) IBOutlet UILabel *starLabel;

@property(nonatomic,assign) NSInteger score;
@property(nonatomic,assign) NSInteger taotalCount;

@property(nonatomic,copy) MysteryBoard_OverBlock home;
@property(nonatomic,copy) MysteryBoard_OverBlock again;

@end

@implementation MysteryBoard_OverVC

- (instancetype)initWithScore:(NSInteger)score totalCount:(NSInteger)total home:(MysteryBoard_OverBlock)home again:(MysteryBoard_OverBlock)again{
    if(self = [super init]){
        self.score = score;
        self.taotalCount = total;
        self.home = home;
        self.again = again;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if iPhoneX_MORE {
        self.topLayout.constant = 118;
    }
    
    self.rightLabel.text = [NSString stringWithFormat:@"x%ld",self.score];
    self.wrongLabel.text = [NSString stringWithFormat:@"x%ld",self.taotalCount-self.score];
    
    if(self.score == self.taotalCount){
        NSNumber *count = [[NSUserDefaults standardUserDefaults] objectForKey:@"MysteryBoard_star"];
        if(count==nil){
            [[NSUserDefaults standardUserDefaults] setObject:@(1) forKey:@"MysteryBoard_star"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }else{
            NSInteger num = [count integerValue] + 1;
            [[NSUserDefaults standardUserDefaults] setObject:@(num) forKey:@"MysteryBoard_star"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
    NSNumber *count = [[NSUserDefaults standardUserDefaults] objectForKey:@"MysteryBoard_star"];
    if(count==nil){
        self.starLabel.text = @"0";
    }else{
        self.starLabel.text = [NSString stringWithFormat:@"x%ld",[count integerValue]];
    }
}

- (IBAction)againAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.again){
        self.again();
    }
}
- (IBAction)homeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.home){
        self.home();
    }
}

@end
