//
//  MWAddLooksCell.m
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/28.
//  Copyright © 2020 honghai. All rights reserved.
//

#import "MWAddLooksCell.h"

@implementation MWAddLooksCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageView.layer.cornerRadius = 8;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.borderWidth = 0.5;
    self.imageView.layer.borderColor = [UIColor colorWithHexString:@"#BFBFBF"].CGColor;
    self.imageView.backgroundColor = [UIColor clearColor];
    self.imageView.contentMode =  UIViewContentModeScaleAspectFill;
}

@end
