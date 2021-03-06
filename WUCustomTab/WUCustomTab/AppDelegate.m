//
//  AppDelegate.m
//  WUCustomTab
//
//  Created by asun on 2018/3/22.
//  Copyright © 2018年 asun. All rights reserved.
//

#import "AppDelegate.h"
#import "WUOneController.h"
#import "WUTwoController.h"
#import "WUThreeController.h"
#import "MyTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //设置根控制器
//    UIWindow *window = [UIApplication sharedApplication].delegate.window;
//    window.rootViewController = [[WUOneController alloc]init];
//    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:[[WUOneController alloc]init]];
//    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:[[WUTwoController alloc]init]];
//    nav2.tabBarItem.title = @"kisdhciua";
//    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:[[WUThreeController alloc]init]];
//
//    UITabBarController *tabVC = [[UITabBarController alloc]init];
//    tabVC.viewControllers = @[nav1,nav2,nav3];
//    self.window.rootViewController = tabVC;
    
    MyTabBarController *tabBarController =  [[MyTabBarController alloc]init];
    tabBarController.tabBarSelectIndex = 0;
    self.window.rootViewController = tabBarController;
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
