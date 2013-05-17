//
//  MDAppsController.m
//  WWDC
//
//  Created by Dimitri Bouniol on 4/28/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import "MDAppsController.h"
#import <QuartzCore/QuartzCore.h>

@interface MDAppsController ()

@end

@implementation MDAppsController

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
}

- (void)showScreenshot:(UIImage *)screenshot
{
    if (!screenshotView) {
        screenshotGuard = [[UIView alloc] initWithFrame:self.view.bounds];
        screenshotGuard.backgroundColor = [UIColor blackColor];
        screenshotGuard.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:screenshotGuard];
        
        screenshotView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        screenshotView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:screenshotView];
        screenshotView.contentMode = UIViewContentModeCenter;
        screenshotView.userInteractionEnabled = YES;
//        screenshotView.layer.shadowRadius = 20;
//        screenshotView.layer.shadowColor = [UIColor blackColor].CGColor;
//        screenshotView.layer.shadowOpacity = 0.75;
//        screenshotView.layer.shadowOffset = CGSizeMake(0, 5);
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideScreenshot:)];
        [screenshotView addGestureRecognizer:tap];
    }
    
    screenshotGuard.alpha = 0;
    screenshotView.alpha = 0;
    screenshotView.transform = CGAffineTransformMakeScale(0.001, 0.001);
    screenshotView.image = screenshot;
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        screenshotView.alpha = 1;
        screenshotGuard.alpha = 0.75;
        screenshotView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            screenshotView.alpha = 1;
            screenshotView.transform = CGAffineTransformIdentity;
        } completion:NULL];
    }];
}

- (void)hideScreenshot:(id)sender
{
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        screenshotView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            screenshotView.alpha = 0;
            screenshotGuard.alpha = 0;
            screenshotView.transform = CGAffineTransformMakeScale(0.001, 0.001);
        } completion:NULL];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
