//
//  ArithmeticMagicCup_getDefaultCup.h
//  ArithmeticMagicCup
//
//  Created by zy on 2020/5/12.
//  Copyright © 2020 qingmai. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ArithmeticMagicCup_getDefaultCupNBlock)(NSString *string);

NS_ASSUME_NONNULL_BEGIN

@interface ArithmeticMagicCup_getDefaultCup : NSObject

- (instancetype)initGetMyCup:(ArithmeticMagicCup_getDefaultCupNBlock)myCupBlock;

- (void)getMyFisrtCup;

@end

NS_ASSUME_NONNULL_END
