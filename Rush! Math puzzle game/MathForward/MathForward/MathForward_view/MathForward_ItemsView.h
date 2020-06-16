//
//  MathForward_ItemsView.h
//  MathForward
//
//  Created by luzhaoyang on 2020/4/21.
//  Copyright © 2020 teresa. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MathForward_ItemsView : UIView

@property(nonatomic,assign) CGRect originFrame;
@property(nonatomic,assign) NSInteger rightVaule;

@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
@property (weak, nonatomic) IBOutlet UIButton *titleBtn;

+ (instancetype)getItem;

- (void)setTitle;

@end

NS_ASSUME_NONNULL_END
