//
//  FMNoneCell.m
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/13.
//  Copyright © 2020年 guanhua. All rights reserved.
//

#import "FMNoneCell.h"

@implementation FMNoneCell

- (void)awakeFromNib {
    [super awakeFromNib];
    NSInteger fontSize = 24;
    if kiPhone5 {
        fontSize = 20;
    }
    self.noneLabel.font = [UIFont fontWithName:FontName size:fontSize];
    self.backgroundColor = [UIColor colorWithHexString:@"#F9F1F0"];
}

@end
