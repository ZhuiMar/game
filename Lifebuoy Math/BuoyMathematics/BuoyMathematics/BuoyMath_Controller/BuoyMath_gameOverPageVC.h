//
//  BuoyMath_gameOverPageVC.h
//  BuoyMathematics
//
//  Created by zy on 2020/4/26.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^BuoyMath_Over) (void);

@interface BuoyMath_gameOverPageVC : UIViewController

- (instancetype)initWithScore:(NSInteger)score home:(BuoyMath_Over)home again:(BuoyMath_Over)again;

@end

NS_ASSUME_NONNULL_END
