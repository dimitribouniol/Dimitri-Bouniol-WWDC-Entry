//
//  MDAppsViewer.m
//  WWDC
//
//  Created by Dimitri Bouniol on 4/30/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import "MDAppsViewer.h"
#import "UIImage+DBMaskedImageAdditions.h"
#import "MDAppsController.h"

@interface MDAppIcon : UIView {
    UIImageView *shadow;
    UILabel *label;
}

@property (nonatomic, strong) UIButton *icon;

- (void)setIconImage:(UIImage *)image;
- (void)setText:(NSString *)text;

@end

@implementation MDAppIcon

- (id)initWithFrame:(CGRect)frame
{
    shadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MDACIconShadow.png"]];
    self = [super initWithFrame:CGRectMake(0, 0, shadow.bounds.size.width, shadow.bounds.size.height+40)];
    if (self) {
        [self addSubview:shadow];
        UIImage *iconImage = [UIImage imageNamed:@"MDACIconMask.png"];
        _icon = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, iconImage.size.width, iconImage.size.height)];
        [_icon setImage:iconImage forState:UIControlStateNormal];
        _icon.center = CGPointMake(shadow.center.x, shadow.center.y-3);
        [self addSubview:_icon];
        
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, _icon.frame.origin.y+_icon.frame.size.height+5, self.bounds.size.width, 15)];
        label.backgroundColor = nil;
        label.opaque = NO;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"EleMints";
        label.numberOfLines = 2;
        label.textColor = [UIColor whiteColor];
        label.shadowColor = [UIColor colorWithWhite:0 alpha:0.75];
        label.shadowOffset = CGSizeMake(0, 1);
        label.font = [UIFont boldSystemFontOfSize:11];
        [self addSubview:label];
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            label.font = [UIFont boldSystemFontOfSize:12];
        }
    }
    return self;
}

- (void)setIconImage:(UIImage *)image
{
    image = [image maskedImageWithMask:[UIImage imageNamed:@"MDACIconMask.png"]];
    [_icon setImage:image forState:UIControlStateNormal];
}

- (void)setText:(NSString *)text
{
    label.text = text;
}

@end

@implementation MDAppsViewer

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _performInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self _performInit];
    }
    return self;
}

- (void)_performInit
{
    self.userInteractionEnabled = YES;
    
    iconA = [[MDAppIcon alloc] init];
    [iconA setIconImage:[UIImage imageNamed:@"IconEleMints.png"]];
    [iconA setText:@"EleMints"];
    [iconA.icon addTarget:self action:@selector(showEleMints:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:iconA];
    
    iconB = [[MDAppIcon alloc] init];
    [iconB setIconImage:[UIImage imageNamed:@"IconSLUZZULS.png"]];
    [iconB setText:@"SLUZZULS"];
    [iconB.icon addTarget:self action:@selector(showSLUZZULS:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:iconB];
    
    iconC = [[MDAppIcon alloc] init];
    [iconC setIconImage:[UIImage imageNamed:@"IconPitch@2x.png"]];
    [iconC setText:@"Perfect Pitch"];
    [iconC.icon addTarget:self action:@selector(showPitch:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:iconC];
    
    iconD = [[MDAppIcon alloc] init];
    [iconD setIconImage:[UIImage imageNamed:@"IconFrench@2x.png"]];
    [iconD setText:@"SmartFrench"];
    [iconD.icon addTarget:self action:@selector(showFrench:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:iconD];
}

- (void)showEleMints:(id)sender
{
    [_controller showScreenshot:[UIImage imageNamed:@"ScreenEleMints.png"]];
}

- (void)showSLUZZULS:(id)sender
{
    [_controller showScreenshot:[UIImage imageNamed:@"ScreenSLUZZULS.png"]];
}

- (void)showPitch:(id)sender
{
    [_controller showScreenshot:[UIImage imageNamed:@"ScreenPitch.png"]];
}

- (void)showFrench:(id)sender
{
    [_controller showScreenshot:[UIImage imageNamed:@"ScreenFrench.png"]];
}

- (void)layoutSubviews
{
    CGFloat centerMargins = floorf((self.bounds.size.width-4.*57.)/5.);
    CGFloat sideMargins = (self.bounds.size.width-4.*57.-3.*centerMargins)/2.;
    CGFloat halfIcon = 57/2.;
    CGFloat top = 118.5;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        centerMargins = floorf((self.bounds.size.width-4.*72.)/5.);
        sideMargins = (self.bounds.size.width-4.*72-3.*centerMargins)/2.;
        halfIcon = 72/2.;
        top = 118;
    }
    iconA.center = CGPointMake(sideMargins+halfIcon, top);
    iconB.center = CGPointMake(sideMargins+halfIcon*3+centerMargins, top);
    iconC.center = CGPointMake(sideMargins+halfIcon*5+centerMargins*2, top);
    iconD.center = CGPointMake(sideMargins+halfIcon*7+centerMargins*3, top);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
