//
//  NSArray+arrays.h
//  RapidSignSelection
//
//  Created by zy on 2020/6/4.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (arrays)

+ (NSMutableArray *)RSSgetNewArrWithOldArr:(NSMutableArray *)old count:(NSInteger)count;
+ (void)RSSsaveScore:(NSInteger)score key:(NSString *)key;
+ (NSArray *)RSSgetRankingKey:(NSString *)key;
+ (NSMutableArray *)RSSandamArry:(NSArray *)arry;

@end

NS_ASSUME_NONNULL_END
