//
//  SceneDelegate.m
//  BuoyMathematics
//
//  Created by zy on 2020/4/26.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
       UIWindowScene *windowScene = (UIWindowScene *)scene;
       self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
       self.window.frame = windowScene.coordinateSpace.bounds;
       BuoyMath_HomePageVC *home = [[BuoyMath_HomePageVC alloc]init];
       BuoyMath_navigation *navigation = [[BuoyMath_navigation alloc]initWithRootViewController:home];
       self.window.rootViewController = navigation;
       [self.window makeKeyAndVisible];
}

@end
