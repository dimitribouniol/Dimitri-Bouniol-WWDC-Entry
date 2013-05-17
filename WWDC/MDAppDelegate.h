//
//  MDAppDelegate.h
//  WWDC
//
//  Created by Dimitri Bouniol on 4/28/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MDRootViewController;

@interface MDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MDRootViewController *rootController;

@end
