//
//  TDNavigateVC.h
//  TruthOrDare
//
//  Created by  luzhaoyang on 2020/3/10.
//  Copyright © 2020 zhuimar. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BackBlock)(void);

@interface TDNavigateVC : UINavigationController

@property(nonatomic, copy)  BackBlock backBlock;

@end

