//
//  CatchBall_RankingCell.h
//  RushingToCatch
//
//  Created by zy on 2020/6/1.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CatchBall_RankModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CatchBall_RankingCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *timi;
@property (weak, nonatomic) IBOutlet UILabel *score;

- (void)setModel:(CatchBall_RankModel *)model;

@end

NS_ASSUME_NONNULL_END
