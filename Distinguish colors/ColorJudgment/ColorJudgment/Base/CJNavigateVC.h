//
//  CJNavigateVC.h
//  ColorJudgment
//
//  Created by  luzhaoyang on 2020/3/17.
//  Copyright © 2020 haike. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ReturnBlock)(void);

@interface CJNavigateVC : UINavigationController

@property(nonatomic, copy)  ReturnBlock backBlock;

@end

NS_ASSUME_NONNULL_END
