//
//  MWUserHeader.h
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/16.
//  Copyright © 2020年 honghai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MWUserHeaderDelegate <NSObject>

- (void)clickBtnuUp:(BOOL)isUp;

@end

@interface MWUserHeader : UIView

@property(nonatomic,weak) id<MWUserHeaderDelegate>delegate;

@property (weak, nonatomic) IBOutlet UIButton *arrowBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property(nonatomic,assign) BOOL isUp;

+ (instancetype)getHeaderView;

@end

NS_ASSUME_NONNULL_END
