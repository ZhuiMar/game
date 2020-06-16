

#import "PGDatePicker.h"

@interface PGDatePicker (Logic)
- (void)setDayListForMonthDays:(NSInteger)day;

- (BOOL)setDayListWithComponent:(NSInteger)component dateComponents:(NSDateComponents *)dateComponents refresh:(BOOL)refresh;

- (BOOL)setDayList2WithComponent:(NSInteger)component dateComponents:(NSDateComponents *)dateComponents refresh:(BOOL)refresh;

- (BOOL)setHourListWithDateComponents:(NSDateComponents *)dateComponents refresh:(BOOL)refresh;

- (BOOL)setHourList2WithDateComponents:(NSDateComponents *)dateComponents refresh:(BOOL)refresh;


- (BOOL)setHourList3WithDateComponents:(NSDateComponents *)dateComponents refresh:(BOOL)refresh;

- (BOOL)setMinuteListWithComponent:(NSInteger)component dateComponents:(NSDateComponents *)dateComponents refresh:(BOOL)refresh;

- (BOOL)setMinuteList2WithComponent:(NSInteger)component dateComponents:(NSDateComponents *)dateComponents refresh:(BOOL)refresh;

- (BOOL)setMinuteList3WithComponent:(NSInteger)component dateComponents:(NSDateComponents *)dateComponents refresh:(BOOL)refresh;

- (BOOL)setMinuteList4WithComponent:(NSInteger)component dateComponents:(NSDateComponents *)dateComponents refresh:(BOOL)refresh;

- (BOOL)setMinuteList5WithComponent:(NSInteger)component dateComponents:(NSDateComponents *)dateComponents refresh:(BOOL)refresh;

- (BOOL)setSecondListWithComponent:(NSInteger)component dateComponents:(NSDateComponents *)dateComponents refresh:(BOOL)refresh;

- (BOOL)setSecondList2WithComponent:(NSInteger)component dateComponents:(NSDateComponents *)dateComponents refresh:(BOOL)refresh;

- (BOOL)setSecondList3WithComponent:(NSInteger)component dateComponents:(NSDateComponents *)dateComponents refresh:(BOOL)refresh;

- (BOOL)setSecondList4WithComponent:(NSInteger)component dateComponents:(NSDateComponents *)dateComponents refresh:(BOOL)refresh;

- (BOOL)setMonthListWithComponents:(NSDateComponents *)dateComponents refresh:(BOOL)refresh;
@end
