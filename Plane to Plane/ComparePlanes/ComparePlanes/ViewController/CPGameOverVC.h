//
//  CPGameOverVC.h
//  ComparePlanes
//
//  Created by luzhaoyang on 2020/4/16.
//  Copyright © 2020 qingxiriver. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CPOverBlock) (void);

@interface CPGameOverVC : UIViewController

- (instancetype)initWithScore:(NSInteger)score type:(NSInteger)type home:(CPOverBlock)home again:(CPOverBlock)again;

@end

NS_ASSUME_NONNULL_END
