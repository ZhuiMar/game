//
//  MysteryBoard_PlayItem.h
//  MysteryBoard
//
//  Created by luzhaoyang on 2020/4/22.
//  Copyright © 2020 wansheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MysteryBoard_PlayItem : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UILabel *namelabel;


- (void)setData:(NSString *)string type:(NSInteger)type;

@end

NS_ASSUME_NONNULL_END
