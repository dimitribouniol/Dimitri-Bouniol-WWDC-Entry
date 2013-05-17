//
//  MDTimelineView.m
//  WWDC
//
//  Created by Dimitri Bouniol on 4/30/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import "MDTimelineView.h"
#import <QuartzCore/QuartzCore.h>

@interface MDTimelineEvent : UIImageView

@property (nonatomic) CGFloat start;
@property (nonatomic) CGFloat end;
@property (nonatomic) BOOL isPoint;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;

@end

@implementation MDTimelineEvent

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:CGRectMake(0, 0, 8, 7)]) {
        self.image = [[UIImage imageNamed:@"TimelineLeftMark.png"] stretchableImageWithLeftCapWidth:3.5 topCapHeight:3];
    }
    return self;
}

- (void)setIsPoint:(BOOL)isPoint
{
    _isPoint = isPoint;
    
    if (isPoint) {
        self.image = [[UIImage imageNamed:@"TimelineRightMark.png"] stretchableImageWithLeftCapWidth:3.5 topCapHeight:3];
    } else {
        self.image = [[UIImage imageNamed:@"TimelineLeftMark.png"] stretchableImageWithLeftCapWidth:3.5 topCapHeight:3];
    }
}

@end

@implementation MDTimelineView

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
    events = [[NSMutableArray alloc] init];
    MDTimelineEvent *event;
    
    event = [[MDTimelineEvent alloc] init];
    event.start = (2001.-2001.)/(2013.-2001.);
    event.end = (2009.-2001.+5./11.)/(2013.-2001.);
    event.title = @"1996-2009: LILA";
    event.description = @"French-American private K-12 in LA";
    [events addObject:event];
    [self addSubview:event];
    
    event = [[MDTimelineEvent alloc] init];
    event.start = (2009.-2001.+8./11.)/(2013.-2001.);
    event.end = (2010.-2001.+3./11.)/(2013.-2001.);
    event.title = @"2009-2010: Japan";
    event.description = @"Studied in Japan\n(Woo Japan!)";
    [events addObject:event];
    [self addSubview:event];
    
    event = [[MDTimelineEvent alloc] init];
    event.start = (2010.-2001.+8./11.)/(2013.-2001.);
    event.end = (2013.-2001.)/(2013.-2001.);
    event.title = @"2010-2013: UCSD";
    event.description = @"Major: Linguistics\nMinors: Math & 中文";
    [events addObject:event];
    [self addSubview:event];
    
    event = [[MDTimelineEvent alloc] init];
    event.start = (2001.-2001.)/(2013.-2001.);
    event.isPoint = YES;
    event.title = @"2001: Perl";
    event.description = @"Picked up my first programming book";
    [events addObject:event];
    [self addSubview:event];
    
    event = [[MDTimelineEvent alloc] init];
    event.start = (2003.-2001.)/(2013.-2001.);
    event.isPoint = YES;
    event.title = @"2003: First Website";
    event.description = @"Putting everything together";
    [events addObject:event];
    [self addSubview:event];
    
    event = [[MDTimelineEvent alloc] init];
    event.start = (2006.-2001.+9./11.)/(2013.-2001.);
    event.isPoint = YES;
    event.title = @"Oct 2006: Mac OS";
    event.description = @"First Mac App, for JapanesePod101";
    [events addObject:event];
    [self addSubview:event];
    
    event = [[MDTimelineEvent alloc] init];
    event.start = (2008.-2001.+9./11.)/(2013.-2001.);
    event.isPoint = YES;
    event.title = @"Oct 2008: EleMints";
    event.description = @"First iOS App, EleMints: Periodic";
    [events addObject:event];
    [self addSubview:event];
    
    event = [[MDTimelineEvent alloc] init];
    event.start = (2009.-2001.+5/11.)/(2013.-2001.);
    event.isPoint = YES;
    event.title = @"Jun 2009: Cliché";
    event.description = @"Cliché Magazine iPhone app";
    [events addObject:event];
    [self addSubview:event];
    
    event = [[MDTimelineEvent alloc] init];
    event.start = (2009.-2001.+7.8/11.)/(2013.-2001.);
    event.isPoint = YES;
    event.title = @"Aug 2009: French";
    event.description = @"SmartFrench iPhone app";
    [events addObject:event];
    [self addSubview:event];
    
    event = [[MDTimelineEvent alloc] init];
    event.start = (2010.-2001.+9./11.)/(2013.-2001.);
    event.isPoint = YES;
    event.title = @"Nov 2010: Pitch";
    event.description = @"Perfect Pitch for iOS";
    [events addObject:event];
    [self addSubview:event];
    
    event = [[MDTimelineEvent alloc] init];
    event.start = (2010.-2001.+5./11.)/(2013.-2001.);
    event.isPoint = YES;
    event.title = @"2010: WWDC10";
    event.description = @"First Year at WWDC";
    [events addObject:event];
    [self addSubview:event];
    
    event = [[MDTimelineEvent alloc] init];
    event.start = (2011.-2001.+4./11.)/(2013.-2001.);
    event.isPoint = YES;
    event.title = @"Jun 2011: Nibbly";
    event.description = @"Nibbly's Nose digital book";
    [events addObject:event];
    [self addSubview:event];
    
    event = [[MDTimelineEvent alloc] init];
    event.start = (2011.-2001.+5./11.)/(2013.-2001.);
    event.isPoint = YES;
    event.title = @"2011: WWDC11";
    event.description = @"Second Year at WWDC";
    [events addObject:event];
    [self addSubview:event];
    
    event = [[MDTimelineEvent alloc] init];
    event.start = (2012.-2001.+5./11.)/(2013.-2001.);
    event.isPoint = YES;
    event.title = @"2012: WWDC12";
    event.description = @"Third Year at WWDC";
    [events addObject:event];
    [self addSubview:event];
    
    event = [[MDTimelineEvent alloc] init];
    event.start = (2013.-2001.)/(2013.-2001.);
    event.isPoint = YES;
    event.title = @"Jan 2013: SLUZZULS";
    event.description = @"SLUZZULS: Puzzle Game";
    [events addObject:event];
    [self addSubview:event];
    
    timeline = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width/2.-6., 0, 12, self.bounds.size.height)];
    timeline.image = [[UIImage imageNamed:@"TimelineSlider.png"] stretchableImageWithLeftCapWidth:6 topCapHeight:16];
    timeline.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleHeight;
    [self addSubview:timeline];
    
    leftBubble = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 142, 62)];
    leftBubble.image = [UIImage imageNamed:@"TimelineLeftBubble.png"];
    leftBubble.layer.anchorPoint = CGPointMake(1, 0.5);
    leftBubble.alpha = 0;
    [self addSubview:leftBubble];
    
    leftTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 120, 15)];
    leftTitleLabel.backgroundColor = nil;
    leftTitleLabel.opaque = NO;
    leftTitleLabel.text = @"1991-1996: Home";
    leftTitleLabel.font = [UIFont fontWithName:@"AvenirNext-DemiBold" size:12];
    [leftBubble addSubview:leftTitleLabel];
    
    leftDescriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 20, 120, 37)];
    leftDescriptionLabel.backgroundColor = nil;
    leftDescriptionLabel.opaque = NO;
    leftDescriptionLabel.text = @"In the loving care of my parents.";
    leftDescriptionLabel.numberOfLines = 2;
    leftDescriptionLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:12];
    [leftBubble addSubview:leftDescriptionLabel];
    
    rightBubble = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 142, 62)];
    rightBubble.image = [UIImage imageNamed:@"TimelineRightBubble.png"];
    rightBubble.layer.anchorPoint = CGPointMake(0, 0.5);
    rightBubble.alpha = 0;
    [self addSubview:rightBubble];
    
    rightTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(17, 5, 120, 15)];
    rightTitleLabel.backgroundColor = nil;
    rightTitleLabel.opaque = NO;
    rightTitleLabel.text = @"1991-1996: Home";
    rightTitleLabel.font = [UIFont fontWithName:@"AvenirNext-DemiBold" size:12];
    [rightBubble addSubview:rightTitleLabel];
    
    rightDescriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(17, 20, 120, 37)];
    rightDescriptionLabel.backgroundColor = nil;
    rightDescriptionLabel.opaque = NO;
    rightDescriptionLabel.text = @"In the loving care of my parents.";
    rightDescriptionLabel.numberOfLines = 2;
    rightDescriptionLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:12];
    [rightBubble addSubview:rightDescriptionLabel];
}

