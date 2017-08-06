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
        appDelegate.loadinView = [[VZLoadingIndicatorView alloc] init];
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
}
```

## Hint

you should set images array to loadinView to animate them.
``` objective-c
[appDelegate.loadinView setImagesArray:@[@"L.png", @"L2.png",@"L3.png", @"L4.png",@"L5.png", @"L6.png", @"L7.png"]];
```

## Contact

Hassan Refaat

- https://github.com/hassan8357
- hassan.8357@gmail.com

## License

The MIT License (MIT)

Copyright (c) 2017 Hassan Refaat

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
