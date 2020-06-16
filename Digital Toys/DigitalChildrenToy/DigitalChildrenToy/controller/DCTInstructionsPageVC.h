//
//  DCTInstructionsPageVC.h
//  DigitalChildrenToy
//
//  Created by luzhaoyang on 2020/4/13.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef void(^OkBlock) (void);

@interface DCTInstructionsPageVC : UIViewController

- (instancetype)initWithOKAction:(OkBlock)okBlock;

@end

NS_ASSUME_NONNULL_END
