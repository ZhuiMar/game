//
//  CPScoreManagee.h
//  ComparePlanes
//
//  Created by zy on 2020/5/7.
//  Copyright © 2020 qingxiriver. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CPScoreManagee : NSObject

@property(nonatomic,strong) NSMutableDictionary *dict;

+ (instancetype)shareManager;

@end

NS_ASSUME_NONNULL_END
