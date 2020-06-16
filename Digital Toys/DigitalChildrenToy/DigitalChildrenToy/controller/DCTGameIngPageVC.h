//
//  DCTGameIngPageVC.h
//  DigitalChildrenToy
//
//  Created by luzhaoyang on 2020/4/13.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DCTGameIngPageVC : UIViewController

- (instancetype)initWithLevel:(NSInteger)level isTip:(BOOL)isTip score:(NSInteger)score life:(NSInteger)life;

@end

NS_ASSUME_NONNULL_END
