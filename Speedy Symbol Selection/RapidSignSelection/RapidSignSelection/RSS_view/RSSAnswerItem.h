//
//  RSSAnswerItem.h
//  RapidSignSelection
//
//  Created by zy on 2020/6/5.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RSSAnswerItemDelegate <NSObject>

- (void)clcikItemWithAnswer:(NSInteger)answer;

@end

@interface RSSAnswerItem : UIView

@property (weak, nonatomic) IBOutlet UIImageView *one;
@property (weak, nonatomic) IBOutlet UIImageView *two;
@property (weak, nonatomic) IBOutlet UIImageView *three;

@property (weak,nonatomic) id<RSSAnswerItemDelegate>delegate;

+ (instancetype)getRSSAnswerItem;
- (void)setFuWithArr:(NSArray *)arr;

@end

NS_ASSUME_NONNULL_END
