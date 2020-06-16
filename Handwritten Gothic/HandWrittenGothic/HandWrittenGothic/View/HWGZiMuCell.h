//
//  HWGZiMuCell.h
//  HandWrittenGothic
//
//  Created by  luzhaoyang on 2020/3/18.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HWGZiMuCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@property (nonatomic,copy) NSString *string;

@end

NS_ASSUME_NONNULL_END
