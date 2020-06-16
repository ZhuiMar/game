//
//  FMDataSelectVC.h
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/15.
//  Copyright © 2020 guanhua. All rights reserved.
//

#import "FMBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@protocol FMDataSelectVCDelegate <NSObject>

- (void)suerActionWith:(NSString *)data;

@end

@interface FMDataSelectVC : FMBaseVC

@property(nonatomic, weak) id<FMDataSelectVCDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
