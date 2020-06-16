//
//  ECGameOverUIViewController.h
//  EnvironmentCognize
//
//  Created by luzhaoyang on 2020/4/7.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^OverBlock)();

@interface ECGameOverUIViewController : UIViewController

- (instancetype)initWithScore:(NSInteger)score;

@property (nonatomic, copy) OverBlock homeBlock;
@property (nonatomic, copy) OverBlock againBlock;

@end

NS_ASSUME_NONNULL_END
