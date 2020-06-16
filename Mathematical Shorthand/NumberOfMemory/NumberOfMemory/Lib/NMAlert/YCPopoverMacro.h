

#ifndef YCPopoverMacro_h
#define YCPopoverMacro_h

#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;

typedef void(^YCCompleteHandle)(BOOL presented);

typedef NS_ENUM(NSUInteger, YCPopoverType){
    YCPopoverTypeActionSheet = 1,
    YCPopoverTypeAlert = 2
};

#endif /* YCPopoverMacro_h */
