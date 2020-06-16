//
//  DENavigation.h
//  DecryptionExperts
//
//  Created by luzhaoyang on 2020/4/14.
//  Copyright © 2020 weilingtou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^DEBackBlock)(void);

@interface DENavigation : UINavigationController

@property(nonatomic, copy) DEBackBlock backBlock;

@end

NS_ASSUME_NONNULL_END
