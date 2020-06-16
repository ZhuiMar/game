//
//  HWGZiMuCell.m
//  HandWrittenGothic
//
//  Created by  luzhaoyang on 2020/3/18.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import "HWGZiMuCell.h"

@interface HWGZiMuCell ()

@end

@implementation HWGZiMuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.bgView.layer.cornerRadius = 8;
    self.bgView.layer.masksToBounds = YES;
    self.bgView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    self.titleLabel.font = [UIFont fontWithName:FontName size:70];
    self.subTitleLabel.font = [UIFont systemFontOfSize:22];
}

@end
