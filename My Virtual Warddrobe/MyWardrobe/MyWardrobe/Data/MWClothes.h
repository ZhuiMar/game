//
//  MWClothes.h
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/18.
//  Copyright © 2020 honghai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN

@interface MWClothes : RLMObject

@property NSString *type;
@property NSString *name;
@property NSString *brand;
@property NSString *size;
@property NSString *price;
@property NSString *imageName;
@property NSString *isSelect;

@end

NS_ASSUME_NONNULL_END
