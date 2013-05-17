//
//  MDPersonalController.m
//  WWDC
//
//  Created by Dimitri Bouniol on 4/28/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import "MDPersonalController.h"
#import "MDRootViewController.h"

@interface MDPersonalController ()

@end

@implementation MDPersonalController

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
    
    UIView *dots = [[UIView alloc] initWithFrame:self.view.bounds];
    dots.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Dots.png"]];
    dots.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    dots.alpha = 0.5;
    [self.view insertSubview:dots atIndex:0];
    
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Personal" ofType:@"html"]]]];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidGetResized
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad && UIInterfaceOrientationIsPortrait(self.rootController.interfaceOrientation)) {
        _webView.userInteractionEnabled = NO;
    } else {
        _webView.userInteractionEnabled = YES;
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
//    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
//        [webView stringByEvaluatingJavaScriptFromString:@"document.querySelector('meta[name=viewport]').setAttribute('content', 'width=1200, initial-scale=0.6, user-scalable=no', false); "];
//        [webView setNeedsDisplay];
//    }
//    NSLog(@"WebView %@", [webView stringByEvaluatingJavaScriptFromString:@"document.body.children[0].style.backgroundColor = `transparent`"]);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = [UIColor colorWithRed:0/255. green:200/255. blue:0/255. alpha:1];
    
    [UIView animateWithDuration:10 delay:0 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        self.view.backgroundColor = [UIColor colorWithRed:0/255. green:188/255. blue:144/255. alpha:1];
    } completion:^(BOOL finished) {
        self.view.backgroundColor = [UIColor colorWithRed:0/255. green:200/255. blue:0/255. alpha:1];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
