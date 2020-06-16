//
//  FMFooter.h
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/13.
//  Copyright © 2020年 guanhua. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol FMFooterDelegate <NSObject>

- (void)addFood;

@end

@interface FMFooter : UICollectionReusableView
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *with;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height;

@property(nonatomic,weak) id<FMFooterDelegate>delegate;

@end

