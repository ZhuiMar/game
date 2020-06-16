//
//  SmartNumber_navigation.h
//  SmartNumberOff
//
//  Created by zy on 2020/4/29.
//  Copyright © 2020 ximan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^SmartNumber_BackBlock)(void);

@interface SmartNumber_navigation : UINavigationController

@property(nonatomic, copy) SmartNumber_BackBlock returnBlock;

@end

NS_ASSUME_NONNULL_END
