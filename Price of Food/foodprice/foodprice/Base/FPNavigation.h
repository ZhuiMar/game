//
//  FPNavigation.h
//  foodprice
//
//  Created by  luzhaoyang on 2020/4/1.
//  Copyright © 2020 lijingshuxiang.foodprice. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ReturnBlock)(void);

@interface FPNavigation : UINavigationController

@property(nonatomic, copy) ReturnBlock backBlock;

@end

NS_ASSUME_NONNULL_END
