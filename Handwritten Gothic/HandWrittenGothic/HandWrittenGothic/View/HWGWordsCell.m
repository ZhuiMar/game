//
//  HWGWordsCell.m
//  HandWrittenGothic
//
//  Created by  luzhaoyang on 2020/3/18.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import "HWGWordsCell.h"

@implementation HWGWordsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.layer.cornerRadius = 10;
    self.contentView.layer.masksToBounds = YES;
}

@end
