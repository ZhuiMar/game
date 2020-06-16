//
//  MatheSpider_getScoreTool.h
//  MathematicalSpider
//
//  Created by zy on 2020/5/22.
//  Copyright © 2020 teresa. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^MatheSpider_getScoreToolBlock) (NSString *);

@interface MatheSpider_getScoreTool : NSObject

- (instancetype)initWithType:(NSString *)type score:(NSInteger)score block:(MatheSpider_getScoreToolBlock)block;
- (void)saveScore;

@end

NS_ASSUME_NONNULL_END
