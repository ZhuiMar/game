//
//  RSSManagerHelper.h
//  RapidSignSelection
//
//  Created by liping on 2020/6/11.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^RSSManagerHelperThemeBlock)(NSString *);

@interface RSSManagerHelper : NSObject

@property(nonatomic, strong) RSSSymbolDataModel *model;

- (instancetype)initDataHelperWithThemeNameString:(RSSManagerHelperThemeBlock)nameString;
- (void)rssetermineNetworkStatus;
- (void)setDefaultName;

@end

NS_ASSUME_NONNULL_END
