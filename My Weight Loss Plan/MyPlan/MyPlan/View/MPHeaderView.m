//
//  MPHeaderView.m
//  MyPlan
//
//  Created by  luzhaoyang on 2020/3/28.
//  Copyright © 2020 yunxi. All rights reserved.
//

#import "MPHeaderView.h"

@implementation MPHeaderView
+ (instancetype)getHeaderViewType:(NSInteger)type{
    MPHeaderView *view = [[NSBundle mainBundle] loadNibNamed:@"MPHeaderView" owner:self options:nil].firstObject;
    view.type = type;
    [view setUiWithView:view];
    return view;
}

- (void)setUiWithView:(MPHeaderView *)view{
    
    view.iconNameLabel.font = [UIFont fontWithName:FontName size:25];
    view.choseBg.layer.cornerRadius = 6;
    view.choseBg.layer.masksToBounds = YES;
    view.choseBg.backgroundColor = [UIColor clearColor];
    view.choseBg.layer.borderColor = [UIColor colorWithHexString:@"#284962"].CGColor;
    view.choseBg.layer.borderWidth = 1;
    
    view.textfiledBg.layer.cornerRadius = 6;
    view.textfiledBg.layer.masksToBounds = YES;
    view.textfiledBg.backgroundColor = [UIColor clearColor];
    view.textfiledBg.layer.borderColor = [UIColor colorWithHexString:@"#284962"].CGColor;
    view.textfiledBg.layer.borderWidth = 1;
    
    self.textFile.font = [UIFont fontWithName:FontName size:18];
    self.textFile.textColor = [UIColor colorWithHexString:@"#868FB3"];
    self.textStrLenght.font = [UIFont fontWithName:FontName size:18];
    self.textStrLenght.textColor = [UIColor colorWithHexString:@"#868FB3"];
    self.chooseCountLabel.font = [UIFont fontWithName:FontName size:20];
    self.chooseCountLabel.textColor = [UIColor colorWithHexString:@"#284962"];
    
    if(self.type == 0){
        self.iconType.image = [UIImage imageNamed:@"Breakfast"];
        self.iconNameLabel.text = @"Breakfast";
    }else if (self.type == 1){
        self.iconType.image = [UIImage imageNamed:@"Lunch"];
        self.iconNameLabel.text = @"Lunch";
    }else{
        self.iconType.image = [UIImage imageNamed:@"Dinner"];
        self.iconNameLabel.text = @"Dinner";
    }
    
    if kiPhone5 {
        self.textBgW.constant = 160;
    }
}

- (IBAction)chooseBtnAction:(id)sender {
    if([self.delegate respondsToSelector:@selector(chooseCount:)]){
        [self.delegate chooseCount:self.type];
    }
}
- (IBAction)jianAction:(id)sender {
    if([self.delegate respondsToSelector:@selector(jianAction:)]){
        [self.delegate jianAction:self.type];
    }
}

@end
