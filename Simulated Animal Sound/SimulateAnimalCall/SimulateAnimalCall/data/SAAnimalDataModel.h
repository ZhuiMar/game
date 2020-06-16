//
//  SAAnimalDataModel.h
//  SimulateAnimalCall
//
//  Created by luzhaoyang on 2020/4/10.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "RLMObject.h"
#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN

@interface SAAnimalDataModel : RLMObject

@property NSString *type;
@property NSString *name;
@property NSString *collection;
@property NSString *praise;

- (void)printLog;

@end

NS_ASSUME_NONNULL_END
