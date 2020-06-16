//
//  SmartDetective_GameOverViewController.h
//  SmartDetective
//
//  Created by zy on 2020/5/13.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SmartDetective_Block) ();

@interface SmartDetective_GameOverViewController : UIViewController

- (instancetype)initWithScore:(NSInteger)score level:(NSInteger)level homeBlock:(SmartDetective_Block)homeBlock againBlock:(SmartDetective_Block)againBlock;

@end

NS_ASSUME_NONNULL_END
