//
//  CPNavigation.h
//  ComparePlanes
//
//  Created by luzhaoyang on 2020/4/15.
//  Copyright © 2020 qingxiriver. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^CRReturnBlock)(void);

@interface CPNavigation : UINavigationController

@property(nonatomic, copy) CRReturnBlock backBlock;

@end

NS_ASSUME_NONNULL_END
