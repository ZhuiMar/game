
#import "PGDatePicker.h"

@interface PGDatePicker (MinuteAndSecond)
- (void)minuteAndSecond_setupSelectedDate;
- (void)minuteAndSecond_setDateWithComponents:(NSDateComponents *)components animated:(BOOL)animated;
- (void)minuteAndSecond_didSelectWithComponent:(NSInteger)component;
@end
