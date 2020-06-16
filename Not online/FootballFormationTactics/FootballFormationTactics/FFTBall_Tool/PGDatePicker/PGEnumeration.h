

#ifndef PGEnumeration_h
#define PGEnumeration_h

typedef NS_ENUM(NSInteger, PGDatePickerMode) {
    PGDatePickerModeYear,
    PGDatePickerModeYearAndMonth,
    PGDatePickerModeDate,
    PGDatePickerModeDateHour,
    PGDatePickerModeDateHourMinute,
    PGDatePickerModeDateHourMinuteSecond,
    PGDatePickerModeMonthDay,
    PGDatePickerModeMonthDayHour,
    PGDatePickerModeMonthDayHourMinute,
    PGDatePickerModeMonthDayHourMinuteSecond,
    PGDatePickerModeTime,
    PGDatePickerModeTimeAndSecond,
    PGDatePickerModeMinuteAndSecond,
    PGDatePickerModeDateAndTime, 
};

typedef NS_ENUM(NSUInteger, PGDatePickerType) {
    PGDatePickerTypeLine,
    PGDatePickerTypeSegment,
    PGDatePickerTypeVertical,
};

typedef NS_ENUM(NSUInteger, PGShowUnitType) {
    PGShowUnitTypeAll,
    PGShowUnitTypeCenter,
    PGShowUnitTypeNone,
};

typedef NS_ENUM(NSUInteger, PGDatePickManagerStyle) {
    PGDatePickManagerStyleSheet,
    PGDatePickManagerStyleAlertTopButton,
    PGDatePickManagerStyleAlertBottomButton
};

#endif /* PGEnumeration_h */
