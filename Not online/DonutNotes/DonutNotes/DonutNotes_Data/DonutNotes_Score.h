//
//  DonutNotes_Score.h
//  DonutNotes
//
//  Created by luzhaoyang on 2020/4/19.
//  Copyright © 2020 willows. All rights reserved.
//

#import "RLMObject.h"
#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN

@interface DonutNotes_Score : RLMObject

@property NSString *DonutNotes_level;
@property NSString *DonutNotes_name;
@property NSString *DonutNotes_score;

@end

NS_ASSUME_NONNULL_END
