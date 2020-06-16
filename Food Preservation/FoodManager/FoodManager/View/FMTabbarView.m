//
//  FMTabbarView.m
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/13.
//  Copyright © 2020 guanhua. All rights reserved.
//

#import "FMTabbarView.h"

@implementation FMTabbarView

+ (instancetype)getFMTabbarView{
    FMTabbarView *view = [[[NSBundle mainBundle] loadNibNamed:@"FMTabbarView" owner:self options:nil] lastObject];
    view.homeBtn.backgroundColor = [UIColor clearColor];
    view.classBtn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    view.aboutBtn.backgroundColor =  [[UIColor blackColor] colorWithAlphaComponent:0.5];
    return view;
}

- (IBAction)homeAction:(id)sender {
    
}
- (IBAction)classAction:(id)sender {
    
}
- (IBAction)aboutAction:(id)sender {
    
}
@end
