//
//  BuoyMath_TipPageVC.h
//  BuoyMathematics
//
//  Created by zy on 2020/4/26.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^BuoyMath_Ok) (void);

@interface BuoyMath_TipPageVC : UIViewController

- (instancetype)initWithType:(NSInteger)type ok:(BuoyMath_Ok)ok;

@end

NS_ASSUME_NONNULL_END
