//
//  RSSOverViewController.m
//  RapidSignSelection
//
//  Created by zy on 2020/6/5.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "RSSOverViewController.h"

@interface RSSOverViewController ()

@property (weak, nonatomic) IBOutlet UILabel *soreLabel;

@property(nonatomic,copy) RSSOverViewBlock home;
@property(nonatomic,copy) RSSOverViewBlock again;
@property(nonatomic,assign) NSInteger score;

@end

@implementation RSSOverViewController

- (instancetype)initWithScoreNumber:(NSInteger)score homeBlock:(RSSOverViewBlock)homeBlock againBlock:(RSSOverViewBlock)againBlock{
    if(self = [super init]){
        self.score = score;
        self.home = homeBlock;
        self.again = againBlock;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    self.soreLabel.text = [NSString stringWithFormat:@"%ld",self.score];
}

- (IBAction)againAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.again){
        self.again();
    }
}

- (IBAction)homAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.home){
        self.home();
    }
}

@end
