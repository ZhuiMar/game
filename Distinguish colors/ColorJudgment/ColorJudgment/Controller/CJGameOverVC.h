//
//  CJGameOverVC.h
//  ColorJudgment
//
//  Created by  luzhaoyang on 2020/3/17.
//  Copyright © 2020 haike. All rights reserved.
//

#import "CJBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CJGameOverVCDelegate <NSObject>

- (void)homeAction;
- (void)againAction;

@end

@interface CJGameOverVC : CJBaseVC

@property(nonatomic,weak) id<CJGameOverVCDelegate>delegate;

- (instancetype)initWithSorce:(NSString *)sorce;

@end

NS_ASSUME_NONNULL_END
