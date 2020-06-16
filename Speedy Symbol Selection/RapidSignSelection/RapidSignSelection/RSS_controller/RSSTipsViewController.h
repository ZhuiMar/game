//
//  RSSTipsViewController.h
//  RapidSignSelection
//
//  Created by zy on 2020/6/5.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^RSSTipsViewBlock) ();

@interface RSSTipsViewController : UIViewController

- (instancetype)initWithOkAction:(RSSTipsViewBlock)okAction;

@end

NS_ASSUME_NONNULL_END
