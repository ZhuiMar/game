//
//  RSSOverViewController.h
//  RapidSignSelection
//
//  Created by zy on 2020/6/5.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^RSSOverViewBlock) ();

@interface RSSOverViewController : UIViewController

- (instancetype)initWithScoreNumber:(NSInteger)score homeBlock:(RSSOverViewBlock)homeBlock againBlock:(RSSOverViewBlock)againBlock; 

@end

NS_ASSUME_NONNULL_END
