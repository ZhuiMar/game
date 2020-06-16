//
//  DCTGameOverPageVC.h
//  DigitalChildrenToy
//
//  Created by luzhaoyang on 2020/4/13.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^GameOverBlock) (void);

@interface DCTGameOverPageVC : UIViewController

@property(nonatomic, copy) GameOverBlock homeBlock;
@property(nonatomic, copy) GameOverBlock againBlock;

- (instancetype)initWithScore:(NSInteger)score
                         home:(GameOverBlock)home
                        again:(GameOverBlock)again;

@end

NS_ASSUME_NONNULL_END
