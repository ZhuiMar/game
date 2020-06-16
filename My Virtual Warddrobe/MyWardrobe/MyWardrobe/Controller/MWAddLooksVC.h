//
//  MWAddLooksVC.h
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/16.
//  Copyright © 2020 honghai. All rights reserved.
//

#import "MWBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MWAddLooksVCDelegate <NSObject>

- (void)saveReloadData;

@end

@interface MWAddLooksVC : MWBaseVC

@property(nonatomic,weak) id<MWAddLooksVCDelegate>delegate;

- (instancetype)initWithType:(NSString *)type;

@end

NS_ASSUME_NONNULL_END
