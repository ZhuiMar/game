//
//  CJRulesVC.h
//  ColorJudgment
//
//  Created by  luzhaoyang on 2020/3/17.
//  Copyright © 2020 haike. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CJRulesVCDelehgate <NSObject>

- (void)okAction;
- (void)startAction;

@end

@interface CJRulesVC : UIViewController

@property (nonatomic, weak) id<CJRulesVCDelehgate>delegate;

@end

NS_ASSUME_NONNULL_END
