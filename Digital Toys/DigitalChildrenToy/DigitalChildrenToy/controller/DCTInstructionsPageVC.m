//
//  DCTInstructionsPageVC.m
//  DigitalChildrenToy
//
//  Created by luzhaoyang on 2020/4/13.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import "DCTInstructionsPageVC.h"

@interface DCTInstructionsPageVC ()

@property(nonatomic, copy) OkBlock okAction;

@end

@implementation DCTInstructionsPageVC

- (instancetype)initWithOKAction:(OkBlock)okBlock{
    if(self = [super init]){
        self.okAction = okBlock;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
}

- (IBAction)oKAction:(id)sender {
    if(self.okAction){
        self.okAction();
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
