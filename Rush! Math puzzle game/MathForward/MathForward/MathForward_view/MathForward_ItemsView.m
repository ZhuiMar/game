//
//  MathForward_ItemsView.m
//  MathForward
//
//  Created by luzhaoyang on 2020/4/21.
//  Copyright © 2020 teresa. All rights reserved.
//

#import "MathForward_ItemsView.h"

@implementation MathForward_ItemsView

+ (instancetype)getItem{
    MathForward_ItemsView *items = [[NSBundle mainBundle] loadNibNamed:@"MathForward_ItemsView" owner:self options:nil].firstObject;
    [items setUi:items];
    return items;
}

- (void)setUi:(MathForward_ItemsView *)view{
    view.titleBtn.titleLabel.font = [UIFont fontWithName:FontName size:16];
    [view.titleBtn setTitleColor:[NSObject MathForward_colorWithHexString:@"#2C2C2C"] forState:UIControlStateNormal];
    view.titleBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [view.topImageView setHidden:YES];
}

- (void)setTitle{
    
}

@end
