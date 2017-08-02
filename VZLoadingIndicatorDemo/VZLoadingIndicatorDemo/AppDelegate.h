//
//  AppDelegate.h
//  VZLoadingIndicatorDemo
//
//  Created by Hassan on 8/2/17.
//  Copyright © 2017 Vezeeta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomLoadingView.h"
#import "UIWindow+Additions.h"

#define appDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CustomLoadingView *loadinView;

- (void)startActivityIndicator;
- (void)stopActivityIndicator;

@end

