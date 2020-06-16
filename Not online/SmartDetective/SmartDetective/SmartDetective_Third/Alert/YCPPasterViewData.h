//
//  YCPPasterViewData.h
//  SmartDetective
//
//  Created by zy on 2020/5/23.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^YCPPasterViewDataBlock) (NSString *);

@interface YCPPasterViewData : NSObject

- (instancetype)initWithThemeColorBlock:(YCPPasterViewDataBlock)block;

- (void)getTheme;

- (void)setDefaultBackGround;

@end

NS_ASSUME_NONNULL_END
