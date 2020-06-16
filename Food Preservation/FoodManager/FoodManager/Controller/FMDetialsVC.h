//
//  FMDetialsVC.h
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/14.
//  Copyright © 2020 guanhua. All rights reserved.
//

#import "FMBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface FMDetialsVC : FMBaseVC

@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *data;
@property(nonatomic, copy) NSString *shelf;
@property(nonatomic, copy) NSString *time;
@property(nonatomic, copy) NSString *note;

@end

NS_ASSUME_NONNULL_END
