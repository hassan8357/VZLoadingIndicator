# VzLoadingIndicator
=======================

[![Build Status](https://travis-ci.org/ninjaprox/NVActivityIndicatorView.svg?branch=master)](https://travis-ci.org/ninjaprox/NVActivityIndicatorView)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/NVActivityIndicatorView.svg)](https://img.shields.io/cocoapods/v/NVActivityIndicatorView.svg)

## Introduction
`VzLoadingIndicator` is a custom loading indicator with animation.

## Demo
![alt tag](https://raw.githubusercontent.com/hassan8357/VZLoadingIndicator/master/Vezeeta-loading-indicator.gif)

## Installation

### Cocoapods

Install Cocoapods if need be.

```bash
$ gem install cocoapods
```

Add `VZLoadingIndicator` in your `Podfile`.

```ruby
use_frameworks!

pod 'VZLoadingIndicator'
```

Add source URLs
```ruby
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/hassan8357/VZLoadingIndicator.git’
```

Then, run the following command.

```bash
$ pod install
```

## Example usage

import VZLoadingIndicatorView & UIWindow+Additions in AppDelegate
``` objective-c
#import "VZLoadingIndicatorView.h"
#import "UIWindow+Additions.h"
```

define sharedAppDelegate
``` objective-c
#define appDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])
```

create loadingView
``` objective-c
@property (strong, nonatomic) VZLoadingIndicatorView *loadinView;
```

Add start method and end methods in app delegate to add/remove loadinView to current visable view
``` objective-c
- (void)startActivityIndicator{

if (!appDelegate.loadinView)
{
[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];        
appDelegate.loadinView = [[CustomLoadingView alloc]init];
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
[[UIApplication sharedApplication] startNetworkActivity];
}

}
```

``` objective-c
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
[[UIApplication sharedApplication] stopNetworkActivity];
}
```




