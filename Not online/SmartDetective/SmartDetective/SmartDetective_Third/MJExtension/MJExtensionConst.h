
#ifndef __MJExtensionConst__H__
#define __MJExtensionConst__H__

#import <Foundation/Foundation.h>


#define MJExtensionDeprecated(instead) NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, instead)


#define MJExtensionBuildError(clazz, msg) \
NSError *error = [NSError errorWithDomain:msg code:250 userInfo:nil]; \
[clazz setMj_error:error];


#ifdef DEBUG
#define MJExtensionLog(...) NSLog(__VA_ARGS__)
#else
#define MJExtensionLog(...)
#endif

#define MJExtensionAssertError(condition, returnValue, clazz, msg) \
[clazz setMj_error:nil]; \
if ((condition) == NO) { \
    MJExtensionBuildError(clazz, msg); \
    return returnValue;\
}

#define MJExtensionAssert2(condition, returnValue) \
if ((condition) == NO) return returnValue;


#define MJExtensionAssert(condition) MJExtensionAssert2(condition, )


#define MJExtensionAssertParamNotNil2(param, returnValue) \
MJExtensionAssert2((param) != nil, returnValue)

#define MJExtensionAssertParamNotNil(param) MJExtensionAssertParamNotNil2(param, )


#define MJLogAllIvars \
-(NSString *)description \
{ \
    return [self mj_keyValues].description; \
}
#define MJExtensionLogAllProperties MJLogAllIvars

extern NSString *const MJPropertyTypeInt;
extern NSString *const MJPropertyTypeShort;
extern NSString *const MJPropertyTypeFloat;
extern NSString *const MJPropertyTypeDouble;
extern NSString *const MJPropertyTypeLong;
extern NSString *const MJPropertyTypeLongLong;
extern NSString *const MJPropertyTypeChar;
extern NSString *const MJPropertyTypeBOOL1;
extern NSString *const MJPropertyTypeBOOL2;
extern NSString *const MJPropertyTypePointer;

extern NSString *const MJPropertyTypeIvar;
extern NSString *const MJPropertyTypeMethod;
extern NSString *const MJPropertyTypeBlock;
extern NSString *const MJPropertyTypeClass;
extern NSString *const MJPropertyTypeSEL;
extern NSString *const MJPropertyTypeId;

#endif
