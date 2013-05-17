//
//  MDEducationController.h
//  WWDC
//
//  Created by Dimitri Bouniol on 4/28/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import "MDViewController.h"
@class MDTimelineView;

@interface MDEducationController : MDViewController

@property (weak, nonatomic) IBOutlet MDTimelineView *timeline;
- (IBAction)timelineValueChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *timelineLabel;
@end
