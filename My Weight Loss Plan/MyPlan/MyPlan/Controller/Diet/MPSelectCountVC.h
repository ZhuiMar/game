//
//  MPSelectCountVC.h
//  MyPlan
//
//  Created by  luzhaoyang on 2020/3/29.
//  Copyright © 2020 yunxi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SelectBlock)(NSString *);

NS_ASSUME_NONNULL_BEGIN

@interface MPSelectCountVC : UIViewController

@property(nonatomic, copy) SelectBlock selectBlock;

- (instancetype)initWithTitle:(NSString *)title days:(NSMutableArray *)days classes:(NSMutableArray *)classes selectBlock:(SelectBlock)block;

@end

NS_ASSUME_NONNULL_END
