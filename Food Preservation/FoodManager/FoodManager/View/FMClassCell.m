//
//  FMClassCell.m
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/13.
//  Copyright © 2020 guanhua. All rights reserved.
//

#import "FMClassCell.h"

@implementation FMClassCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageName.font = [UIFont fontWithName:FontName size:18];
    if kiPhone5 {
        self.leftLayout.constant = 15;
        self.rightLayout.constant = 15;
        self.heightLayout.constant = 60;
    }
}

@end
