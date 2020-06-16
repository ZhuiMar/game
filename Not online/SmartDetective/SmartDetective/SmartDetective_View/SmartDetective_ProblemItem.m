//
//  SmartDetective_ProblemItem.m
//  SmartDetective
//
//  Created by zy on 2020/5/14.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import "SmartDetective_ProblemItem.h"

@interface SmartDetective_ProblemItem()

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (nonatomic, assign) NSInteger level;

@property(nonatomic, strong)NSMutableArray *itemsArr;
@property(nonatomic, strong)NSMutableArray *currentArr;

@end

@implementation SmartDetective_ProblemItem

+ (instancetype)getProblemItemWithLevel:(NSInteger)level withItems:(NSMutableArray *)arr{
    SmartDetective_ProblemItem *item = [[NSBundle mainBundle] loadNibNamed:@"SmartDetective_ProblemItem" owner:self options:nil].firstObject;
    item.itemsArr = arr;
    item.level = level;
    [item initUi:item];
    return item;
}

- (void)initUi:(UIView *)view{
    self.bgView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
    self.bgView.layer.cornerRadius = 14;
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.borderColor = [NSObject SmartDetective_colorWithHexString:@"#943927"].CGColor;
    self.bgView.layer.borderWidth = 1;
    [self.arrowImage setHidden:YES];
    [self random];
}

- (void)random{
    [self.currentArr removeAllObjects];
    self.currentArr = [NSObject SmartDetective_getNewArrWithOldArr:self.itemsArr count:self.level + 1];
    
    for (NSString *string in self.itemsArr) {
        if([self.currentArr containsObject:string] == NO){
            self.rightNumber = [string integerValue];
        }
    }
    
    [self setGift];
}

- (void)setGift{
    
    CGFloat L = 327;
    if kiPhone5 {
        L = 300;
    }
    CGFloat left = (L - (self.level + 1)*60)/2;
    CGFloat top = 10;
    CGFloat W = 60;
    CGFloat H = 63;
    for (int i = 0; i<self.level + 1; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(left + i*W, top, W, H);
        imageView.image = [UIImage imageNamed:self.currentArr[i]];
        [self.bgView addSubview:imageView];
    }
}

- (NSMutableArray *)itemsArr{
    if(_itemsArr == nil){
        _itemsArr = [[NSMutableArray alloc]init];
    }
    return _itemsArr;
}

- (NSMutableArray *)currentArr{
    if(_currentArr == nil){
        _currentArr = [[NSMutableArray alloc]init];
    }
    return _currentArr;
}

@end
