//
//  MDAppsViewer.h
//  WWDC
//
//  Created by Dimitri Bouniol on 4/30/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MDAppIcon, MDAppsController;

@interface MDAppsViewer : UIImageView {
    MDAppIcon *iconA;
    MDAppIcon *iconB;
    MDAppIcon *iconC;
    MDAppIcon *iconD;
}

@property (nonatomic, weak) IBOutlet MDAppsController *controller;

@end
