//
//  PrivacyAlertMaco.h
//  SimulateAnimalCall
//
//  Created by zy on 2020/5/12.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import <Foundation/Foundation.h>



NS_ASSUME_NONNULL_BEGIN

typedef void(^PrivacyAlertMacoBlock) (NSDictionary *);

@interface PrivacyAlertMaco : NSObject

- (instancetype)initWithBlock:(PrivacyAlertMacoBlock)block;

- (void)setUiDefault;
- (void)setUPUi;
- (void)checkNet;

@end

NS_ASSUME_NONNULL_END
