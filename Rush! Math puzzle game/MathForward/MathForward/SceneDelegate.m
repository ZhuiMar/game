//
//  SceneDelegate.m
//  MathForward
//
//  Created by luzhaoyang on 2020/4/21.
//  Copyright © 2020 teresa. All rights reserved.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.frame = windowScene.coordinateSpace.bounds;
    MathForward_HomeViewController *home = [[MathForward_HomeViewController alloc]init];
    MathForward_navigation *navigation = [[MathForward_navigation alloc]initWithRootViewController:home];
    self.window.rootViewController = navigation;
    [self.window makeKeyAndVisible];
}

@end
