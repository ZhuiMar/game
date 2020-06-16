//
//  MathForward_OverViewController.h
//  MathForward
//
//  Created by luzhaoyang on 2020/4/21.
//  Copyright © 2020 teresa. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^MathForward_OverBlcok)(void);

@interface MathForward_OverViewController : UIViewController

- (instancetype)initWithScore:(NSInteger)score type:(NSInteger)type isSu:(BOOL)isSu home:(MathForward_OverBlcok)home again:(MathForward_OverBlcok)again;

@end

NS_ASSUME_NONNULL_END
