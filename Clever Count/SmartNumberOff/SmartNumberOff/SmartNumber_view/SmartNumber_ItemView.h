//
//  SmartNumber_ItemView.h
//  SmartNumberOff
//
//  Created by zy on 2020/5/6.
//  Copyright © 2020 ximan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SmartNumber_ItemView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *arrow;
@property (weak, nonatomic) IBOutlet UIImageView *peppleImageView;
@property (weak, nonatomic) IBOutlet UIButton *number;

+ (instancetype)getSmartView;

@end

NS_ASSUME_NONNULL_END
