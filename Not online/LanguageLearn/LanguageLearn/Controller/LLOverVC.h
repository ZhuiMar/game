//
//  LLOverVC.h
//  LanguageLearn
//
//  Created by  luzhaoyang on 2020/3/19.
//  Copyright © 2020 haike. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LLOverVCDelegate <NSObject>

-(void)againAction;

@end

@interface LLOverVC : UIViewController

@property(nonatomic,weak) id<LLOverVCDelegate>delegate;
@property(nonatomic,copy) NSString *frome;

- (instancetype)initWithScored:(NSInteger)score;

@end

NS_ASSUME_NONNULL_END
