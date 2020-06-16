//
//  FMAddDetials.h
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/14.
//  Copyright © 2020 guanhua. All rights reserved.
//

#import "FMBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@protocol FMAddDetialsDelegate <NSObject>

- (void)okAction;

@end

@interface FMAddDetials : FMBaseVC

- (instancetype)initWithType:(NSString *)type;

@property(nonatomic, weak) id<FMAddDetialsDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
