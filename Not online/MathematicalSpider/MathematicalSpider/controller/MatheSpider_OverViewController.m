//
//  MatheSpider_OverViewController.m
//  MathematicalSpider
//
//  Created by luzhaoyang on 2020/4/20.
//  Copyright © 2020 teresa. All rights reserved.
//

#import "MatheSpider_OverViewController.h"

@interface MatheSpider_OverViewController ()

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property(nonatomic, assign)NSInteger score;

@property(nonatomic, copy) MatheSpiderOverBlock home;
@property(nonatomic, copy) MatheSpiderOverBlock again;

@end

@implementation MatheSpider_OverViewController

- (instancetype)initScore:(NSInteger)score home:(MatheSpiderOverBlock)home again:(MatheSpiderOverBlock)again{
    if(self = [super init]){
        self.score = score;
        self.home = home;
        self.again = again;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.score];
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
