//
//  MDRootViewController.m
//  WWDC
//
//  Created by Dimitri Bouniol on 4/28/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import "MDRootViewController.h"
#import "MDViewController.h"
#import "MDIntroController.h"
#import "MDHeaderController.h"
#import "MDFooterController.h"
#import "MDPersonalController.h"
#import "MDEducationController.h"
#import "MDAppsController.h"
#import "MDOpenSourceController.h"
#import "MDWWDCController.h"

@interface MDRootViewController ()

@end

@implementation MDRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        viewControllerClasses = @{@(-1): [MDHeaderController class],
                                  @(0): [MDIntroController class],
                                  @(1): [MDPersonalController class],
                                  @(2): [MDEducationController class],
                                  @(3): [MDAppsController class],
                                  @(4): [MDOpenSourceController class],
                                  @(5): [MDWWDCController class],
                                  @(6): [MDFooterController class]};
        
        viewControllers = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)loadView
{
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    self.view = _scrollView;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    static BOOL firstTime = YES;
    
    if (firstTime) [self didRotateFromInterfaceOrientation:0];
    
    firstTime = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    static BOOL firstTime = YES;
    
    if (firstTime) [self didRotateFromInterfaceOrientation:0];
    
    firstTime = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    CGFloat offset = _scrollView.contentOffset.y;
    CGFloat height = _scrollView.bounds.size.height;
    
    CGFloat page = offset/height;
    
    NSInteger currentPage = roundf(page);
    NSInteger previousPage = currentPage - 2;
    NSInteger nextPage = currentPage + 2;
    
    MDViewController *previousController = [viewControllers objectForKey:[NSNumber numberWithInteger:previousPage]];
    MDViewController *nextController = [viewControllers objectForKey:[NSNumber numberWithInteger:nextPage]];
    
    if ([previousController isViewLoaded]) {
        [previousController.view removeFromSuperview];
        [viewControllers removeObjectForKey:[NSNumber numberWithInteger:previousPage]];
    }
    
    if ([nextController isViewLoaded]) {
        [nextController.view removeFromSuperview];
        [viewControllers removeObjectForKey:[NSNumber numberWithInteger:nextPage]];
    }
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    CGFloat offset = _scrollView.contentOffset.y;
    CGFloat height = _scrollView.bounds.size.height;
    
    oldPage = roundf(offset/height);
    
    NSInteger total = [self numberOfViewControllers]+2;
    for (NSInteger i = -1; i < total; i++) {
        MDViewController *controller = [self dequeueViewControllerForIdentifier:[NSNumber numberWithInteger:i]];
        controller.view.hidden = (i != oldPage);
    }
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    _scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width, _scrollView.bounds.size.height*[self numberOfViewControllers]);
    
    CGFloat height = _scrollView.bounds.size.height;
    CGFloat width = _scrollView.bounds.size.width;
    _scrollView.contentOffset = CGPointMake(0, oldPage*height);
    
    NSInteger total = [self numberOfViewControllers]+2;
    for (NSInteger i = -1; i < total; i++) {
        CGFloat offset = i*height;
        MDViewController *controller = [self dequeueViewControllerForIdentifier:[NSNumber numberWithInteger:i]];
        controller.view.frame = CGRectMake(0, offset, width, height);
        [controller viewDidGetResized];
        controller.view.hidden = NO;
    }
    
    [self scrollViewDidScroll:_scrollView];
}

- (void)restartAnimations
{
    [viewControllers enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [(MDViewController *)obj restartAnimations];
    }];
}

#pragma mark - Paging

- (NSUInteger)numberOfViewControllers
{
    return [viewControllerClasses count]-2;
}

- (MDViewController *)dequeueViewControllerForIdentifier:(id)identifier
{
    return [viewControllers objectForKey:identifier];
}

- (MDViewController *)viewControllerForPage:(NSInteger)page
{
    id identifier = [NSNumber numberWithInteger:page];
    
    MDViewController *controller = [self dequeueViewControllerForIdentifier:identifier];
    
    if (!controller) {
        controller = [(MDViewController *)[[viewControllerClasses objectForKey:[NSNumber numberWithInteger:page]] alloc] initWithIdentifier:identifier];
    }
    
    return controller;
}

