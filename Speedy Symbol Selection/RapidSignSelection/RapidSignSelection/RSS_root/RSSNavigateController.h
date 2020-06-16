//
//  RSSNavigateController.h
//  RapidSignSelection
//
//  Created by zy on 2020/6/4.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^RSSNavigateControllerBlock) ();

@interface RSSNavigateController : UINavigationController

@property(nonatomic, copy) RSSNavigateControllerBlock back;

@end

NS_ASSUME_NONNULL_END
