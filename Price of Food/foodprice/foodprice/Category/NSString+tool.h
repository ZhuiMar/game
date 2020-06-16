//
//  NSString+tool.h
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/27.
//  Copyright © 2020 honghai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (tool)

+ (NSString *)randomStringWithLength:(NSInteger)len;
+ (NSString *)firstCharacterAcapital:(NSString *)string;

+ (void)saveStringWithFileName:(NSString *)fileName strContent:(NSString *)content;
+ (NSString *)getStringWithFileName:(NSString *)fileName;
+ (NSInteger)getRandomNumber:(NSInteger)from to:(NSInteger)to;


@end

NS_ASSUME_NONNULL_END
