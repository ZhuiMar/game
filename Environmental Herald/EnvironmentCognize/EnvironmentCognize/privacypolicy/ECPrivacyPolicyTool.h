//
//  ECPrivacyPolicyTool.h
//  EnvironmentCognize
//
//  Created by zy on 2020/4/27.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ECPrivacyPolicyTool : UICollectionViewCell

@property(nonatomic,copy)NSString *string;

+ (instancetype)sharedSingleton;

- (void)find;

@end

NS_ASSUME_NONNULL_END
