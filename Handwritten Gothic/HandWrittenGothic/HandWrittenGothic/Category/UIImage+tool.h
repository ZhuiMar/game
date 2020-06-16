//
//  UIImage+tool.h
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/27.
//  Copyright © 2020 honghai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (tool)

+ (NSString*)encodeToBase64String:(UIImage*)image;
+ (UIImage *)decodeBase64ToImage:(NSString*)strEncodeData;



@end

NS_ASSUME_NONNULL_END
