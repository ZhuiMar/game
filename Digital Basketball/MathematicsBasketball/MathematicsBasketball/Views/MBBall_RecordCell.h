//
//  MBBall_RecordCell.h
//  MathematicsBasketball
//
//  Created by zy on 2020/5/26.
//  Copyright © 2020 zhongba. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MBBall_RecordCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *oneK;
@property (weak, nonatomic) IBOutlet UILabel *twoK;
@property (weak, nonatomic) IBOutlet UILabel *threeK;

@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *one;
@property (weak, nonatomic) IBOutlet UILabel *two;
@property (weak, nonatomic) IBOutlet UILabel *three;

- (void)setArr:(NSArray *)arr;

@end

NS_ASSUME_NONNULL_END
