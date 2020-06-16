//
//  SceneDelegate.m
//  SmartNumberOff
//
//  Created by zy on 2020/4/29.
//  Copyright © 2020 ximan. All rights reserved.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
      UIWindowScene *windowScene = (UIWindowScene *)scene;
      self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
      self.window.frame = windowScene.coordinateSpace.bounds;
      SmartNumber_HomePageVC *home = [[SmartNumber_HomePageVC alloc]init];
      SmartNumber_navigation *navi = [[SmartNumber_navigation alloc]initWithRootViewController:home];
      self.window.rootViewController = navi;
      self.window.backgroundColor = [UIColor clearColor];
      [self.window makeKeyAndVisible];
}
@end
