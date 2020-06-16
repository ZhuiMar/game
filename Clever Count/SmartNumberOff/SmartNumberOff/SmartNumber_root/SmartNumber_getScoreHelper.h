//
//  SmartNumber_getScoreHelper.h
//  SmartNumberOff
//
//  Created by zy on 2020/5/16.
//  Copyright © 2020 ximan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SmartNumberScoreHelperBlcok)(NSString *);

@interface SmartNumber_getScoreHelper : NSObject

- (instancetype)initWithStarScore:(NSInteger)score defoultCount:(NSString *)coloer setDefaultBlock:(SmartNumberScoreHelperBlcok)block;

- (void)getScoreNumber;

@end

NS_ASSUME_NONNULL_END
