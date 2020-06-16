//
//  FMSectionHeader.m
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/13.
//  Copyright © 2020年 guanhua. All rights reserved.
//

#import "FMSectionHeader.h"

@implementation FMSectionHeader

- (void)awakeFromNib {
    [super awakeFromNib];
    NSInteger fontSize = 24;
    if kiPhone5 {
        fontSize = 20;
    }
    self.titleLabel.font = [UIFont fontWithName:@"SegoePrint-Bold" size:fontSize];
}

@end
