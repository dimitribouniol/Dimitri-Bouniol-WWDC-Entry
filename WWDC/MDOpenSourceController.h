//
//  MDOpenSourceController.h
//  WWDC
//
//  Created by Dimitri Bouniol on 4/28/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import "MDViewController.h"
#import "MDSpreadViewClasses.h"
#import "MDAboutController.h"
@class MDPageControl;

@interface MDOpenSourceController : MDViewController <MDSpreadViewDataSource, MDSpreadViewDelegate>

@property (strong, nonatomic) IBOutlet MDSpreadView *spreadView;
@property (weak, nonatomic) IBOutlet UIButton *aboutButton;
- (IBAction)showAbout:(id)sender;
@property (weak, nonatomic) IBOutlet MDPageControl *pageControl;
- (IBAction)changePage:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *pageControlLabel;

@end
