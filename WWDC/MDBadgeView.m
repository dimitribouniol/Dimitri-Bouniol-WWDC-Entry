//
//  MDBadgeView.m
//  WWDC
//
//  Created by Dimitri Bouniol on 4/29/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import "MDBadgeView.h"

@implementation MDBadgeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        frontImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 900)];
        frontImageView.center = CGPointMake(self.bounds.size.width/2., self.bounds.size.height/2.);
        frontImageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
        frontImageView.contentMode = UIViewContentModeTop;
        frontImageView.layer.doubleSided = NO;
        [self addSubview:frontImageView];
        
        backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 900)];
        backImageView.center = CGPointMake(self.bounds.size.width/2., self.bounds.size.height/2.);
        backImageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
        backImageView.contentMode = UIViewContentModeTop;
        backImageView.layer.doubleSided = NO;
        backImageView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
        [self addSubview:backImageView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipBadge:)];
        [self addGestureRecognizer:tap];
        
//        self.backgroundColor = [UIColor colorWithHue:(arc4random()%1000)/1000. saturation:1 brightness:1 alpha:1];
    }
    return self;
}

- (void)flipBadge:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateRecognized) {
        
        
        CATransform3D transform = CATransform3DIdentity;
        transform.m34 = 1./-800.;
        
        if (showsBack) {
            transform = CATransform3DRotate(transform, 0, 0, 1, 0);
            showsBack = NO;
        } else {
            transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
            showsBack = YES;
        }
        
        CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"sublayerTransform"];
        transformAnimation.fromValue = [NSValue valueWithCATransform3D:self.layer.sublayerTransform];
        transformAnimation.toValue = [NSValue valueWithCATransform3D:transform];
        transformAnimation.duration = 0.3;
        transformAnimation.repeatCount = 1.0;
        transformAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [self.layer addAnimation:transformAnimation forKey:@"sublayerTransform"];
        self.layer.sublayerTransform = transform;
    }
}

//- (void)setBounds:(CGRect)bounds
//{
//    [super setBounds:bounds];
//    
//    frontImageView.frame = bounds;
//    backImageView.frame = bounds;
//}

- (void)setFrontImage:(UIImage *)frontImage
{
    frontImageView.image = frontImage;
}

- (void)setBackImage:(UIImage *)backImage
{
    backImageView.image = backImage;
}

- (UIImage *)frontImage
{
    return frontImageView.image;
}

- (UIImage *)backImage
{
    return backImageView.image;
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
