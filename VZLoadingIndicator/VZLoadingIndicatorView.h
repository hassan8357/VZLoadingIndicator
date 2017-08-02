//
//  VZLoadingIndicator.h
//  VZLoadingIndicator
//
//  Created by Hassan on 8/1/17.
//  Copyright © 2017 Vezeeta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VZLoadingIndicatorView : UIView

-(void)setImagesArray:(NSArray*)imagesArray;

- (void)startAnimation;
- (void)stopAnimation;

@end
