//
//  SceneDelegate.m
//  MathematicalSpider
//
//  Created by luzhaoyang on 2020/4/20.
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
   MatheSpider_HomeViewController *home = [[MatheSpider_HomeViewController alloc]init];
   MatheSpider_navigation *navigation = [[MatheSpider_navigation alloc]initWithRootViewController:home];
   self.window.rootViewController = navigation;
   [self.window makeKeyAndVisible];
}

@end
