//
//  MDRootViewController.h
//  WWDC
//
//  Created by Dimitri Bouniol on 4/28/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MDViewController;

@interface MDRootViewController : UIViewController <UIScrollViewDelegate> {
    NSMutableDictionary *viewControllers;
    NSDictionary *viewControllerClasses;
    
    UIScrollView *_scrollView;
    
    NSInteger oldPage;
}

- (IBAction)previousPage:(id)sender;
- (IBAction)nextPage:(id)sender;

- (void)restartAnimations;

@end
