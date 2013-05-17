//
//  MDPageControl.m
//  MDPageControlDemo
//
//  Created by Dimitri Bouniol on 4/23/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//
//  Copyright (c) 2013 Dimitri Bouniol, Mochi Development, Inc.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software, associated artwork, and documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  1. The above copyright notice and this permission notice shall be included in
//     all copies or substantial portions of the Software.
//  2. Neither the name of Mochi Development, Inc. nor the names of its
//     contributors or products may be used to endorse or promote products
//     derived from this software without specific prior written permission.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
//  Mochi Dev, and the Mochi Development logo are copyright Mochi Development, Inc.
//

#import "MDPageControl.h"


// From https://gist.github.com/dimitribouniol/5085495

static __inline__ CGFloat MDPCRound(CGFloat value)
{
    static CGFloat scale = 0;
    if (scale <= 0) {
        scale = [[UIScreen mainScreen] scale];
    }
    
    return roundf(value*scale)/scale;
}

static __inline__ CGFloat MDPCPixel()
{
    static CGFloat scale = 0;
    if (scale <= 0) {
        scale = [[UIScreen mainScreen] scale];
    }
    
    return 1./scale;
}

@interface MDPageControl ()

- (UIImage *)_indicatorImageForPage:(NSUInteger)page;
- (CGRect)_rectForPage:(NSUInteger)page;
- (UIImage *)_tintedImage:(UIImage *)image withColor:(UIColor *)color maskedOffset:(CGPoint)offset;
- (void)setCurrentPage:(CGFloat)currentPage updateScrollView:(BOOL)yn;

@end

@implementation MDPageControl

#pragma mark - AboutController

+ (NSDictionary *)MDAboutControllerTextCreditDictionary
{
    if (self == [MDPageControl class]) {
        return [NSDictionary dictionaryWithObjectsAndKeys:@"Page controls powered by MDPageControl, available free on GitHub!", @"Text", @"https://github.com/mochidev/MDPageControlDemo", @"Link", nil];
    }
    return nil;
}

#pragma mark - Initializers

+ (void)initialize
{
    if (self != [MDPageControl class]) return;
    
    MDPageControl *appearanceProxy = [self appearance];
    appearanceProxy.pageIndicatorSpacing = 16;
    appearanceProxy.pageIndicatorImage = [self roundPageIndicatorWithSize:CGSizeMake(6, 6)];
    appearanceProxy.pageIndicatorTintColor = [UIColor colorWithWhite:1 alpha:0.3];
    appearanceProxy.currentPageIndicatorTintColor = [UIColor whiteColor];
    appearanceProxy.pageIndicatorShadowTintColor = [UIColor colorWithWhite:0 alpha:0.2];
    appearanceProxy.pageIndicatorShadowOffset = CGSizeMake(0, -MDPCPixel());
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.opaque = NO;
        self.backgroundColor = nil;
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
    indicators = [[NSMutableArray alloc] init];
    self.contentMode = UIViewContentModeRedraw;
}

- (void)dealloc
{
    self.scrollView = nil;
}

#pragma mark - Class Accessors

+ (UIImage *)roundPageIndicatorWithSize:(CGSize)size
{
    CGRect frame = CGRectZero;
    frame.size = size;
    
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 0);
    
    [[UIColor blackColor] setFill];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:frame];
    [path fill];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

#pragma mark - Accessors

- (void)setCurrentPage:(CGFloat)currentPage
{
    [self setCurrentPage:currentPage updateScrollView:YES];
}

- (void)setCurrentPage:(CGFloat)currentPage updateScrollView:(BOOL)yn;
{
    if (yn) {
        [_scrollView setContentOffset:CGPointMake(currentPage*_scrollView.bounds.size.width, _scrollView.contentOffset.y) animated:YES];
    } else if (_currentPage != currentPage) {
        _currentPage = currentPage;
        [self setNeedsDisplay];
    }
}

- (void)setNumberOfPages:(NSUInteger)numberOfPages
{
    if (_numberOfPages != numberOfPages) {
        _numberOfPages = numberOfPages;
        [self setNeedsDisplay];
    }
}

- (void)setImage:(UIImage *)anImage forPage:(NSUInteger)page
{
    if (!anImage && page >= indicators.count) return;
    
    while (page >= indicators.count) {
        [indicators addObject:[NSNull null]];
    }
    
    if (anImage) {
        [indicators replaceObjectAtIndex:page withObject:anImage];
    } else {
        [indicators replaceObjectAtIndex:page withObject:[NSNull null]];
        while ([indicators lastObject] == [NSNull null]) {
            [indicators removeLastObject];
        }
    }
}

- (UIImage *)imageForPage:(NSUInteger)page
{
    if (page >= indicators.count) return nil;
    
    UIImage *returnValue = [indicators objectAtIndex:page];
    if ((NSNull *)returnValue == [NSNull null]) returnValue = nil;
    
    return returnValue;
}

