//
//  SAAnimalCell.m
//  SimulateAnimalCall
//
//  Created by luzhaoyang on 2020/4/8.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "SAAnimalCell.h"

@implementation SAAnimalCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.bgView.layer.cornerRadius = 8;
    self.bgView.layer.masksToBounds = YES;
}

@end
