//
//  MDViewController.h
//  WWDC
//
//  Created by Dimitri Bouniol on 4/28/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MDRootViewController;

@interface MDViewController : UIViewController

@property (nonatomic, copy) id<NSCopying> identifier;

- (id)initWithIdentifier:(id)identifier;
- (void)viewDidBecomeCurrentPage;
- (void)viewDidGetResized;
- (void)restartAnimations;

@property (nonatomic, weak) MDRootViewController *rootController;
- (IBAction)previousPage:(id)sender;
- (IBAction)nextPage:(id)sender;

@end
