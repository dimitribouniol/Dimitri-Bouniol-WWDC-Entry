//
//  MDViewController.m
//  WWDC
//
//  Created by Dimitri Bouniol on 4/28/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import "MDViewController.h"
#import "MDRootViewController.h"

@interface MDViewController ()

@end

@implementation MDViewController

- (id)initWithIdentifier:(id)identifier
{
    if (self = [self initWithNibName:nil bundle:nil]) {
        _identifier = [identifier copy];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidBecomeCurrentPage
{
    
}

- (void)restartAnimations
{
    
}

- (void)viewDidGetResized
{
    [self.view layoutSubviews];
}

- (void)nextPage:(id)sender
{
    [self.rootController nextPage:sender];
}

- (void)previousPage:(id)sender
{
    [self.rootController previousPage:sender];
}

@end
