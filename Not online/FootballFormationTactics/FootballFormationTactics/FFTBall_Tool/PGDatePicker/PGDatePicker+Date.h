
#import "PGDatePicker.h"

@interface PGDatePicker (Date)
- (void)date_setupSelectedDate;
- (void)date_setDateWithComponents:(NSDateComponents *)components animated:(BOOL)animated;
- (void)date_didSelectWithComponent:(NSInteger)component;
@end
