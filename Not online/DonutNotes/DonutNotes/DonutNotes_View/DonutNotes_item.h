//
//  DonutNotes_item.h
//  DonutNotes
//
//  Created by luzhaoyang on 2020/4/18.
//  Copyright © 2020 willows. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DonutNotes_item : UIView

@property (weak, nonatomic) IBOutlet UIImageView *bgImageViwe;
@property (weak, nonatomic) IBOutlet UIView *centerView;
@property (weak, nonatomic) IBOutlet UIImageView *fuImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *withLayout;

@property(nonatomic, copy)NSString *fuImageName;
@property(nonatomic, copy)NSString *bgImageName;

+ (instancetype)getItem;
- (void)setItemFu:(NSString *)string;
- (void)setItemBg:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
