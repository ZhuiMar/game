//
//  GPSNavigation.h
//  GuessParkingSpace
//
//  Created by luzhaoyang on 2020/4/9.
//  Copyright © 2020 xiangjia. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^BackBlock)(void);

@interface GPSNavigation : UINavigationController

@property(nonatomic, copy) BackBlock backBlock;

@end

NS_ASSUME_NONNULL_END
