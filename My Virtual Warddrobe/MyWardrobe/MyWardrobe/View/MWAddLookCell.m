//
//  MWAddLookCell.m
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/28.
//  Copyright © 2020 honghai. All rights reserved.
//

#import "MWAddLookCell.h"

@implementation MWAddLookCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.bgView.layer.cornerRadius = 8;
    self.bgView.layer.masksToBounds = YES;
}

@end
