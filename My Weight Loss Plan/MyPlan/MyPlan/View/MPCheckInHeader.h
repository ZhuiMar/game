//
//  MPCheckInHeader.h
//  MyPlan
//
//  Created by  luzhaoyang on 2020/3/29.
//  Copyright © 2020 yunxi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MPCheckInHeaderDelegate <NSObject>

- (void)checkInActionType:(NSInteger)type;

@end

@interface MPCheckInHeader : UIView

@property (weak, nonatomic) IBOutlet UIButton *checkinBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *imageName;

@property (nonatomic, assign) NSInteger type;

+ (instancetype)getCheckInHeaderViewType:(NSInteger)type;

@property(nonatomic,weak) id<MPCheckInHeaderDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
