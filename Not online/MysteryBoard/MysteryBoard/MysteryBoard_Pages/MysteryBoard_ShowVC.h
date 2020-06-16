//
//  MysteryBoard_ShowVC.h
//  MysteryBoard
//
//  Created by luzhaoyang on 2020/4/22.
//  Copyright © 2020 wansheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MysteryBoard_ShowVC : UIViewController

@property(nonatomic, copy)NSString *title;

- (instancetype)initWithTittle:(NSString *)tittle;

@end

NS_ASSUME_NONNULL_END
