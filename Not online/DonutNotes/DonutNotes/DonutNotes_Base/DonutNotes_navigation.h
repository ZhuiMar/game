//
//  DonutNotes_navigation.h
//  DonutNotes
//
//  Created by luzhaoyang on 2020/4/18.
//  Copyright © 2020 willows. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ReturnBlock)(void);

@interface DonutNotes_navigation : UINavigationController

@property(nonatomic, copy) ReturnBlock backBlock;

@end

NS_ASSUME_NONNULL_END
