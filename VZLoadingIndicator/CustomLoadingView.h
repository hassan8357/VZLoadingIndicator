//
//  CustomLoadingView.h
//  VezeetaDrBridge
//
//  Created by Yomna Ahmed on 1/10/16.
//  Copyright © 2016 IOS Dev1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomLoadingView : UIView

-(void)setImagesArray:(NSArray*)imagesArray;

- (void)startAnimation;
- (void)stopAnimation;

@end
