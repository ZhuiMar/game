

#import <Foundation/Foundation.h>
#import "MJExtensionConst.h"
#import <CoreData/CoreData.h>
#import "MJProperty.h"


@protocol MJKeyValue <NSObject>
@optional

+ (NSArray *)mj_allowedPropertyNames;


+ (NSArray *)mj_ignoredPropertyNames;


+ (NSDictionary *)mj_replacedKeyFromPropertyName;


+ (id)mj_replacedKeyFromPropertyName121:(NSString *)propertyName;


+ (NSDictionary *)mj_objectClassInArray;


- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property;

- (void)mj_keyValuesDidFinishConvertingToObject;

- (void)mj_objectDidFinishConvertingToKeyValues;
@end

@interface NSObject (MJKeyValue) <MJKeyValue>

+ (NSError *)mj_error;


+ (void)mj_referenceReplacedKeyWhenCreatingKeyValues:(BOOL)reference;


- (instancetype)mj_setKeyValues:(id)keyValues;


- (instancetype)mj_setKeyValues:(id)keyValues context:(NSManagedObjectContext *)context;


- (NSMutableDictionary *)mj_keyValues;
- (NSMutableDictionary *)mj_keyValuesWithKeys:(NSArray *)keys;
- (NSMutableDictionary *)mj_keyValuesWithIgnoredKeys:(NSArray *)ignoredKeys;


+ (NSMutableArray *)mj_keyValuesArrayWithObjectArray:(NSArray *)objectArray;
+ (NSMutableArray *)mj_keyValuesArrayWithObjectArray:(NSArray *)objectArray keys:(NSArray *)keys;
+ (NSMutableArray *)mj_keyValuesArrayWithObjectArray:(NSArray *)objectArray ignoredKeys:(NSArray *)ignoredKeys;

+ (instancetype)mj_objectWithKeyValues:(id)keyValues;

+ (instancetype)mj_objectWithKeyValues:(id)keyValues context:(NSManagedObjectContext *)context;


+ (instancetype)mj_objectWithFilename:(NSString *)filename;


+ (instancetype)mj_objectWithFile:(NSString *)file;

+ (NSMutableArray *)mj_objectArrayWithKeyValuesArray:(id)keyValuesArray;


+ (NSMutableArray *)mj_objectArrayWithKeyValuesArray:(id)keyValuesArray context:(NSManagedObjectContext *)context;


+ (NSMutableArray *)mj_objectArrayWithFilename:(NSString *)filename;

+ (NSMutableArray *)mj_objectArrayWithFile:(NSString *)file;

- (NSData *)mj_JSONData;

- (id)mj_JSONObject;

- (NSString *)mj_JSONString;
@end

@interface NSObject (MJKeyValueDeprecated_v_2_5_16)
- (instancetype)setKeyValues:(id)keyValue MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
- (instancetype)setKeyValues:(id)keyValues error:(NSError **)error MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
- (instancetype)setKeyValues:(id)keyValues context:(NSManagedObjectContext *)context MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
- (instancetype)setKeyValues:(id)keyValues context:(NSManagedObjectContext *)context error:(NSError **)error MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (void)referenceReplacedKeyWhenCreatingKeyValues:(BOOL)reference MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
- (NSMutableDictionary *)keyValues MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
- (NSMutableDictionary *)keyValuesWithError:(NSError **)error MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
- (NSMutableDictionary *)keyValuesWithKeys:(NSArray *)keys MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
- (NSMutableDictionary *)keyValuesWithKeys:(NSArray *)keys error:(NSError **)error MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
- (NSMutableDictionary *)keyValuesWithIgnoredKeys:(NSArray *)ignoredKeys MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
- (NSMutableDictionary *)keyValuesWithIgnoredKeys:(NSArray *)ignoredKeys error:(NSError **)error MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (NSMutableArray *)keyValuesArrayWithObjectArray:(NSArray *)objectArray MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (NSMutableArray *)keyValuesArrayWithObjectArray:(NSArray *)objectArray error:(NSError **)error MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (NSMutableArray *)keyValuesArrayWithObjectArray:(NSArray *)objectArray keys:(NSArray *)keys MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (NSMutableArray *)keyValuesArrayWithObjectArray:(NSArray *)objectArray keys:(NSArray *)keys error:(NSError **)error MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (NSMutableArray *)keyValuesArrayWithObjectArray:(NSArray *)objectArray ignoredKeys:(NSArray *)ignoredKeys MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (NSMutableArray *)keyValuesArrayWithObjectArray:(NSArray *)objectArray ignoredKeys:(NSArray *)ignoredKeys error:(NSError **)error MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (instancetype)objectWithKeyValues:(id)keyValues MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (instancetype)objectWithKeyValues:(id)keyValues error:(NSError **)error MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (instancetype)objectWithKeyValues:(id)keyValues context:(NSManagedObjectContext *)context MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (instancetype)objectWithKeyValues:(id)keyValues context:(NSManagedObjectContext *)context error:(NSError **)error MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (instancetype)objectWithFilename:(NSString *)filename MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (instancetype)objectWithFilename:(NSString *)filename error:(NSError **)error MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (instancetype)objectWithFile:(NSString *)file MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (instancetype)objectWithFile:(NSString *)file error:(NSError **)error MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (NSMutableArray *)objectArrayWithKeyValuesArray:(id)keyValuesArray MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (NSMutableArray *)objectArrayWithKeyValuesArray:(id)keyValuesArray error:(NSError **)error MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (NSMutableArray *)objectArrayWithKeyValuesArray:(id)keyValuesArray context:(NSManagedObjectContext *)context MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (NSMutableArray *)objectArrayWithKeyValuesArray:(id)keyValuesArray context:(NSManagedObjectContext *)context error:(NSError **)error MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (NSMutableArray *)objectArrayWithFilename:(NSString *)filename MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (NSMutableArray *)objectArrayWithFilename:(NSString *)filename error:(NSError **)error MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (NSMutableArray *)objectArrayWithFile:(NSString *)file MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
+ (NSMutableArray *)objectArrayWithFile:(NSString *)file error:(NSError **)error MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
- (NSData *)JSONData MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
- (id)JSONObject MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
- (NSString *)JSONString MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
@end