- (MDTimelineEvent *)leftTimelineEventForFraction:(CGFloat)fraction
{
    for (MDTimelineEvent *event in events) {
        if (!event.isPoint && event.start <= fraction && event.end >= fraction)
            return event;
    }
    
    return nil;
}

- (MDTimelineEvent *)rightTimelineEventForFraction:(CGFloat)fraction
{
    MDTimelineEvent *closestEvent = nil;
    CGFloat closestDistance = 1.;
    for (MDTimelineEvent *event in events) {
        if (event.isPoint && event.start-0.05 <= fraction && event.start+0.05 >= fraction) {
            if (fabsf(event.start-fraction) < closestDistance) {
                closestDistance = fabsf(event.start-fraction);
                closestEvent = event;
            }
        }
    }
    
    return closestEvent;
}

- (void)layoutSubviews
{
    for (MDTimelineEvent *event in events) {
        CGFloat height = 0;
        CGFloat center = event.start;
        if (!event.isPoint) {
            height = (event.end-event.start)*(self.bounds.size.height-40)+7;
            center = event.start + (event.end-event.start)/2.;
        }
        center = center*(self.bounds.size.height-40)+20;
        if (height < 7) height = 7;
        event.bounds = CGRectMake(0, 0, 8, height);
        event.center = CGPointMake(timeline.center.x, center);
    }
}

- (void)clearBubbles
{
    self.value = -1;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
    [UIView animateWithDuration:0.2 animations:^{
        leftBubble.alpha = 0;
        rightBubble.alpha = 0;
    }];
}

