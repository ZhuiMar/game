//
//  SleepHelper_TabbarView.m
//  SleepHelper
//
//  Created by zy on 2020/5/18.
//  Copyright © 2020 tianma. All rights reserved.
//

#import "SleepHelper_TabbarView.h"

@implementation SleepHelper_TabbarView

+ (instancetype)getTabarView{
    SleepHelper_TabbarView *view = [[NSBundle mainBundle] loadNibNamed:@"SleepHelper_TabbarView" owner:self options:nil].firstObject;
    return view;
}

@end
