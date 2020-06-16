//
//  SmartDetective_navigation.h
//  SmartDetective
//
//  Created by zy on 2020/5/13.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^SmartDetective_ReturnBlock)(void);

@interface SmartDetective_navigation : UINavigationController

@property(nonatomic, copy) SmartDetective_ReturnBlock returnBlock;

@end

NS_ASSUME_NONNULL_END
