
#import <UIKit/UIKit.h>

@interface PGPickerColumnCell : UITableViewCell
@property (nonatomic, weak) UILabel *label;

- (void)transformWith:(CGFloat)angle scale:(CGFloat)scale;

@end
