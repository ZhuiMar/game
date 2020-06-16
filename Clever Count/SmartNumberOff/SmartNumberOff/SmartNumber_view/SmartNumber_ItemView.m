//
//  SmartNumber_ItemView.m
//  SmartNumberOff
//
//  Created by zy on 2020/5/6.
//  Copyright © 2020 ximan. All rights reserved.
//

#import "SmartNumber_ItemView.h"

@interface SmartNumber_ItemView()


@end

@implementation SmartNumber_ItemView

+ (instancetype)getSmartView{
    SmartNumber_ItemView *view = [[NSBundle mainBundle] loadNibNamed:@"SmartNumber_ItemView" owner:self options:nil].firstObject;
    view.number.titleLabel.font = [UIFont fontWithName:FontName size:20];
    [view.number setTitleColor:[NSObject SmartNumber_colorWithHexString:@"#D46E5B"] forState:UIControlStateNormal];
    [view.arrow setHidden:YES];
    [view.number setHidden:YES];
    return view;
}

@end
