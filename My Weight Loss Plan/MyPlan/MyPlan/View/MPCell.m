//
//  MPCell.m
//  MyPlan
//
//  Created by  luzhaoyang on 2020/3/29.
//  Copyright © 2020 yunxi. All rights reserved.
//

#import "MPCell.h"

@implementation MPCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.nameLabel.font = [UIFont fontWithName:FontName size:20];
    self.countLabel.font = [UIFont fontWithName:FontName size:20];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
