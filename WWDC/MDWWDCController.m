//
//  MDWWDCController.m
//  WWDC
//
//  Created by Dimitri Bouniol on 4/28/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import "MDWWDCController.h"
#import "MDBadgeView.h"
#import "MDPageControl.h"

@interface MDWWDCController ()

@end

@implementation MDWWDCController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    badge2010 = [[MDBadgeView alloc] initWithFrame:_scrollView.bounds];
    badge2010.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    badge2010.frontImage = [UIImage imageNamed:@"WWDC2010Front.png"];
    badge2010.backImage = [UIImage imageNamed:@"WWDC2010Back.png"];
    [_scrollView addSubview:badge2010];
    
    badge2011 = [[MDBadgeView alloc] initWithFrame:_scrollView.bounds];
    badge2011.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    badge2011.frontImage = [UIImage imageNamed:@"WWDC2011Front.png"];
    badge2011.backImage = [UIImage imageNamed:@"WWDC2011Back.png"];
    [_scrollView addSubview:badge2011];
    
    badge2012 = [[MDBadgeView alloc] initWithFrame:_scrollView.bounds];
    badge2012.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    badge2012.frontImage = [UIImage imageNamed:@"WWDC2012Front.png"];
    badge2012.backImage = [UIImage imageNamed:@"WWDC2012Back.png"];
    [_scrollView addSubview:badge2012];
    
    _pageControl.pageIndicatorImage = [MDPageControl roundPageIndicatorWithSize:CGSizeMake(10, 10)];
    _pageControl.pageIndicatorSpacing = 26;
}

- (void)viewDidGetResized
{
    [super viewDidGetResized];
    
    CGFloat oldSize = _scrollView.contentSize.width/3.;
    _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*3, self.view.bounds.size.height);
    if (oldSize > 0) {
        _scrollView.contentOffset = CGPointMake(roundf(_scrollView.contentOffset.x/oldSize)*self.view.bounds.size.width, 0);
    } else {
        _scrollView.contentOffset = CGPointMake(self.view.bounds.size.width, 0);
    }
    badge2010.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    badge2011.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    badge2012.frame = CGRectMake(self.view.bounds.size.width*2, 0, self.view.bounds.size.width, self.view.bounds.size.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
