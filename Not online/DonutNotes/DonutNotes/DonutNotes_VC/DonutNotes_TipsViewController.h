//
//  DonutNotes_TipsViewController.h
//  DonutNotes
//
//  Created by luzhaoyang on 2020/4/18.
//  Copyright © 2020 willows. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^OkBlock)(void);

@interface DonutNotes_TipsViewController : UIViewController

- (instancetype)initWithOkAction:(OkBlock)okAction;

@end

NS_ASSUME_NONNULL_END
