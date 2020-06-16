//
//  YTVolumeSliderView.h
//  ytSliderView
//
//  Created by yitezh on 2019/10/18.
//  Copyright © 2019 yitezh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTSliderSetting.h"

@class YTSliderView;
NS_ASSUME_NONNULL_BEGIN

@protocol YTSliderViewDelegate <NSObject>

@optional

- (void)ytSliderView:(YTSliderView *)view didChangePercent:(CGFloat)percent;
- (void)ytSliderViewDidBeginDrag:(YTSliderView *)view;
- (void)ytSliderViewDidEndDrag:(YTSliderView *)view;
- (void)ytSliderViewSlidering:(YTSliderView *)view value:(CGFloat)value;

@end

@interface YTSliderView : UIView

- (instancetype)initWithFrame:(CGRect)frame setting:(YTSliderSetting *)setting;

@property (assign, nonatomic) CGFloat anchorPercent;
@property (assign, nonatomic) CGFloat currentPercent;
@property (assign, nonatomic) NSInteger sumValue;
@property (strong, nonatomic) YTSliderSetting *setting;
@property (weak, nonatomic) id<YTSliderViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
