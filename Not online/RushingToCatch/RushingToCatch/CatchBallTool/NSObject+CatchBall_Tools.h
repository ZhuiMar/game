//
//  NSObject+CatchBall_Tools.h
//  RushingToCatch
//
//  Created by zy on 2020/6/1.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CatchBall_Tools)

+ (void)CatchBallsaveScore:(NSInteger)score key:(NSString *)key;
+ (NSArray *)CatchBallgetRankingKey:(NSString *)key;
+ (NSMutableArray *)CatchBallandamArry:(NSArray *)arry;
+ (NSInteger)randomNumber:(NSInteger)from to:(NSInteger)to;
+ (NSMutableArray *)andamArry:(NSArray *)arry;
+ (UIColor *)CatchBallcolorWithHexString:(NSString*)stringToConvert;
+ (UIColor *)CatchBallcolorWithRGBHex:(UInt32)hex;
+ (void)CatchBallfontNames;

@end

NS_ASSUME_NONNULL_END
