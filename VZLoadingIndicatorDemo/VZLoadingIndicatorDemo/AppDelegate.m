//
//  AppDelegate.m
//  VZLoadingIndicatorDemo
//
//  Created by Hassan on 8/2/17.
//  Copyright © 2017 Vezeeta. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
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

#pragma mark Activity Indicator Methods

- (void)startActivityIndicator{
    
    if (!appDelegate.loadinView)
    {
        [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
        appDelegate.loadinView = [[CustomLoadingView alloc] init];
        [appDelegate.loadinView setImagesArray:@[@"L.png", @"L2.png",@"L3.png", @"L4.png",@"L5.png", @"L6.png", @"L7.png"]];
        UIViewController *visibleViewController = [self.window visibleViewController];
        UIViewController *viewController = visibleViewController;
        if (visibleViewController.navigationController)
        {
            visibleViewController.navigationController.interactivePopGestureRecognizer.enabled = NO;
            viewController = visibleViewController.navigationController;
            
        }
        CGRect frame = viewController.view.frame;
        frame.size.width = viewController.view.frame.size.width ;
        frame.size.height = viewController.view.frame.size.height;
        frame.origin.x = 0;
        frame.origin.y = 0;
        appDelegate.loadinView.frame = frame;
        
        [viewController.view addSubview: appDelegate.loadinView];
        
        [appDelegate.loadinView startAnimation];
    }
    
}

- (void)stopActivityIndicator{
    UIViewController *visibleViewController = [self.window visibleViewController];
    UIViewController *viewController = visibleViewController;
    if (visibleViewController.navigationController) {
        visibleViewController.navigationController.interactivePopGestureRecognizer.enabled = YES;
        viewController = visibleViewController.navigationController;
        
    }
    if (appDelegate.loadinView) {
        [appDelegate.loadinView stopAnimation];
        [appDelegate.loadinView removeFromSuperview];
        appDelegate.loadinView = nil;
    }
}

@end
