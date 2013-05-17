//
//  MDWWDCController.h
//  WWDC
//
//  Created by Dimitri Bouniol on 4/28/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import "MDViewController.h"
@class MDBadgeView;
@class MDPageControl;

@interface MDWWDCController : MDViewController {
    MDBadgeView *badge2010;
    MDBadgeView *badge2011;
    MDBadgeView *badge2012;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet MDPageControl *pageControl;

@end
