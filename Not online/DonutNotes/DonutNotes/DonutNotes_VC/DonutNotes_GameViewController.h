//
//  DonutNotes_GameViewController.h
//  DonutNotes
//
//  Created by luzhaoyang on 2020/4/18.
//  Copyright © 2020 willows. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DonutNotes_GameViewController : UIViewController

- (instancetype)initWithLevel:(NSInteger)level score:(NSInteger)score showTip:(BOOL)showTip;

@end

NS_ASSUME_NONNULL_END
