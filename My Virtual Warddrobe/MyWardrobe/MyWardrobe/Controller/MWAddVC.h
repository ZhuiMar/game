//
//  MWAddVC.h
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/16.
//  Copyright © 2020 honghai. All rights reserved.
//

#import "MWBaseVC.h"

NS_ASSUME_NONNULL_BEGIN


typedef void (^SaveSucsseBlock)();


@interface MWAddVC : MWBaseVC

@property(nonatomic,copy) SaveSucsseBlock saveBlock;

- (instancetype)initWithType:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
