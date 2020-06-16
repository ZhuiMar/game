//
//  NMGameOverViewController.h
//  NumberOfMemory
//
//  Created by  luzhaoyang on 2020/4/2.
//  Copyright © 2020 huadu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^OverBlock)();

@interface NMGameOverViewController : UIViewController

@property (nonatomic, copy)  OverBlock homeBlock;
@property (nonatomic, copy)  OverBlock agianBlock;

- (instancetype)initWithType:(NSInteger)type;

@end

NS_ASSUME_NONNULL_END
