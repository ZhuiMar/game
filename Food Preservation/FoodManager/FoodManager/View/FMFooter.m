//
//  FMFooter.m
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/13.
//  Copyright © 2020年 guanhua. All rights reserved.
//

#import "FMFooter.h"

@implementation FMFooter

- (void)awakeFromNib {
    [super awakeFromNib];
    if kiPhone5 {
        self.with.constant = 60;
        self.height.constant = 60;
    }
}
- (IBAction)addAction:(id)sender {
    [self.delegate addFood];
}

@end
