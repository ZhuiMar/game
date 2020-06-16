//
//  TDSelectedVC.h
//  TruthOrDare
//
//  Created by  luzhaoyang on 2020/3/10.
//  Copyright © 2020 zhuimar. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TDSelectedVCDelegate <NSObject>

- (void)truthAction;
- (void)dareAction;

@end

@interface TDSelectedVC : UIViewController

@property (nonatomic, weak) id<TDSelectedVCDelegate>delegate;

@end

