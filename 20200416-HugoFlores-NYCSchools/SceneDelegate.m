//
//  SceneDelegate.m
//  20200416-HugoFlores-NYCSchools
//
//  Created by Hugo Flores Perez on 4/16/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

UIView *blankView;

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    NSLog(@"sceneDidBecomeActive");
    if (blankView == nil) {
        blankView = [UIView new];
        blankView.backgroundColor = [UIColor blackColor];
        blankView.translatesAutoresizingMaskIntoConstraints = false;
        blankView.tag = 12;
        return;
    }
    [[self.window viewWithTag:12] removeFromSuperview];
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
    NSLog(@"Enter background");
    // Pass NO for the animated parameter. Any animation will not complete
    // before the snapshot is taken.
    if ([self.window viewWithTag:12] != nil) {
        return;
    }
    [self.window.rootViewController.view addSubview:blankView];
    
    [[blankView.leftAnchor constraintEqualToAnchor: self.window.rootViewController.view.leftAnchor] setActive:true];
    [[blankView.rightAnchor constraintEqualToAnchor: self.window.rootViewController.view.rightAnchor] setActive:true];
    [[blankView.topAnchor constraintEqualToAnchor: self.window.rootViewController.view.topAnchor] setActive:true];
    [[blankView.bottomAnchor constraintEqualToAnchor: self.window.rootViewController.view.bottomAnchor] setActive:true];
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
