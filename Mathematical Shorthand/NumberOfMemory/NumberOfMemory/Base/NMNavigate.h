//
//  NMNavigate.h
//  NumberOfMemory
//
//  Created by  luzhaoyang on 2020/4/2.
//  Copyright © 2020 huadu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ReturnBlock)(void);

@interface NMNavigate : UINavigationController

@property(nonatomic, copy)  ReturnBlock backBlock;

@end

NS_ASSUME_NONNULL_END
