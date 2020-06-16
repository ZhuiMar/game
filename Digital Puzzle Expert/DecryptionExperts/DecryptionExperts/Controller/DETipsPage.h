//
//  DETipsPage.h
//  DecryptionExperts
//
//  Created by luzhaoyang on 2020/4/14.
//  Copyright © 2020 weilingtou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^IKnowBlock)(void);

@interface DETipsPage : UIViewController

- (instancetype)initWithIKnow:(IKnowBlock)ikonwBlock;

@property(nonatomic, copy)IKnowBlock know;

@end

NS_ASSUME_NONNULL_END
