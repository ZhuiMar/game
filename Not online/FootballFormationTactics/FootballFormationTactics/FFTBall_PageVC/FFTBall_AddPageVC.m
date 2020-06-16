//
//  FFTBall_AddPageVC.m
//  FootballFormationTactics
//
//  Created by zy on 2020/5/27.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import "FFTBall_AddPageVC.h"
#import "UIColor+MBBall_color.h"
#import "PGDatePickManager.h"
#import "UIColor+MBBall_color.h"
#import "FFTBall_PlanModel.h"
#import "FFTBall_PlanPageVC.h"

#define angle2Radian(angle) ((angle) / 180.0 * M_PI)

@interface FFTBall_AddPageVC ()<UITextFieldDelegate,PGDatePickerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *oneText;
@property (weak, nonatomic) IBOutlet UITextField *twoText;
@property (weak, nonatomic) IBOutlet UITextField *threeText;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nextBution;

@property(nonatomic, strong) UIBarButtonItem *backBottonItem;
@property(nonatomic, strong) UIButton *backBottom;

@end

@implementation FFTBall_AddPageVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    self.oneText.text = @"";
    self.twoText.text = @"";
    self.threeText.text = @"";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUi];
    [self.oneText becomeFirstResponder];
    if kiPhone5 {
        self.nextBution.constant = 80;
    }
    self.navigationItem.leftBarButtonItem = self.backBottonItem;
}

- (void)setUi{
    self.oneText.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.4];
    self.oneText.layer.borderColor = [UIColor whiteColor].CGColor;
    self.oneText.layer.borderWidth = 2;
    
    self.twoText.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.4];
    self.twoText.layer.borderColor = [UIColor whiteColor].CGColor;
    self.twoText.layer.borderWidth = 2;
    
    self.threeText.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.4];
    self.threeText.layer.borderColor = [UIColor whiteColor].CGColor;
    self.threeText.layer.borderWidth = 2;
    
    self.oneText.textColor = [UIColor FFTBall_colorWithHexString:@"#FFBD56"];
    self.oneText.font = [UIFont fontWithName:TEXTFONT size:18];
    
    self.twoText.textColor = [UIColor FFTBall_colorWithHexString:@"#FFBD56"];
    self.twoText.font = [UIFont fontWithName:TEXTFONT size:18];
    
    self.threeText.textColor = [UIColor FFTBall_colorWithHexString:@"#FFBD56"];
    self.threeText.font = [UIFont fontWithName:TEXTFONT size:18];
    
    self.oneText.delegate = self;
    self.twoText.delegate = self;
    self.threeText.delegate = self;
}

- (IBAction)nextAction:(id)sender {
    
    if([self.oneText.text isEqualToString:@""]){
        [self shakeView:self.oneText];
        return;
    }
    if([self.twoText.text isEqualToString:@""]){
        [self shakeView:self.twoText];
        return;
    }
    if([self.threeText.text isEqualToString:@""]){
        [self shakeView:self.threeText];
        return;
    }

    FFTBall_PlanPageVC *pageVC = [[FFTBall_PlanPageVC alloc]init];
    pageVC.name = self.oneText.text;
    pageVC.date = self.twoText.text;
    pageVC.place = self.threeText.text;
    [self.navigationController pushViewController:pageVC animated:YES];
}

- (void)shakeView:(UIView *)viewToShake{
    CGFloat t = 4.0;
    CGAffineTransform translateRight  =CGAffineTransformTranslate(CGAffineTransformIdentity, t,0.0);
    CGAffineTransform translateLeft =CGAffineTransformTranslate(CGAffineTransformIdentity,-t,0.0);
    viewToShake.transform = translateLeft;
    [UIView animateWithDuration:0.07 delay:0.0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:2.0];
        viewToShake.transform = translateRight;
    } completion:^(BOOL finished){
        if(finished){
            [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                viewToShake.transform =CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if(textField == self.oneText){
        return YES;
    }
    if(textField == self.twoText){
        PGDatePickManager *datePickManager = [[PGDatePickManager alloc]init];
        datePickManager.isShadeBackground = true;
        PGDatePicker *datePicker = datePickManager.datePicker;
        datePicker.delegate = self;
        datePicker.datePickerType = PGDatePickerTypeVertical;
        datePicker.isHiddenMiddleText = false;
        datePicker.datePickerMode = PGDatePickerModeDate;
        
        datePickManager.headerViewBackgroundColor = [UIColor whiteColor];
        datePicker.lineBackgroundColor = [UIColor whiteColor];
        datePicker.textColorOfSelectedRow = [UIColor FFTBall_colorWithHexString:@"#FFBD56"];
        datePickManager.confirmButtonTextColor = [UIColor FFTBall_colorWithHexString:@"#FFBD56"];
        
        datePickManager.confirmButtonFont = [UIFont fontWithName:TEXTFONT size:17];
        datePickManager.cancelButtonFont = [UIFont fontWithName:TEXTFONT size:17];

        [self presentViewController:datePickManager animated:false completion:nil];
        return NO;
    }
    if(textField == self.threeText){
        return YES;
    }
    return YES;
}

- (void)datePicker:(PGDatePicker *)datePicker didSelectDate:(NSDateComponents *)dateComponents {
    NSLog(@"dateComponents = %@", dateComponents);
    NSInteger year = dateComponents.year;
    NSInteger month = dateComponents.month;
    NSInteger day = dateComponents.day;
    self.twoText.text = [NSString stringWithFormat:@"%ld/%ld/%ld",year,month,day];
}

- (UIButton *)backBottom{
    if(_backBottom == nil){
        _backBottom = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBottom.frame = CGRectMake(0, 0, 30, 30);
        [_backBottom setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [_backBottom addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBottom;
}
- (UIBarButtonItem *)backBottonItem{
    if(_backBottonItem == nil){
        _backBottonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBottom];
    }
    return _backBottonItem;
}

- (void)backAction:(UIButton *)buttion{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
