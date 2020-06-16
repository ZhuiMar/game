//
//  SmartDetective_ReadyViewController.h
//  SmartDetective
//
//  Created by zy on 2020/5/13.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef  void(^SmartDetective_ReadyGoBlock)(NSMutableArray *);

@interface SmartDetective_ReadyViewController : UIViewController

- (instancetype)initWithLevel:(NSInteger)level rightAnswer:(SmartDetective_ReadyGoBlock)items;

@end

NS_ASSUME_NONNULL_END