- (IBAction)previousPage:(id)sender
{
    CGFloat offset = _scrollView.contentOffset.y;
    CGFloat height = self.view.bounds.size.height;
    
    CGFloat page = offset/height;
    
    NSInteger currentPage = roundf(page);
    NSInteger previousPage = currentPage - 1;
    
    if (previousPage < 0) previousPage = 0;
    
    [_scrollView setContentOffset:CGPointMake(0, height*previousPage) animated:YES];
}

- (IBAction)nextPage:(id)sender
{
    CGFloat offset = _scrollView.contentOffset.y;
    CGFloat height = self.view.bounds.size.height;
    
    CGFloat page = offset/height;
    
    NSInteger currentPage = roundf(page);
    NSInteger nextPage = currentPage + 1;
    
    if (nextPage > [self numberOfViewControllers]) nextPage = [self numberOfViewControllers]-1;
    
    [_scrollView setContentOffset:CGPointMake(0, height*nextPage) animated:YES];
}

#pragma mark - ScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = scrollView.contentOffset.y;
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    CGFloat page = offset/height;
    
    NSInteger currentPage = roundf(page);
    NSInteger previousPage = currentPage - 1;
    NSInteger nextPage = currentPage + 1;
    
    MDViewController *currentController = [self viewControllerForPage:currentPage];
    MDViewController *previousController = [self viewControllerForPage:previousPage];
    MDViewController *nextController = [self viewControllerForPage:nextPage];
    
    if (currentController.identifier) {
        currentController.rootController = self;
        [viewControllers setObject:currentController forKey:currentController.identifier];
    }
    
    if (previousController.identifier) {
        previousController.rootController = self;
        [viewControllers setObject:previousController forKey:previousController.identifier];
    }
    
    if (nextController.identifier) {
        nextController.rootController = self;
        [viewControllers setObject:nextController forKey:nextController.identifier];
    }
    
    if (!currentController.view.superview) {
        currentController.view.frame = CGRectMake(0, currentPage*height, width, height);
        [scrollView addSubview:currentController.view];
        [currentController viewDidGetResized];
    }
    
    if (!previousController.view.superview) {
        previousController.view.frame = CGRectMake(0, previousPage*height, width, height);
        [scrollView addSubview:previousController.view];
        [previousController viewDidGetResized];
    }
    
    if (!nextController.view.superview) {
        nextController.view.frame = CGRectMake(0, nextPage*height, width, height);
        [scrollView addSubview:nextController.view];
        [nextController viewDidGetResized];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offset = scrollView.contentOffset.y;
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    CGFloat page = offset/height;
    
    NSInteger currentPage = roundf(page);
    NSInteger previousPage = currentPage - 2;
    NSInteger nextPage = currentPage + 2;
    
    oldPage = currentPage;
    
    MDViewController *currentController = [self viewControllerForPage:currentPage];
    MDViewController *previousController = [self viewControllerForPage:previousPage];
    MDViewController *nextController = [self viewControllerForPage:nextPage];
    
    if (previousController.identifier) {
        previousController.rootController = self;
        [viewControllers setObject:previousController forKey:previousController.identifier];
    }
    
    if (nextController.identifier) {
        nextController.rootController = self;
        [viewControllers setObject:nextController forKey:nextController.identifier];
    }
    
    if (!previousController.view.superview) {
        previousController.view.frame = CGRectMake(0, previousPage*height, width, height);
        [scrollView addSubview:previousController.view];
        [previousController viewDidGetResized];
    }
    
    if (!nextController.view.superview) {
        nextController.view.frame = CGRectMake(0, nextPage*height, width, height);
        [scrollView addSubview:nextController.view];
        [nextController viewDidGetResized];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{ // begin animations after loading stuff
        [currentController viewDidBecomeCurrentPage];
    });
}



@end
