//
//  LLNavigateVC.h
//  LanguageLearn
//
//  Created by  luzhaoyang on 2020/3/19.
//  Copyright © 2020年 haike. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ReturnBlock)(void);

@interface LLNavigateVC : UINavigationController

@property(nonatomic, copy)  ReturnBlock backBlock;

@end

NS_ASSUME_NONNULL_END
