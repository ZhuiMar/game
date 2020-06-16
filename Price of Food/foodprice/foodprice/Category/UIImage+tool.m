//
//  UIImage+tool.m
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/27.
//  Copyright © 2020 honghai. All rights reserved.
//

#import "UIImage+tool.h"

@implementation UIImage (tool)

+ (NSString*)encodeToBase64String:(UIImage*)image {
    NSData *data = UIImageJPEGRepresentation(image, 0.5f);
    return [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}
+ (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return[UIImage imageWithData:data];
}

@end
