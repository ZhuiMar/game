//
//  SAYingSiManager.h
//  SimulateAnimalCall
//
//  Created by zy on 2020/5/8.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SAYingSiManager : NSObject

@property(nonatomic,strong)SAAnStarData *model;

+ (instancetype)shareManager;

- (void)getPrivacyPolicy;


@end

NS_ASSUME_NONNULL_END
