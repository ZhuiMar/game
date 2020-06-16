

#import <Foundation/Foundation.h>

@interface NSString (record)

+ (void)saveScore:(NSInteger)score key:(NSString *)key;
+ (NSArray *)getRankingKey:(NSString *)key;

@end

