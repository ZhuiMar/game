//
//  MatheSpider_TipsViewController.h
//  MathematicalSpider
//
//  Created by luzhaoyang on 2020/4/20.
//  Copyright © 2020 teresa. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^OkBlock)(void);

@interface MatheSpider_TipsViewController : UIViewController

- (instancetype)initOkBlock:(OkBlock)ok;



@end

NS_ASSUME_NONNULL_END
