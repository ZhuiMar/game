//
//  TDQuestionVC.m
//  TruthOrDare
//
//  Created by  luzhaoyang on 2020/3/10.
//  Copyright © 2020 zhuimar. All rights reserved.
//

#import "TDQuestionVC.h"

@interface TDQuestionVC ()

@property (weak, nonatomic) IBOutlet UIButton *closedBtn;


@property (nonatomic,copy) NSString *str;

@end

@implementation TDQuestionVC

- (instancetype)initWithQuestion:(NSString *)question{
    self = [super init];
    if(self){
        self.str = question;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    [self setFont];
    self.contentLabel.text = self.str;
}

- (void)setFont{
    self.contentLabel.font = [UIFont fontWithName:@"Billgates" size:24];
}

- (void)setQuestion{
    self.contentLabel.text = self.str;
}

- (IBAction)closedAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)okAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)replaceAction:(id)sender {
    [self.delagate replaceAction:self];
}

@end
