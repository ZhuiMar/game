//
//  MPAddFooterView.h
//  MyPlan
//
//  Created by  luzhaoyang on 2020/3/28.
//  Copyright © 2020 yunxi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MPAddFooterViewDelegate <NSObject>

- (void)addActionWithType:(NSInteger)type;

@end

@interface MPAddFooterView : UIView

@property(nonatomic,weak) id<MPAddFooterViewDelegate>delegate;

+ (instancetype)getAddFooterViewType:(NSInteger)type;

@end

NS_ASSUME_NONNULL_END
