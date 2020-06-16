//
//  AppDelegate.h
//  TruthOrDare
//
//  Created by  luzhaoyang on 2020/3/9.
//  Copyright © 2020 zhuimar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

