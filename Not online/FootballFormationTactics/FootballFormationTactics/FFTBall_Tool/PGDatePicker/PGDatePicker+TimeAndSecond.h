

#import "PGDatePicker.h"

@interface PGDatePicker (TimeAndSecond)
- (void)timeAndSecond_setupSelectedDate;
- (void)timeAndSecond_setDateWithComponents:(NSDateComponents *)components animated:(BOOL)animated;
- (void)timeAndSecond_didSelectWithComponent:(NSInteger)component;
@end
