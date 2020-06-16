

#import "PGDatePicker.h"

@interface PGDatePicker (Time)
- (void)time_setupSelectedDate;
- (void)time_setDateWithComponents:(NSDateComponents *)components animated:(BOOL)animated;
- (void)time_didSelectWithComponent:(NSInteger)component;
@end
