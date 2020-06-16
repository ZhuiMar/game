

#import <UIKit/UIKit.h>

@interface PGDatePickerView : UITableViewCell
@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign, getter = isCurrentDate) BOOL currentDate;
@end
