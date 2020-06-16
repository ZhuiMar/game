//
//  MathForward_OverViewController.m
//  MathForward
//
//  Created by luzhaoyang on 2020/4/21.
//  Copyright © 2020 teresa. All rights reserved.
//

#import "MathForward_OverViewController.h"

@interface MathForward_OverViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property(nonatomic, copy)MathForward_OverBlcok home;
@property(nonatomic, copy)MathForward_OverBlcok again;
@property(nonatomic, assign)NSInteger score;
@property(nonatomic, assign)NSInteger type;
@property(nonatomic, assign)BOOL isSu;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation MathForward_OverViewController

- (instancetype)initWithScore:(NSInteger)score type:(NSInteger)type isSu:(BOOL)isSu home:(MathForward_OverBlcok)home again:(MathForward_OverBlcok)again{
    if(self = [super init]){
        self.score = score;
        self.home = home;
        self.again = again;
        self.type = type;
        self.isSu = isSu;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];

    if(self.type == 1){
        self.imageView.image = [UIImage imageNamed:@"bg-1"];
        [self.scoreLabel setHidden:NO];
        self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.score];
    }else{
        [self.scoreLabel setHidden:YES];
        if(self.isSu == YES){
            self.imageView.image = [UIImage imageNamed:@"congratulation"];
        }else{
            self.imageView.image = [UIImage imageNamed:@"failed"];
        }
    }
}
- (IBAction)homeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.home){
        self.home();
    }
}
- (IBAction)againAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.again){
        self.again();
    }
}

@end
