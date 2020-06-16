//
//  MBBall_RecordCell.m
//  MathematicsBasketball
//
//  Created by zy on 2020/5/26.
//  Copyright © 2020 zhongba. All rights reserved.
//

#import "MBBall_RecordCell.h"

@implementation MBBall_RecordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.type.font = [UIFont fontWithName:TEXTFONT size:30];
    self.one.font = [UIFont fontWithName:TEXTFONT size:25];
    self.two.font = [UIFont fontWithName:TEXTFONT size:25];
    self.three.font = [UIFont fontWithName:TEXTFONT size:25];
    self.oneK.font = [UIFont fontWithName:TEXTFONT size:25];
    self.twoK.font = [UIFont fontWithName:TEXTFONT size:25];
    self.threeK.font = [UIFont fontWithName:TEXTFONT size:25];
}

- (void)setArr:(NSArray *)arr{
    
    if(arr.count >= 3){
        
           self.one.text = [NSString stringWithFormat:@"%ld",[arr[0] integerValue]];
           self.two.text = [NSString stringWithFormat:@"%ld",[arr[1] integerValue]];
           self.three.text = [NSString stringWithFormat:@"%ld",[arr[2] integerValue]];
           
       }else if (arr.count == 2){
           
           self.one.text = [NSString stringWithFormat:@"%@",arr[0]];
           self.two.text = [NSString stringWithFormat:@"%@",arr[1]];
           self.three.text = @"0";
           
       }else if (arr.count == 1){
           
           self.one.text = [NSString stringWithFormat:@"%@",arr[0]];
           self.two.text = @"0";
           self.three.text = @"0";
           
       }else{
           
           self.one.text = @"0";
           self.two.text = @"0";
           self.three.text = @"0";
       }
}

@end
