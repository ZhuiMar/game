//
//  CJGameOverVC.m
//  ColorJudgment
//
//  Created by  luzhaoyang on 2020/3/17.
//  Copyright © 2020 haike. All rights reserved.
//

#import "CJGameOverVC.h"

@interface CJGameOverVC ()

@property (weak, nonatomic) IBOutlet UILabel *socreLabel;
@property (nonatomic,copy) NSString *fen;

@end

@implementation CJGameOverVC

- (instancetype)initWithSorce:(NSString *)sorce{
    if(self = [super init]){
        self.fen = sorce;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    self.socreLabel.text = self.fen;
}
- (IBAction)okAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.delegate homeAction];
}
- (IBAction)startAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.delegate againAction];
}

@end
