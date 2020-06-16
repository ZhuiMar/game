//
//  MPNavigateVC.h
//  MyPlan
//
//  Created by  luzhaoyang on 2020/3/20.
//  Copyright © 2020 yunxi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ReturnBlock)(void);

@interface MPNavigateVC : UINavigationController

@property(nonatomic, copy)  ReturnBlock backBlock;

@end

NS_ASSUME_NONNULL_END
