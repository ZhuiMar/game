//
//  CHBOverVC.h
//  ColorHotBalloon
//
//  Created by  luzhaoyang on 2020/3/9.
//  Copyright © 2020 zhuimar. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CHBOverVCDelegate <NSObject>

- (void)homeOverVCAction;
- (void)agianOverVCAction;

@end


@interface CHBOverVC : UIViewController


@property(nonatomic,weak) id<CHBOverVCDelegate>delegate;

- (instancetype)initWithSocre:(NSInteger)num;

@end

