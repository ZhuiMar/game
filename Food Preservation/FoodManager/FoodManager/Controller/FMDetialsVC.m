//
//  FMDetialsVC.m
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/14.
//  Copyright © 2020 guanhua. All rights reserved.
//

#import "FMDetialsVC.h"

@interface FMDetialsVC ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *DetialsBgView;

@property (weak, nonatomic) IBOutlet UILabel *namelabel;
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
@property (weak, nonatomic) IBOutlet UILabel *shelfLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteLabel;

@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *dataTF;
@property (weak, nonatomic) IBOutlet UITextField *shelfTF;
@property (weak, nonatomic) IBOutlet UITextField *timeTF;
@property (weak, nonatomic) IBOutlet UITextField *noteTF;

@end

@implementation FMDetialsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    self.DetialsBgView.layer.cornerRadius = 15;
    self.DetialsBgView.layer.masksToBounds = YES;
    [self setFont];
}

- (void)setFont{
    
    self.titleLabel.font = [UIFont fontWithName:FontName size:28];
    self.namelabel.font = [UIFont fontWithName:FontName size:24];
    self.dataLabel.font = [UIFont fontWithName:FontName size:24];
    self.shelfLabel.font = [UIFont fontWithName:FontName size:24];
    self.timeLeftLabel.font = [UIFont fontWithName:FontName size:24];
    self.noteLabel.font = [UIFont fontWithName:FontName size:24];
    
    self.nameTF.font = [UIFont fontWithName:FontName size:20];
    self.dataTF.font = [UIFont fontWithName:FontName size:20];
    self.shelfTF.font = [UIFont fontWithName:FontName size:20];
    self.timeTF.font = [UIFont fontWithName:FontName size:20];
    self.noteTF.font = [UIFont fontWithName:FontName size:20];
    
    self.nameTF.delegate = self;
    self.dataTF.delegate = self;
    self.shelfTF.delegate = self;
    self.timeTF.delegate = self;
    self.noteTF.delegate = self;
    
    self.nameTF.text = self.name;
    self.dataTF.text = self.data;
    self.shelfTF.text = self.shelf;
    self.timeTF.text = self.time;
    self.noteTF.text = self.note;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return NO;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
