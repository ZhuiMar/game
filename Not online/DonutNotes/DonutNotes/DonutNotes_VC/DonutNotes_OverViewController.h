//
//  DonutNotes_OverViewController.h
//  DonutNotes
//
//  Created by luzhaoyang on 2020/4/18.
//  Copyright © 2020 willows. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^DNOverBlock) (void);

@interface DonutNotes_OverViewController : UIViewController

- (instancetype)initWithScore:(NSInteger)score home:(DNOverBlock)home again:(DNOverBlock)again;

@end

NS_ASSUME_NONNULL_END
