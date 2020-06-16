//
//  SASearchView.m
//  SimulateAnimalCall
//
//  Created by luzhaoyang on 2020/4/8.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "SASearchView.h"

@interface SASearchView()<UITextFieldDelegate>

@property(nonatomic, copy)TextBlock text;


@end

@implementation SASearchView

+ (instancetype)getSearchViewText:(TextBlock)text{
    SASearchView *view = [[NSBundle mainBundle] loadNibNamed:@"SASearchView" owner:self options:nil].firstObject;
    view.frame = CGRectMake(0, 0, 200, 40);
    [view setUI:text view:view];
    return view;
}

- (void)setUI:(TextBlock)text view:(SASearchView *)view{
    view.textFiled.delegate = self;
    view.text = text;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:)name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:)name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWasShown:(NSNotification*)aNotification{
    
}
- (void)keyboardWillBeHidden:(NSNotification*)aNotification{
    if(self.text){
        self.text(self.textFiled.text);
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self endEditing:YES];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [self.tishi setHidden:YES];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString * str = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if(str.length == 0){
        [self.tishi setHidden:NO];
    }else{
        [self.tishi setHidden:YES];
    }
    return YES;
}

@end
