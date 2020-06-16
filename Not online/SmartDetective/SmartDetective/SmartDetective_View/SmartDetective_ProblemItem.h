//
//  SmartDetective_ProblemItem.h
//  SmartDetective
//
//  Created by zy on 2020/5/14.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SmartDetective_ProblemItem : UIView

@property(nonatomic,assign)NSInteger rightNumber;

@property (weak, nonatomic) IBOutlet UIImageView *arrowImage;

+ (instancetype)getProblemItemWithLevel:(NSInteger)level withItems:(NSMutableArray *)arr;

- (void)random;

@end

NS_ASSUME_NONNULL_END
