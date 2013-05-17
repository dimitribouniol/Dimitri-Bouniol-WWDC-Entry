//
//  MDAboutNavigationController.m
//  MDAboutControllerDemo
//
//  Created by Dimitri Bouniol on 12/26/11.
//  Copyright (c) 2012 Mochi Development Inc. All rights reserved.
//  
//  Copyright (c) 2013 Dimitri Bouniol, Mochi Development, Inc.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software, associated artwork, and documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//  
//  1. The above copyright notice and this permission notice shall be included in
//     all copies or substantial portions of the Software.
//  2. Neither the name of Mochi Development, Inc. nor the names of its
//     contributors or products may be used to endorse or promote products
//     derived from this software without specific prior written permission.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//  
//  EleMints, the EleMints Icon, Mochi Dev, and the Mochi Development logo are
//  copyright Mochi Development, Inc.
//  
//  Also, it'd be super awesome if you left in the credit line generated
//  automatically by the code that links back to this page :)
//

#import "MDAboutNavigationController.h"
#import "MDAboutController.h"
#import "MDACStyle.h"

@implementation MDAboutNavigationController

- (id)initWithStyle:(MDACStyle *)style
{
    if (self = [super init]) {
        MDAboutController *aboutController = [[MDAboutController alloc] initWithStyle:style];
        [self pushViewController:aboutController animated:NO];
    }
    return self;
}

- (void)setDelegate:(id)delegate
{
    NSAssert(!([delegate conformsToProtocol:@protocol(MDAboutControllerDelegate)] && ![delegate conformsToProtocol:@protocol(UINavigationControllerDelegate)]), @"Please use setAboutControllerDelegate: instead to set the About Controller delegate.");
    
    [super setDelegate:delegate];
}

- (void)setAboutControllerDelegate:(id<MDAboutControllerDelegate>)aboutControllerDelegate
{
    self.aboutController.delegate = aboutControllerDelegate;
}

- (id<MDAboutControllerDelegate>)aboutControllerDelegate
{
    return self.aboutController.delegate;
}

- (id)init
{
    return [self initWithStyle:nil];
}

- (MDAboutController *)aboutController
{
    return [[self viewControllers] objectAtIndex:0];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.parentViewController.class != [UITabBarController class]) {
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(hideAbout:)];
        self.aboutController.navigationItem.rightBarButtonItem = doneButton;
    }
}

- (void)hideAbout:(MDACStyle *)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
