//
//  MDEducationController.m
//  WWDC
//
//  Created by Dimitri Bouniol on 4/28/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import "MDEducationController.h"
#import "MDTimelineView.h"

@interface MDEducationController ()

@end

@implementation MDEducationController

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
    
    UIView *stripes = [[UIView alloc] initWithFrame:self.view.bounds];
    stripes.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Stripes.png"]];
    stripes.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    stripes.alpha = 0.1;
    [self.view insertSubview:stripes atIndex:0];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = [UIColor colorWithRed:47/255. green:127/255. blue:255/255. alpha:1];
    
    [UIView animateWithDuration:10 delay:0 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        self.view.backgroundColor = [UIColor colorWithRed:0/255. green:160/255. blue:255/255. alpha:1];
    } completion:^(BOOL finished) {
        self.view.backgroundColor = [UIColor colorWithRed:47/255. green:127/255. blue:255/255. alpha:1];
    }];
}

- (void)viewDidGetResized
{
    [super viewDidGetResized];
    [_timeline clearBubbles];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)timelineValueChanged:(MDTimelineView *)sender
{
    static NSArray *months = nil;
    
    if (!months) {
        months = @[@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December"];
    }
    
    if (sender.value >= 0) {
        CGFloat year = sender.value*(2013.-2001.)+2001.;
    _timelineLabel.text = [NSString stringWithFormat:@"%@ %d", [months objectAtIndex:floorf(12.*(year-floorf(year)))], (int)floorf(year)];
    } else {
        _timelineLabel.text = @"Tap the Timeline…";
    }
}
@end
