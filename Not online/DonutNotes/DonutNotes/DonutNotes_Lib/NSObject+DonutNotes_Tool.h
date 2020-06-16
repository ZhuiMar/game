//
//  NSObject+DonutNotes_Tool.h
//  DonutNotes
//
//  Created by luzhaoyang on 2020/4/18.
//  Copyright © 2020 willows. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DonutNotes_Tool)

+ (UIColor *)DonutNotes_colorWithHexString:(NSString*)stringToConvert;
+ (NSInteger)DonutNotes_getRandomNumber:(NSInteger)from to:(NSInteger)to;
+ (NSMutableArray *)DonutNotes_randamArry:(NSArray *)arry;
+ (NSMutableArray *)DonutNotes_getNewArrWithOldArr:(NSMutableArray *)old count:(NSInteger)count;

@end

NS_ASSUME_NONNULL_END
