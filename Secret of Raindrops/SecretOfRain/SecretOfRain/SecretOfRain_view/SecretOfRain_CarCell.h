//
//  SecretOfRain_CarCell.h
//  SecretOfRain
//
//  Created by zy on 2020/4/27.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecretOfRain_CarCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIButton *scoreBtn;
@property (weak, nonatomic) IBOutlet UILabel *question;

@property (nonatomic,assign) NSInteger number;


@end

NS_ASSUME_NONNULL_END
