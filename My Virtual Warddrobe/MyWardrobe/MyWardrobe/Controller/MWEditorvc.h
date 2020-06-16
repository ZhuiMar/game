//
//  MWEditorvc.h
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/16.
//  Copyright © 2020 honghai. All rights reserved.
//

#import "MWBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MWEditorvcDelaagate <NSObject>

- (void)saveAction;
- (void)deleteAction;

@end

@interface MWEditorvc : MWBaseVC

- (instancetype)initWithData:(MWClothes *)model;

@property(nonatomic,weak) id<MWEditorvcDelaagate>delegate;

@end

NS_ASSUME_NONNULL_END
