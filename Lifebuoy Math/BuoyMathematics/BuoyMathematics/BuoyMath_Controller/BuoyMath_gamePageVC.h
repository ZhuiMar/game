//
//  BuoyMath_gamePageVC.h
//  BuoyMathematics
//
//  Created by zy on 2020/4/26.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BuoyMath_gamePageVC : UIViewController

- (instancetype)initWithScore:(NSUInteger)score level:(NSInteger)level life:(NSInteger)life tip:(BOOL)tip;

@end

NS_ASSUME_NONNULL_END
