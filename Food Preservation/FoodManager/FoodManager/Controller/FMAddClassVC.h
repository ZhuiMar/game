//
//  FMAddClassVC.h
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/13.
//  Copyright © 2020年 guanhua. All rights reserved.
//

#import "FMBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@protocol FMAddClassVCDelegate <NSObject>

- (void)okActionWithName:(NSString *)name;

@end

@interface FMAddClassVC : FMBaseVC

@property(nonatomic,weak) id<FMAddClassVCDelegate>delegate;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UITextField *nameTf;

@end

NS_ASSUME_NONNULL_END
