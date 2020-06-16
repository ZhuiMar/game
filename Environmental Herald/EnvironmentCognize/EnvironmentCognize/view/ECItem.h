//
//  ECItem.h
//  EnvironmentCognize
//
//  Created by luzhaoyang on 2020/4/7.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ECItemDelegate <NSObject>

- (void)rightItem;
- (void)wrongItem;

@end

@interface ECItem : UIView

@property(nonatomic,assign) NSInteger one;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *H;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *W;


@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *okImageView;

@property (weak, nonatomic) id<ECItemDelegate>delegate;

+ (instancetype)getImageView:(NSString *)imageName right:(NSInteger)right frame:(CGRect)frame;



@end

NS_ASSUME_NONNULL_END
