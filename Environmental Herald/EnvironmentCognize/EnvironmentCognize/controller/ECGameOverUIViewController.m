//
//  ECGameOverUIViewController.m
//  EnvironmentCognize
//
//  Created by luzhaoyang on 2020/4/7.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "ECGameOverUIViewController.h"

@interface ECGameOverUIViewController ()

@property (weak, nonatomic) IBOutlet UIButton *againBtn;
@property (weak, nonatomic) IBOutlet UIButton *homeBtn;

@property (nonatomic,assign) NSInteger score;

@property (weak, nonatomic) IBOutlet UILabel *contentlabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *W;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *H;


@end

@implementation ECGameOverUIViewController

- (instancetype)initWithScore:(NSInteger)score{
    if(self = [super init]){
        self.score = score;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    self.againBtn.titleLabel.font = [UIFont fontWithName:FontNameTitle size:18];
    self.homeBtn.titleLabel.font = [UIFont fontWithName:FontNameTitle size:18];
    
    self.homeBtn.layer.cornerRadius = 6;
    self.homeBtn.layer.masksToBounds = YES;

    self.againBtn.layer.cornerRadius = 6;
    self.againBtn.layer.masksToBounds = YES;
    
    if(self.score == 3){
        self.contentlabel.text = @"That's great. All right";
    }else{
        self.contentlabel.text = @"";
    }
    
    if kiPhone5 {
        self.H.constant = 200;
        self.W.constant = 280;
    }
}

- (IBAction)againAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.againBlock){
        self.againBlock();
    }
}

- (IBAction)homeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.homeBlock){
        self.homeBlock();
    }
}

@end
