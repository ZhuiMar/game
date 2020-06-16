//
//  DonutNotes_item.m
//  DonutNotes
//
//  Created by luzhaoyang on 2020/4/18.
//  Copyright © 2020 willows. All rights reserved.
//

#import "DonutNotes_item.h"

@implementation DonutNotes_item

+ (instancetype)getItem{
    DonutNotes_item *item = [[NSBundle mainBundle] loadNibNamed:@"DonutNotes_item" owner:self options:nil].firstObject;
    [item setUiWith:item];
    return item;
}

- (void)setUiWith:(DonutNotes_item *)item{
    item.centerView.layer.cornerRadius = 10;
    item.centerView.layer.masksToBounds = YES;
}

- (void)setItemBg:(NSString *)string{
    self.bgImageViwe.image = [UIImage imageNamed:string];
    self.bgImageName = string;
}

- (void)setItemFu:(NSString *)string{
    if([string isEqualToString:@"note"]){
        self.heightLayout.constant = 56/2;
        self.withLayout.constant = 37/2;
    }else if ([string isEqualToString:@"note3"]){
        self.heightLayout.constant = 41/2;
        self.withLayout.constant = 27/2;
    }else if ([string isEqualToString:@"note4"]){
        self.heightLayout.constant = 61/2;
        self.withLayout.constant = 19/2;
    }else if ([string isEqualToString:@"note5"]){
        self.heightLayout.constant = 43;
        self.withLayout.constant = 26;
    }else if ([string isEqualToString:@"note6"]){
        self.heightLayout.constant = 53/2;
        self.withLayout.constant = 17/2;
    }else if ([string isEqualToString:@"note8"]){
        self.heightLayout.constant = 47/2;
        self.withLayout.constant = 15/2;
    }else if ([string isEqualToString:@"note10"]){
        self.heightLayout.constant = 17/2;
        self.withLayout.constant = 51/2;
    }else if ([string isEqualToString:@"note11"]){
        self.heightLayout.constant = 17/2;
        self.withLayout.constant = 51/2;
    }
    self.fuImageView.image = [UIImage imageNamed:string];
    self.fuImageName = string;
}

@end
