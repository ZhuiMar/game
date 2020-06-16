//
//  SecretOfRain_countView.h
//  SecretOfRain
//
//  Created by zy on 2020/4/28.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecretOfRain_countView : UIView

@property (weak, nonatomic) IBOutlet UILabel *countLabel;

+ (instancetype)getSecretOfRain_countView;
- (void)setTittleCount:(NSInteger)count;

@end

NS_ASSUME_NONNULL_END
