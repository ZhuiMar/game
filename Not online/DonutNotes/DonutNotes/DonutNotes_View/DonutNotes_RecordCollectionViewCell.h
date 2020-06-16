//
//  DonutNotes_RecordCollectionViewCell.h
//  DonutNotes
//
//  Created by luzhaoyang on 2020/4/19.
//  Copyright © 2020 willows. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DonutNotes_RecordCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *cuont;

@end

NS_ASSUME_NONNULL_END
