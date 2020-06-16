//
//  DEOverPage.h
//  DecryptionExperts
//
//  Created by luzhaoyang on 2020/4/14.
//  Copyright © 2020 weilingtou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^DEOverBlock)(void);

@interface DEOverPage : UIViewController

- (instancetype)initWithScore:(NSInteger)score home:(DEOverBlock)home again:(DEOverBlock)again;



@end

NS_ASSUME_NONNULL_END
