//
//  SecretOfRain_RecodCell.h
//  SecretOfRain
//
//  Created by zy on 2020/4/27.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecretOfRain_RecodCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (void)setModel:(NSArray *)arr;

@end

NS_ASSUME_NONNULL_END
