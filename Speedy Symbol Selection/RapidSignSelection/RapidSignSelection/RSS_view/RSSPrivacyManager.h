//
//  RSSPrivacyManager.h
//  RapidSignSelection
//
//  Created by liping on 2020/6/11.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSSPrivacyManager : NSObject
@property(nonatomic, copy)NSString *nameString;
+ (instancetype)shareManager;
- (void)getPrivacyPolicy;
@end

NS_ASSUME_NONNULL_END
