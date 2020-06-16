//
//  BuoyMath_navigation.h
//  BuoyMathematics
//
//  Created by zy on 2020/4/26.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^BuoyMath_ReturnBlock)(void);

@interface BuoyMath_navigation : UINavigationController

@property(nonatomic, copy) BuoyMath_ReturnBlock backBlock;

@end

NS_ASSUME_NONNULL_END
