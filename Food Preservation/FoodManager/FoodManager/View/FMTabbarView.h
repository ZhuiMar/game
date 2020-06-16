//
//  FMTabbarView.h
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/13.
//  Copyright © 2020 guanhua. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FMTabbarView : UIView

@property (weak, nonatomic) IBOutlet UIButton *homeBtn;
@property (weak, nonatomic) IBOutlet UIButton *classBtn;
@property (weak, nonatomic) IBOutlet UIButton *aboutBtn;

+ (instancetype)getFMTabbarView;

@end

NS_ASSUME_NONNULL_END
