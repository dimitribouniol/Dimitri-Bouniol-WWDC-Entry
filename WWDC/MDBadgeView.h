//
//  MDBadgeView.h
//  WWDC
//
//  Created by Dimitri Bouniol on 4/29/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MDBadgeView : UIView {
    UIImageView *frontImageView;
    UIImageView *backImageView;
    BOOL showsBack;
}

@property (nonatomic, strong) UIImage *frontImage;
@property (nonatomic, strong) UIImage *backImage;

@end
