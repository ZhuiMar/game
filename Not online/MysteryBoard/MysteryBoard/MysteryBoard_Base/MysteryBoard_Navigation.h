//
//  MysteryBoard_Navigation.h
//  MysteryBoard
//
//  Created by luzhaoyang on 2020/4/22.
//  Copyright © 2020 wansheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^MysteryBoard_ReturnBlock)(void);

@interface MysteryBoard_Navigation : UINavigationController


@property(nonatomic, copy) MysteryBoard_ReturnBlock backBlock;

@end

NS_ASSUME_NONNULL_END
