//
//  SceneDelegate.m
//  MysteryBoard
//
//  Created by luzhaoyang on 2020/4/22.
//  Copyright © 2020 wansheng. All rights reserved.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    UIWindowScene *windowScene = (UIWindowScene *)scene;
        self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
        self.window.frame = windowScene.coordinateSpace.bounds;
        MysteryBoard_HomeVC *home = [[MysteryBoard_HomeVC alloc]init];
        MysteryBoard_Navigation *navigation = [[MysteryBoard_Navigation alloc]initWithRootViewController:home];
        self.window.rootViewController = navigation;
        [self.window makeKeyAndVisible];
}

@end
