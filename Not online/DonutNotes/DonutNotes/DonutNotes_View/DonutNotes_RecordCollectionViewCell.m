//
//  DonutNotes_RecordCollectionViewCell.m
//  DonutNotes
//
//  Created by luzhaoyang on 2020/4/19.
//  Copyright © 2020 willows. All rights reserved.
//

#import "DonutNotes_RecordCollectionViewCell.h"

@implementation DonutNotes_RecordCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 14;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 2;
    self.layer.borderColor = [NSObject DonutNotes_colorWithHexString:@"#83250A"].CGColor;
}

@end
