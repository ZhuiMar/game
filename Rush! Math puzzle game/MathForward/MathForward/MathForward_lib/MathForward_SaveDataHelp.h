//
//  MathForward_SaveDataHelp.h
//  MathForward
//
//  Created by zy on 2020/5/14.
//  Copyright © 2020 teresa. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^MathForwardVBlock)(NSString *);

@interface MathForward_SaveDataHelp : NSObject

- (instancetype)initWithSavaBlock:(MathForwardVBlock)block;

- (void)saveScore;

@end

NS_ASSUME_NONNULL_END
