//
//  FMSelectVC.h
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/14.
//  Copyright © 2020 guanhua. All rights reserved.
//

#import "FMBaseVC.h"

typedef void (^SelectBlock)(NSString *);

@interface FMSelectVC : FMBaseVC

@property(nonatomic, copy) SelectBlock selectBlock;

- (instancetype)initWithTitle:(NSString *)title days:(NSMutableArray *)days classes:(NSMutableArray *)classes selectBlock:(SelectBlock)block;

@end

