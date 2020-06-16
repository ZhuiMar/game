//
//  DonutNotes_TipsViewController.m
//  DonutNotes
//
//  Created by luzhaoyang on 2020/4/18.
//  Copyright © 2020 willows. All rights reserved.
//

#import "DonutNotes_TipsViewController.h"

@interface DonutNotes_TipsViewController ()

@property(nonatomic, copy) OkBlock ok;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

@implementation DonutNotes_TipsViewController

- (instancetype)initWithOkAction:(OkBlock)okAction{
    if(self = [super init]){
        self.ok = okAction;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    self.bgView.layer.cornerRadius = 8;
    self.bgView.layer.masksToBounds = YES;
}

- (IBAction)clickAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.ok){
        self.ok();
    }
}

@end