#pragma mark - Tracking

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint point = [touch locationInView:self];
    if (point.y < 20) point.y = 20;
    else if (point.y >= self.bounds.size.height-20) point.y = self.bounds.size.height-20;
    
    if (point.x > timeline.center.x-30 && point.x < timeline.center.x+30) {
        self.value = (point.y-20)/(self.bounds.size.height-40);
        [self sendActionsForControlEvents:UIControlEventValueChanged];
        
        MDTimelineEvent *leftEvent = [self leftTimelineEventForFraction:(point.y-20)/(self.bounds.size.height-40)];
        
        if (leftEvent) {
            leftTitleLabel.text = leftEvent.title;
            leftDescriptionLabel.text = leftEvent.description;
            
            if (leftBubble.alpha >= 0.8) {
                [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    leftBubble.center = CGPointMake(timeline.center.x-5., point.y);
                } completion:NULL];
            } else {
                leftBubble.alpha = 0;
                leftBubble.transform = CGAffineTransformMakeScale(0.01, 0.01);
                leftBubble.center = CGPointMake(timeline.center.x-5., point.y);
                
                [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                    leftBubble.alpha = 1;
                    leftBubble.transform = CGAffineTransformMakeScale(1.2, 1.2);
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.05 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                        leftBubble.transform = CGAffineTransformIdentity;
                    } completion:NULL];
                }];
            }
        } else {
            [UIView animateWithDuration:0.2 animations:^{
                leftBubble.alpha = 0;
            }];
        }
        
        MDTimelineEvent *rightEvent = [self rightTimelineEventForFraction:(point.y-20)/(self.bounds.size.height-40)];
        
        if (rightEvent) {
            rightTitleLabel.text = rightEvent.title;
            rightDescriptionLabel.text = rightEvent.description;
            
            if (rightBubble.alpha >= 0.8) {
                [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    rightBubble.center = CGPointMake(timeline.center.x+5., rightEvent.start*(self.bounds.size.height-40)+20);
                } completion:NULL];
            } else {
                rightBubble.alpha = 0;
                rightBubble.transform = CGAffineTransformMakeScale(0.01, 0.01);
                rightBubble.center = CGPointMake(timeline.center.x+5., rightEvent.start*(self.bounds.size.height-40)+20);
                
                [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                    rightBubble.alpha = 1;
                    rightBubble.transform = CGAffineTransformMakeScale(1.2, 1.2);
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.05 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                        rightBubble.transform = CGAffineTransformIdentity;
                    } completion:NULL];
                }];
            }
        } else {
            [UIView animateWithDuration:0.2 animations:^{
                rightBubble.alpha = 0;
            }];
        }
        
        return YES;
    }
    
    self.value = -1;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
    [UIView animateWithDuration:0.2 animations:^{
        leftBubble.alpha = 0;
        rightBubble.alpha = 0;
    }];
    
    return NO;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint point = [touch locationInView:self];
    if (point.y < 20) point.y = 20;
    else if (point.y >= self.bounds.size.height-20) point.y = self.bounds.size.height-20;
    
    self.value = (point.y-20)/(self.bounds.size.height-40);
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
    MDTimelineEvent *leftEvent = [self leftTimelineEventForFraction:(point.y-20)/(self.bounds.size.height-40)];
    
    if (leftEvent) {
        leftTitleLabel.text = leftEvent.title;
        leftDescriptionLabel.text = leftEvent.description;
        
        if (leftBubble.alpha >= 0.8) {
            leftBubble.center = CGPointMake(timeline.center.x-5., point.y);
        } else {
            leftBubble.alpha = 0;
            leftBubble.transform = CGAffineTransformMakeScale(0.01, 0.01);
            leftBubble.center = CGPointMake(timeline.center.x-5., point.y);
            
            [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                leftBubble.alpha = 1;
                leftBubble.transform = CGAffineTransformMakeScale(1.2, 1.2);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.05 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    leftBubble.transform = CGAffineTransformIdentity;
                } completion:NULL];
            }];
        }
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            leftBubble.alpha = 0;
        }];
    }
    
    MDTimelineEvent *rightEvent = [self rightTimelineEventForFraction:(point.y-20)/(self.bounds.size.height-40)];
    
    if (rightEvent) {
        rightTitleLabel.text = rightEvent.title;
        rightDescriptionLabel.text = rightEvent.description;
        
        if (rightBubble.alpha >= 0.8) {
            rightBubble.center = CGPointMake(timeline.center.x+5., rightEvent.start*(self.bounds.size.height-40)+20);
        } else {
            rightBubble.alpha = 0;
            rightBubble.transform = CGAffineTransformMakeScale(0.01, 0.01);
            rightBubble.center = CGPointMake(timeline.center.x+5., rightEvent.start*(self.bounds.size.height-40)+20);
            
            [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                rightBubble.alpha = 1;
                rightBubble.transform = CGAffineTransformMakeScale(1.2, 1.2);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.05 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    rightBubble.transform = CGAffineTransformIdentity;
                } completion:NULL];
            }];
        }
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            rightBubble.alpha = 0;
        }];
    }
    
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}

- (void)cancelTrackingWithEvent:(UIEvent *)event
{
    
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
