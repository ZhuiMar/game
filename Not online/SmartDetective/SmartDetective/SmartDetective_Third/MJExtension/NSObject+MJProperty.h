

#import <Foundation/Foundation.h>
#import "MJExtensionConst.h"

@class MJProperty;


typedef void (^MJPropertiesEnumeration)(MJProperty *property, BOOL *stop);


typedef NSDictionary * (^MJReplacedKeyFromPropertyName)();
typedef id (^MJReplacedKeyFromPropertyName121)(NSString *propertyName);

typedef NSDictionary * (^MJObjectClassInArray)();

typedef id (^MJNewValueFromOldValue)(id object, id oldValue, MJProperty *property);


@interface NSObject (MJProperty)

+ (void)mj_enumerateProperties:(MJPropertiesEnumeration)enumeration;

+ (void)mj_setupNewValueFromOldValue:(MJNewValueFromOldValue)newValueFormOldValue;
+ (id)mj_getNewValueFromObject:(__unsafe_unretained id)object oldValue:(__unsafe_unretained id)oldValue property:(__unsafe_unretained MJProperty *)property;

+ (void)mj_setupReplacedKeyFromPropertyName:(MJReplacedKeyFromPropertyName)replacedKeyFromPropertyName;

+ (void)mj_setupReplacedKeyFromPropertyName121:(MJReplacedKeyFromPropertyName121)replacedKeyFromPropertyName121;

+ (void)mj_setupObjectClassInArray:(MJObjectClassInArray)objectClassInArray;
@end

@interface NSObject (MJPropertyDeprecated_v_2_5_16)
+ (void)enumerateProperties:(MJPropertiesEnumeration)enumeration MJExtensionDeprecated("Please prefix the method name with mj_, using_***");
+ (void)setupNewValueFromOldValue:(MJNewValueFromOldValue)newValueFormOldValue MJExtensionDeprecated("Please prefix the method name with mj_, using_***");
+ (id)getNewValueFromObject:(__unsafe_unretained id)object oldValue:(__unsafe_unretained id)oldValue property:(__unsafe_unretained MJProperty *)property MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (void)setupReplacedKeyFromPropertyName:(MJReplacedKeyFromPropertyName)replacedKeyFromPropertyName MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (void)setupReplacedKeyFromPropertyName121:(MJReplacedKeyFromPropertyName121)replacedKeyFromPropertyName121 MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (void)setupObjectClassInArray:(MJObjectClassInArray)objectClassInArray MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
@end
