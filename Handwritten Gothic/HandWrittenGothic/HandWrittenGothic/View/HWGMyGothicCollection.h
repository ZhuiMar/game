//
//  HWGMyGothicCollection.h
//  HandWrittenGothic
//
//  Created by zy on 2020/5/13.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HWGMyGothicCollection : NSObject

@property(nonatomic,copy) NSString *idStr;
@property(nonatomic,copy) NSString *drawImage;
@property(nonatomic,copy) NSString *writeImage;
@property(nonatomic,copy) NSString *fontLibrary;
@property(nonatomic,copy) NSString *themeColor;
@property(nonatomic,copy) NSString *themeFont;

@end

NS_ASSUME_NONNULL_END
