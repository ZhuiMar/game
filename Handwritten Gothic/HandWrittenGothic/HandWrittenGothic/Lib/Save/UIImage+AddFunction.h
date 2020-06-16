
#import <UIKit/UIKit.h>

@interface UIImage (AddFunction)

+ (UIImage *)squareImageFromImage:(UIImage *)image
                     scaledToSize:(CGFloat)newSize;

+ (UIImage *)getImageFromView:(UIView *)theView;

@end
