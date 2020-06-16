//
//  NSArray+MBBall_rank.h
//  MathematicsBasketball
//
//  Created by zy on 2020/5/26.
//  Copyright © 2020 zhongba. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (MBBall_rank)

+ (void)FFTBall_saveScore:(NSInteger)score key:(NSString *)key;
+ (NSArray *)FFTBall_getRankingKey:(NSString *)key;
+ (NSMutableArray *)FFTBall_andamArry:(NSArray *)arry;

@end

NS_ASSUME_NONNULL_END
