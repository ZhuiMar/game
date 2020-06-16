//
//  FFTBall_AddPlayersVC.m
//  FootballFormationTactics
//
//  Created by zy on 2020/5/28.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import "FFTBall_AddPlayersVC.h"
#import "UIColor+MBBall_color.h"

@interface FFTBall_AddPlayersVC ()

@property(nonatomic,copy) FFTBall_AddPlayersBlock numBlock;
@property (weak, nonatomic) IBOutlet UITextField *textFiled;

@end

@implementation FFTBall_AddPlayersVC

- (instancetype)initWithNumberBlock:(FFTBall_AddPlayersBlock)numBlock{
    if(self = [super init]){
        self.numBlock = numBlock;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textFiled.keyboardType = UIKeyboardTypeNumberPad;
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    self.textFiled.textColor = [UIColor FFTBall_colorWithHexString:@"#FFBD56"];
    self.textFiled.font = [UIFont fontWithName:TEXTFONT size:18];
}

- (IBAction)cancelAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addAction:(id)sender {
    if([self.textFiled.text isEqualToString:@""]){
        return;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.numBlock){
        self.numBlock([self.textFiled.text integerValue]);
    }
}

@end
