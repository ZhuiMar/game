//
//  FMFoodCell.m
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/13.
//  Copyright © 2020 guanhua. All rights reserved.
//

#import "FMFoodCell.h"

@implementation FMFoodCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.name.font = [UIFont fontWithName:FontName size:18];
}

@end
