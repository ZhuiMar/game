//
//  MysteryBoard_OverVC.h
//  MysteryBoard
//
//  Created by zy on 2020/4/23.
//  Copyright © 2020 wansheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^MysteryBoard_OverBlock) (void);

@interface MysteryBoard_OverVC : UIViewController

- (instancetype)initWithScore:(NSInteger)score totalCount:(NSInteger)total home:(MysteryBoard_OverBlock)home again:(MysteryBoard_OverBlock)again;

@end

NS_ASSUME_NONNULL_END
