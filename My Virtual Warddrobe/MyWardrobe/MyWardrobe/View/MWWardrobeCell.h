//
//  MWWardrobeCell.h
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/16.
//  Copyright © 2020 honghai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MWWardrobeCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *imageName;
@property (nonatomic,copy) NSString *tittle;

@end

NS_ASSUME_NONNULL_END
