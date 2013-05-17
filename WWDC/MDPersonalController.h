//
//  MDPersonalController.h
//  WWDC
//
//  Created by Dimitri Bouniol on 4/28/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import "MDViewController.h"

@interface MDPersonalController : MDViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
