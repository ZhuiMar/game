//
//  DCTNavigation.h
//  DigitalChildrenToy
//
//  Created by luzhaoyang on 2020/4/13.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^BackBlock)(void);

@interface DCTNavigation : UINavigationController

@property(nonatomic, copy) BackBlock backBlock;

@end


NS_ASSUME_NONNULL_END
