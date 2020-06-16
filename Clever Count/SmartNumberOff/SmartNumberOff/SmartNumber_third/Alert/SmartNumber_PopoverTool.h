//
//  SmartNumber_PopoverTool.h
//  SmartNumberOff
//
//  Created by zy on 2020/5/16.
//  Copyright © 2020 ximan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SmartNumber_CountScoreModel.h"

typedef void(^SmartNumberSaveScoreBlock)(SmartNumber_CountScoreModel *);

NS_ASSUME_NONNULL_BEGIN

@interface SmartNumber_PopoverTool : NSObject

@property(nonatomic,assign)NSInteger score;
@property(nonatomic,copy)NSMutableDictionary *dict;

- (instancetype)initWithMyScore:(NSInteger)score themeColorString:(NSString *)themeColor successfulBlock:(SmartNumberSaveScoreBlock)successfulBlock;
- (void)setStringVaule;
- (void)setSuccessDefault;

@end

NS_ASSUME_NONNULL_END
