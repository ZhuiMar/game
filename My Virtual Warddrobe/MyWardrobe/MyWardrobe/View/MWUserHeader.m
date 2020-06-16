//
//  MWUserHeader.m
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/16.
//  Copyright © 2020 honghai. All rights reserved.
//

#import "MWUserHeader.h"

@interface MWUserHeader()

@end

@implementation MWUserHeader

+ (instancetype)getHeaderView{
    MWUserHeader *view = [[[NSBundle mainBundle] loadNibNamed:@"MWUserHeader" owner:nil options:nil] lastObject];
    view.isUp = YES;
    [view.arrowBtn setHidden:YES];
    return view;
}

- (IBAction)arrowBtnAction:(UIButton *)buttion {
    
//    if(self.isUp == NO){
//        [self.arrowBtn setBackgroundImage:[UIImage imageNamed:@"click_on"] forState:UIControlStateNormal];
//    }else{
//        [self.arrowBtn setBackgroundImage:[UIImage imageNamed:@"click_on2"] forState:UIControlStateNormal];
//    }
//    [self.delegate clickBtnuUp:self.isUp];
//    self.isUp = !self.isUp;

}

@end
