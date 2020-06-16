//
//  FMFoodClass.h
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/14.
//  Copyright © 2020 guanhua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>

@class FMFood;
RLM_ARRAY_TYPE(FMFood)
@interface FMFoodClass : RLMObject

@property NSString *className;
@property RLMArray<FMFood *><FMFood> *foods;

@end


@interface FMFood : RLMObject

@property NSString *name;
@property NSString *purchaseDate;
@property NSString *shelfLife;
@property NSString *foodType;
@property NSString *note;
@property NSString *startTime;
@property NSString *endTime;

@end

