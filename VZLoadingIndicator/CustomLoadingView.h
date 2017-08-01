//
//  CustomLoadingView.h
//  VezeetaDrBridge
//
//  Created by Yomna Ahmed on 1/10/16.
//  Copyright © 2016 IOS Dev1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomLoadingView : UIView

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIView *redLineView;
@property (nonatomic, strong) UIImageView *rotationImageView;

- (void)startAnimation;
- (void)stopAnimation;

@end
