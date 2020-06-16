//
//  SleepHelperSleepCell.h
//  SleepHelper
//
//  Created by zy on 2020/5/19.
//  Copyright © 2020 tianma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SleepHelper_TimeModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SleepHelperSleepCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *datelabel;
@property (weak, nonatomic) IBOutlet UILabel *countingLabel;
@property (weak, nonatomic) IBOutlet UILabel *pokeLabel;
@property (weak, nonatomic) IBOutlet UILabel *fallinglabel;
@property (weak, nonatomic) IBOutlet UILabel *sleeping;

@property (weak, nonatomic) IBOutlet UILabel *countingV;
@property (weak, nonatomic) IBOutlet UILabel *pokeV;
@property (weak, nonatomic) IBOutlet UILabel *fallingV;
@property (weak, nonatomic) IBOutlet UILabel *sleepV;

- (void)setModel:(SleepHelper_TimeModel *)model;

@end

NS_ASSUME_NONNULL_END
