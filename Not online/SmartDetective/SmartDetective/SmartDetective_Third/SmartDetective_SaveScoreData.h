//
//  SmartDetective_SaveScoreData.h
//  SmartDetective
//
//  Created by zy on 2020/5/23.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SmartDetective_SaveScoreData : NSObject

@property(nonatomic,copy) NSString *idStr;
@property(nonatomic,copy) NSString *drawImageString;
@property(nonatomic,copy) NSString *writeImage;
@property(nonatomic,copy) NSString *fontLibrary;
@property(nonatomic,copy) NSString *themeColorString;
@property(nonatomic,copy) NSString *themeFontString;

@end

NS_ASSUME_NONNULL_END
