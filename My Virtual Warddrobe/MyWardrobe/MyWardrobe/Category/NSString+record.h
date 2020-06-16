//
//  NSString+record.h
//  ColorHotBalloon
//
//  Created by  luzhaoyang on 2020/3/9.
//  Copyright © 2020 zhuimar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (record)

+ (void)saveScore:(NSInteger)score key:(NSString *)key;
+ (NSArray *)getRankingKey:(NSString *)key;




@end

