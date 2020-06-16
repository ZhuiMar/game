//
//  MatheSpider_OverViewController.h
//  MathematicalSpider
//
//  Created by luzhaoyang on 2020/4/20.
//  Copyright © 2020 teresa. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^MatheSpiderOverBlock) ();

@interface MatheSpider_OverViewController : UIViewController

- (instancetype)initScore:(NSInteger)score home:(MatheSpiderOverBlock)home again:(MatheSpiderOverBlock)again;

@end

NS_ASSUME_NONNULL_END
