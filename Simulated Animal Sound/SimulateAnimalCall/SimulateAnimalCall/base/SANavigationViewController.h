//
//  SANavigationViewController.h
//  SimulateAnimalCall
//
//  Created by luzhaoyang on 2020/4/8.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ReturnBlock)(void);

@interface SANavigationViewController : UINavigationController

@property(nonatomic, copy) ReturnBlock backBlock;

@end

NS_ASSUME_NONNULL_END
