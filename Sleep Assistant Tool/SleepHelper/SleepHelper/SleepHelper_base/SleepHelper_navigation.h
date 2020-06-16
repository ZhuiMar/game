//
//  SleepHelper_navigation.h
//  SleepHelper
//
//  Created by zy on 2020/5/18.
//  Copyright © 2020 tianma. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^SleepHelper_ReturnBlock)(void);

@interface SleepHelper_navigation : UINavigationController

@property(nonatomic, copy) SleepHelper_ReturnBlock returnBlock;

@end

NS_ASSUME_NONNULL_END