- (void)setScrollView:(UIScrollView *)scrollView
{
    if (_scrollView) {
        [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
        [_scrollView removeObserver:self forKeyPath:@"contentSize"];
    }
    
    _scrollView = scrollView;
    
    if (scrollView) {
        [self setCurrentPage:scrollView.contentOffset.x/scrollView.frame.size.width updateScrollView:NO];
        self.numberOfPages = roundf(scrollView.contentSize.width/scrollView.frame.size.width);
        
        [scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:NULL];
        [scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:NULL];
    }
}

#pragma mark - Private Accessors

- (UIImage *)_indicatorImageForPage:(NSUInteger)page
{
    UIImage *returnValue = [self imageForPage:page];
    if (!returnValue) returnValue = self.pageIndicatorImage;
    
    return returnValue;
}

- (CGRect)_rectForPage:(NSUInteger)page
{
    UIImage *image = [self _indicatorImageForPage:page];
    
    CGRect rect = CGRectZero;
    
    rect.size = image.size;
    rect.origin.y = MDPCRound((self.bounds.size.height - rect.size.height)/2.);
    rect.origin.x = MDPCRound((self.bounds.size.width - (_numberOfPages-1)*_pageIndicatorSpacing)/2. + page*_pageIndicatorSpacing - rect.size.width/2.);
    
    return rect;
}

- (UIImage *)_tintedImage:(UIImage *)image withColor:(UIColor *)color maskedOffset:(CGPoint)offset
{
    CGRect frame = CGRectZero;
    frame.size = image.size;
    
    CGRect maskFrame = frame;
    frame.origin = CGPointMake(MDPCRound(offset.x), MDPCRound(offset.y));
    
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, image.scale);
    
    [color setFill];
    UIRectFillUsingBlendMode(frame, kCGBlendModeNormal);
    
    [image drawInRect:frame blendMode:kCGBlendModeDestinationIn alpha:1];
    
    if (!CGPointEqualToPoint(frame.origin, CGPointZero)) {
        [image drawInRect:maskFrame blendMode:kCGBlendModeDestinationIn alpha:1];
    }
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

#pragma mark - Key Value Observing

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        UIScrollView *scrollView = object;
        CGPoint contentOffset = [(NSValue *)[change objectForKey:NSKeyValueChangeNewKey] CGPointValue];
        
        [self setCurrentPage:contentOffset.x/scrollView.frame.size.width updateScrollView:NO];
    } else if ([keyPath isEqualToString:@"contentSize"]) {
        UIScrollView *scrollView = object;
        CGSize contentSize = [(NSValue *)[change objectForKey:NSKeyValueChangeNewKey] CGSizeValue];
        
        self.numberOfPages = roundf(contentSize.width/scrollView.frame.size.width);
    }
    
//    if ([super respondsToSelector:@selector(observeValueForKeyPath:ofObject:change:context:)]) {
//        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
//    }
}

#pragma mark - Drawing

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    for (NSUInteger i = 0; i < _numberOfPages; i++) {
        UIImage *indicatorImage = [self _indicatorImageForPage:i];
        CGRect rect = [self _rectForPage:i];
        CGRect shadowRect = CGRectMake(rect.origin.x + _pageIndicatorShadowOffset.width, rect.origin.y + _pageIndicatorShadowOffset.height, rect.size.width, rect.size.height);
        
        [[self _tintedImage:indicatorImage withColor:_pageIndicatorShadowTintColor maskedOffset:CGPointZero] drawInRect:shadowRect];
        [[self _tintedImage:indicatorImage withColor:_pageIndicatorTintColor maskedOffset:CGPointZero] drawInRect:rect];
        
        CGFloat difference = _currentPage - (CGFloat)i;
        if (fabsf(difference) < 1) {
            [[self _tintedImage:indicatorImage withColor:_currentPageIndicatorTintColor maskedOffset:CGPointMake(indicatorImage.size.width*difference, 0)] drawInRect:rect];
        }
    }
}

#pragma mark - Touches

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint location = [touch locationInView:self];
    
    CGFloat newPage = roundf(_currentPage);
    CGFloat oldPage = _currentPage;
    if (location.x < (self.bounds.size.width - (_numberOfPages-1)*_pageIndicatorSpacing)/2. + _currentPage*_pageIndicatorSpacing) {
        newPage -= 1;
        if (newPage < 0) newPage = 0;
    } else {
        newPage += 1;
        if (newPage >= _numberOfPages) newPage = _numberOfPages-1;
    }
    
    [self setCurrentPage:newPage updateScrollView:(_scrollView != nil)];
    
    if (newPage != oldPage)
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    
    return NO;
}

@end
