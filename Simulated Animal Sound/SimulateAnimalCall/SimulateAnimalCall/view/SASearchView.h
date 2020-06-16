//
//  SASearchView.h
//  SimulateAnimalCall
//
//  Created by luzhaoyang on 2020/4/8.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^TextBlock)(NSString *);

@class SASearchView;
@interface SASearchView : UIView

@property (weak, nonatomic) IBOutlet UITextField *textFiled;
@property (weak, nonatomic) IBOutlet UILabel *tishi;

+ (instancetype)getSearchViewText:(TextBlock)text;

@end

NS_ASSUME_NONNULL_END
