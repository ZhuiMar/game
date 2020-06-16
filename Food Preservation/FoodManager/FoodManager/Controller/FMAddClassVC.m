//
//  FMAddClassVC.m
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/13.
//  Copyright © 2020 guanhua. All rights reserved.
//

#import "FMAddClassVC.h"

@interface FMAddClassVC ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cancelH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *okH;

@end

@implementation FMAddClassVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.cornerRadius = 15;
    self.view.layer.masksToBounds = YES;
    
    if kiPhone5 {
        self.name.font = [UIFont fontWithName:FontName size:20];
        self.nameTf.font = [UIFont fontWithName:FontName size:16];
    }else{
        self.name.font = [UIFont fontWithName:FontName size:24];
        self.nameTf.font = [UIFont fontWithName:FontName size:20];
    }

    self.nameTf.textColor = [UIColor colorWithHexString:@"#417D50"];
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:self.nameTf.placeholder];
    [placeholder addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:FontName size:18]
                        range:NSMakeRange(0, self.nameTf.placeholder.length)];
    self.nameTf.attributedPlaceholder = placeholder;
    
    if kiPhone5 {
        self.cancelH.constant = 28;
        self.okH.constant = 28;
    }
}

- (IBAction)cancelAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)OKAction:(id)sender {
    if ([self.nameTf.text isEqualToString:@""]){
        return;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.delegate okActionWithName:self.nameTf.text];
}

@end
