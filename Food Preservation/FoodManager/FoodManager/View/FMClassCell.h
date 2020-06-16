//
//  FMClassCell.h
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/13.
//  Copyright © 2020 guanhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMClassCell : UICollectionViewCell

@property(nonatomic,copy) NSString *title;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *imageName;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayout;

@end

