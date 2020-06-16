//
//  NSDate+date.h
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/15.
//  Copyright © 2020 guanhua. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (date)

+ (NSString*)getTaday;
+ (NSString *)beforeDate:(NSInteger)n;
+ (NSInteger)getDifferenceByDate:(NSString *)date;

@end

NS_ASSUME_NONNULL_END
