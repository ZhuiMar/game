//
//  RSSPrivacyPolicyData.h
//  RapidSignSelection
//
//  Created by liping on 2020/6/11.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^RSSPrivacyPolicyDataBlock)();

@interface RSSPrivacyPolicyData : NSObject

@property(nonatomic, copy)RSSPrivacyPolicyDataBlock complete;
@property(nonatomic, copy)NSString *themeName;
- (instancetype)initGetProssToolWithThemeName:(NSString *)name complete:(RSSPrivacyPolicyDataBlock)complete;
- (void)setData;

@end

NS_ASSUME_NONNULL_END
