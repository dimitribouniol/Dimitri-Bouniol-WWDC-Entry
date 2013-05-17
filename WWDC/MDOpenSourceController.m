//
//  MDOpenSourceController.m
//  WWDC
//
//  Created by Dimitri Bouniol on 4/28/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import "MDOpenSourceController.h"
#import "MDPageControl.h"
#import "MDACClasses.h"
#import "MDRootViewController.h"

@interface MDOpenSourceController ()

@end

@implementation MDOpenSourceController

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
    // Do any additional setup after loading the view from its nib.
    
    CGFloat scale = [[UIScreen mainScreen] scale];
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(8.f, 1.f), NO, scale);
    CGContextRef c = UIGraphicsGetCurrentContext();
    if (scale > 1) {
        [[UIColor colorWithRed:206/255. green:211/255. blue:220/255. alpha:1] setFill];
        CGContextFillRect(c, CGRectMake(0, 0, 5.5, 1));
        [[UIColor colorWithRed:203/255. green:208/255. blue:218/255. alpha:1] setFill];
        CGContextFillRect(c, CGRectMake(5.5, 0, 2.5, 1));
    } else {
        [[UIColor colorWithRed:206/255. green:211/255. blue:220/255. alpha:1] setFill];
        CGContextFillRect(c, CGRectMake(0, 0, 6, 1));
        [[UIColor colorWithRed:203/255. green:208/255. blue:218/255. alpha:1] setFill];
        CGContextFillRect(c, CGRectMake(6, 0, 2, 1));
    }
    self.view.backgroundColor = [UIColor colorWithPatternImage:UIGraphicsGetImageFromCurrentImageContext()];
    UIGraphicsEndImageContext();
    
    _spreadView.rowHeight = 25;
    _spreadView.sectionColumnHeaderWidth = 60;
    _spreadView.columnWidth = 85;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        _spreadView.rowHeight = 44;
        _spreadView.sectionColumnHeaderWidth = 80;
        _spreadView.columnWidth = 105;
    }
    
    _spreadView.selectionMode = MDSpreadViewSelectionModeRowAndColumn;
    _spreadView.backgroundColor = nil;
    [_spreadView reloadData];
    
    [_aboutButton setBackgroundImage:[[UIImage imageNamed:@"MDACCellBackgroundSingle.png"] stretchableImageWithLeftCapWidth:7 topCapHeight:0] forState:UIControlStateNormal];
    [_aboutButton setBackgroundImage:[[UIImage imageNamed:@"MDACCellBackgroundSelectedSingle.png"] stretchableImageWithLeftCapWidth:7 topCapHeight:0] forState:UIControlStateHighlighted];
    
    _pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:50/255. green:79/255. blue:133/255. alpha:1];
    _pageControl.pageIndicatorShadowTintColor = [UIColor colorWithWhite:1 alpha:0.75];
    _pageControl.pageIndicatorTintColor = [UIColor colorWithWhite:0 alpha:0.3];
    _pageControl.pageIndicatorShadowOffset = CGSizeMake(0, 1);
//    _pageControl.pageIndicatorSpacing
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAbout:(id)sender
{
    MDAboutController *aboutController = [[MDAboutController alloc] initWithStyle:[MDACMochiDevStyle style]];
    
    [self.rootController presentViewController:aboutController animated:YES completion:NULL];
}

- (IBAction)changePage:(id)sender
{
    _pageControlLabel.text = [NSString stringWithFormat:@"Page %d of %d (See next page 😉)", 1+(int)_pageControl.currentPage, _pageControl.numberOfPages];
}

#pragma mark - MDSpreadView

- (NSInteger)numberOfColumnSectionsInSpreadView:(MDSpreadView *)aSpreadView
{
    return 100;
}

- (NSInteger)numberOfRowSectionsInSpreadView:(MDSpreadView *)aSpreadView
{
    return 100;
}

- (NSInteger)spreadView:(MDSpreadView *)aSpreadView numberOfColumnsInSection:(NSInteger)section
{
    return 10;
}

- (NSInteger)spreadView:(MDSpreadView *)aSpreadView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (id)spreadView:(MDSpreadView *)aSpreadView titleForHeaderInColumnSection:(NSInteger)section forRowAtIndexPath:(MDIndexPath *)rowPath
{
    return [NSString stringWithFormat:@"%d", rowPath.section*10+rowPath.row];
}

- (id)spreadView:(MDSpreadView *)aSpreadView titleForHeaderInRowSection:(NSInteger)section forColumnAtIndexPath:(MDIndexPath *)columnPath
{
    return [NSString stringWithFormat:@"%d", columnPath.section*10+columnPath.row];
}

- (id)spreadView:(MDSpreadView *)aSpreadView titleForHeaderInRowSection:(NSInteger)rowSection forColumnSection:(NSInteger)columnSection
{
    return @"×";
}

- (id)spreadView:(MDSpreadView *)aSpreadView objectValueForRowAtIndexPath:(MDIndexPath *)rowPath forColumnAtIndexPath:(MDIndexPath *)columnPath
{
    return [NSString stringWithFormat:@"%d", (columnPath.section*10+columnPath.row)*(rowPath.section*10+rowPath.row)];
}
@end
