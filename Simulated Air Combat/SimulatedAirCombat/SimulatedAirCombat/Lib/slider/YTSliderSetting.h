//
//  YTSliderSetting.h
//  YTSliderView
//
//  Created by yitezh on 2019/10/19.
//  Copyright © 2019 yitezh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, YTSliderLayoutDirection) {
   YTSliderLayoutDirectionHorizontal  = 0,
   YTSliderLayoutDirectionVertical,
};


@interface YTSliderSetting : NSObject

+ (instancetype)defaultSetting ;
+ (instancetype)verticalSetting;
@property (assign, nonatomic)int  progressInset;
@property (assign, nonatomic)BOOL shouldShowProgress;
@property (assign, nonatomic)YTSliderLayoutDirection  layoutDirection;
@property (strong, nonatomic) UIColor *backgroundColor;
@property (strong, nonatomic) UIColor *progressColor;
@property (strong, nonatomic) UIColor *thumbColor;
@property (strong, nonatomic) UIColor *thumbBorderColor;
@property (assign, nonatomic)CGFloat borderWidth;

@end

NS_ASSUME_NONNULL_END
