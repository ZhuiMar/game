//
//  ECNavigateViewController.h
//  EnvironmentCognize
//
//  Created by luzhaoyang on 2020/4/7.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ReturnBlock)(void);

@interface ECNavigateViewController : UINavigationController

@property(nonatomic, copy) ReturnBlock backBlock;

- (void)setNavigationTittlesWith:(UIResponder *)dele;

@end


NS_ASSUME_NONNULL_END

