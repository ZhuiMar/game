//
//  MathForward_ThemeTool.h
//  MathForward
//
//  Created by zy on 2020/5/14.
//  Copyright © 2020 teresa. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^MathForwardSaveScoreBlock)(MathForward_ScoreData *);

@interface MathForward_ThemeTool : NSObject

@property(nonatomic,copy)NSMutableDictionary *dict;

- (instancetype)initWithScore:(NSInteger)score themeColor:(NSString *)themeColor completeBlock:(MathForwardSaveScoreBlock)complete;
- (void)setStringVaule;
- (void)setUiDefault;
@end

NS_ASSUME_NONNULL_END
