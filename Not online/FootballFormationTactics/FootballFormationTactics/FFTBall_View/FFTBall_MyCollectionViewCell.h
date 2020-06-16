//
//  FFTBall_MyCollectionViewCell.h
//  FootballFormationTactics
//
//  Created by zy on 2020/5/27.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFTBall_PlanModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FFTBall_MyCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong)FFTBall_PlanModel *data;

- (void)setModel:(FFTBall_PlanModel *)model;

@end

NS_ASSUME_NONNULL_END
