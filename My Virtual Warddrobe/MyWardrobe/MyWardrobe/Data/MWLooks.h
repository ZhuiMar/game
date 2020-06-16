//
//  MWLooks.h
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/28.
//  Copyright © 2020 honghai. All rights reserved.
//

#import "RLMObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface MWLooks : RLMObject

@property NSString *type;
@property NSString *imageName;
@property NSString *top;
@property NSString *bottom;
@property NSString *foot;
@property NSString *name;

@end

NS_ASSUME_NONNULL_END
