//
//  SleepHelper_TabbarView.h
//  SleepHelper
//
//  Created by zy on 2020/5/18.
//  Copyright © 2020 tianma. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SleepHelper_TabbarView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *iconsOne;
@property (weak, nonatomic) IBOutlet UIImageView *iconsTwo;
@property (weak, nonatomic) IBOutlet UIImageView *iconsThree;

@property (weak, nonatomic) IBOutlet UILabel *gameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sleepLabel;
@property (weak, nonatomic) IBOutlet UILabel *settingLabel;

+ (instancetype)getTabarView;

@end

NS_ASSUME_NONNULL_END
