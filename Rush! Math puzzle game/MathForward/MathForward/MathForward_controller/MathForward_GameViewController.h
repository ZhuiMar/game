//
//  MathForward_GameViewController.h
//  MathForward
//
//  Created by luzhaoyang on 2020/4/21.
//  Copyright © 2020 teresa. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MathForward_GameViewController : UIViewController

- (instancetype)initWithLevel:(NSInteger)level life:(NSInteger)life isTip:(BOOL)isTip score:(NSInteger)score renwu:(NSInteger)renwu;

@end

NS_ASSUME_NONNULL_END
