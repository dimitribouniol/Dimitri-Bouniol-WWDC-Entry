//
//  MDIntroController.m
//  WWDC
//
//  Created by Dimitri Bouniol on 4/28/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import "MDIntroController.h"

@interface MDIntroController ()

@end

@implementation MDIntroController

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
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CGFloat coeff = 1;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) coeff = 2;
    
    NSInteger total = 20*coeff;
    
    for (int i = 0; i < total; i++) {
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bubble.png"]];
        image.center = CGPointMake(arc4random()%(int)self.view.bounds.size.width, arc4random()%(int)self.view.bounds.size.height);
        image.alpha = 0.7*(arc4random()%1000)/1000.;
        CGFloat scale = fabsf(0.5+coeff*1.6*(arc4random()%1000)/1000.);
        image.transform = CGAffineTransformMakeScale(scale, scale);
        image.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
        [self.view insertSubview:image atIndex:0];
        
        [UIView animateWithDuration:(5+10*(arc4random()%1000)/1000.) delay:0 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
            image.center = CGPointMake(image.center.x + arc4random()%(int)100 - 50., image.center.y + arc4random()%(int)100 - 50.);
            image.alpha = 0.7*(arc4random()%1000)/1000.;
        } completion:^(BOOL finished) {
            
        }];
    }
    
    self.view.backgroundColor = [UIColor colorWithRed:255/255. green:20/255. blue:60/255. alpha:1];
    
    [UIView animateWithDuration:10 delay:0 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        self.view.backgroundColor = [UIColor colorWithRed:255/255. green:60/255. blue:0/255. alpha:1];
    } completion:^(BOOL finished) {
        self.view.backgroundColor = [UIColor colorWithRed:255/255. green:20/255. blue:60/255. alpha:1];
    }];
    
    [UIView animateWithDuration:1.5 delay:1 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionRepeat animations:^{
        self.arrow1.alpha = 0;
    } completion:^(BOOL finished) {
        self.arrow1.alpha = 1;
    }];
    
    [UIView animateWithDuration:1.5 delay:0.5 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionRepeat animations:^{
        self.arrow2.alpha = 0;
    } completion:^(BOOL finished) {
        self.arrow2.alpha = 1;
    }];
    
    [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionRepeat animations:^{
        self.arrow3.alpha = 0;
    } completion:^(BOOL finished) {
        self.arrow3.alpha = 1;
    }];
}

- (void)restartAnimations
{
    // TODO: Bubbles too
    
    [UIView animateWithDuration:0 animations:^{
        self.view.backgroundColor = [UIColor colorWithRed:255/255. green:20/255. blue:60/255. alpha:1];
        
        self.arrow1.alpha = 1;
        self.arrow2.alpha = 1;
        self.arrow3.alpha = 1;
    }];
    
    self.view.backgroundColor = [UIColor colorWithRed:255/255. green:20/255. blue:60/255. alpha:1];
    
    [UIView animateWithDuration:10 delay:0 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        self.view.backgroundColor = [UIColor colorWithRed:255/255. green:60/255. blue:0/255. alpha:1];
    } completion:^(BOOL finished) {
        self.view.backgroundColor = [UIColor colorWithRed:255/255. green:20/255. blue:60/255. alpha:1];
    }];
    
    self.arrow1.alpha = 1;
    [UIView animateWithDuration:1.5 delay:1 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionRepeat animations:^{
        self.arrow1.alpha = 0;
    } completion:^(BOOL finished) {
        self.arrow1.alpha = 1;
    }];
    
    self.arrow2.alpha = 1;
    [UIView animateWithDuration:1.5 delay:0.5 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionRepeat animations:^{
        self.arrow2.alpha = 0;
    } completion:^(BOOL finished) {
        self.arrow2.alpha = 1;
    }];
    
    self.arrow3.alpha = 1;
    [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionRepeat animations:^{
        self.arrow3.alpha = 0;
    } completion:^(BOOL finished) {
        self.arrow3.alpha = 1;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
