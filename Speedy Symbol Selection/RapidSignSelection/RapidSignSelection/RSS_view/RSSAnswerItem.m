//
//  RSSAnswerItem.m
//  RapidSignSelection
//
//  Created by zy on 2020/6/5.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "RSSAnswerItem.h"
#import "UIColor+colors.h"

@implementation RSSAnswerItem

+ (instancetype)getRSSAnswerItem{
    RSSAnswerItem *item = [[NSBundle mainBundle] loadNibNamed:@"RSSAnswerItem" owner:self options:nil].firstObject;
    item.frame = CGRectMake(0, 0, 74, 144);
    [item setUi:item];
    return item;
}

- (void)setUi:(RSSAnswerItem *)item{
    item.layer.cornerRadius = 18;
    item.layer.masksToBounds = YES;
    item.layer.borderColor = [UIColor RSScolorWithHexString:@"#000000"].CGColor;
    item.layer.borderWidth = 1;
}

- (IBAction)clickItem:(id)sender {
    if([self.delegate respondsToSelector:@selector(clcikItemWithAnswer:)]){
        [self.delegate clcikItemWithAnswer:self.tag];
    }
}

- (void)setFuWithArr:(NSArray *)arr{
    if(arr.count == 3){
        NSInteger one = [arr[0] integerValue];
        NSInteger two = [arr[1] integerValue];
        NSInteger three = [arr[2] integerValue];
        self.one.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",one]];
        self.two.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",two]];
        self.three.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",three]];
    }
}

@end
