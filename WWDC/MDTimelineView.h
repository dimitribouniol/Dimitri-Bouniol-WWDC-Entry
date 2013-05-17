//
//  MDTimelineView.h
//  WWDC
//
//  Created by Dimitri Bouniol on 4/30/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDTimelineView : UIControl {
    UIImageView *timeline;
    UIImageView *leftBubble;
    UIImageView *rightBubble;
    
    UILabel *leftTitleLabel;
    UILabel *leftDescriptionLabel;
    
    UILabel *rightTitleLabel;
    UILabel *rightDescriptionLabel;
    
    NSMutableArray *events;
}

@property (nonatomic) CGFloat value;

- (void)clearBubbles;

@end
