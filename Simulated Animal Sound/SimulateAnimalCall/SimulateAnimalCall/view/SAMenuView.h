//
//  SAMenuView.h
//  SimulateAnimalCall
//
//  Created by luzhaoyang on 2020/4/8.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^MenuVauleBlock)(NSString *);

@interface SAMenuView : UIView<UITableViewDelegate,UITableViewDataSource>

+ (instancetype)getMenuViewMenuClass:(MenuVauleBlock)classStr;

- (void)roadData;

@end

NS_ASSUME_NONNULL_END
