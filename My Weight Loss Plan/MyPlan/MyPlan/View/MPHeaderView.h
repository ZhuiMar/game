//
//  MPHeaderView.h
//  MyPlan
//
//  Created by  luzhaoyang on 2020/3/28.
//  Copyright © 2020 yunxi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MPHeaderViewDelegate <NSObject>

- (void)chooseCount:(NSInteger)count;
- (void)jianAction:(NSInteger)count;

@end


@interface MPHeaderView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *iconType;
@property (weak, nonatomic) IBOutlet UILabel *iconNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *jianChuBtn;

@property (weak, nonatomic) IBOutlet UIView *choseBg;
@property (weak, nonatomic) IBOutlet UIButton *choosedBtn;
@property (weak, nonatomic) IBOutlet UILabel *chooseCountLabel;

@property (weak, nonatomic) IBOutlet UIView *textfiledBg;
@property (weak, nonatomic) IBOutlet UITextField *textFile;
@property (weak, nonatomic) IBOutlet UILabel *textStrLenght;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textBgW;

@property (nonatomic, assign) NSInteger type;
@property (nonatomic, weak) id<MPHeaderViewDelegate>delegate;

+ (instancetype)getHeaderViewType:(NSInteger)type;

@end

NS_ASSUME_NONNULL_END
