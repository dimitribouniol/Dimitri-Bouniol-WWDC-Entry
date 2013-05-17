//
//  Dimitri.h
//  WWDC
//
//  Created by Dimitri Bouniol on 4/30/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

static __inline__ CGFloat USMakeInchesFromFeet(CGFloat feet, CGFloat inches)
{
	return feet*12.+inches;
}

@interface Human : NSObject

@property (nonatomic, strong) NSArray *nationality;
@property (nonatomic, strong) NSArray *languagesSpoken;
@property (nonatomic, strong) UIColor *favoriteColor;

@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat weight;
@property (nonatomic, strong) UIColor *eyeColor;
@property (nonatomic, strong) UIColor *hairColor;

@property (nonatomic, strong) Human *mother;
@property (nonatomic, strong) Human *father;
@property (nonatomic, strong) Human *girlfriend;

@property (nonatomic, strong) NSDate *dob;

@end

@interface Bouniol : Human

@property (nonatomic, copy) NSString *lastName;

@end

@interface Maria : Bouniol

@property (nonatomic, copy) NSString *firstName;

@end


@interface JeanLuc : Bouniol

@property (nonatomic, copy) NSString *firstName;

@end


@interface Dimitri : Bouniol

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, strong) NSDictionary *martialArtRanks;
@property (nonatomic) CGFloat yearsProgramming;

@property (nonatomic, copy) NSString *firstProgrammingLanguage;
@property (nonatomic, copy) NSString *favoriteProgrammingLanguage;

@property (nonatomic, copy) NSString *firstObjCApp;
@property (nonatomic, strong) NSURL *firstObjCAppURL;
@property (nonatomic) CGFloat firstObjCAppYear;

@property (nonatomic, copy) NSString *firstiPhoneApp;
@property (nonatomic, strong) NSURL *firstiPhoneAppURL;
@property (nonatomic) CGFloat firstiPhoneAppYear;

@property (nonatomic, copy) NSArray *favoriteFonts;

@end


@interface Duong : Human

@property (nonatomic, copy) NSString *lastName;

@end


@interface Linh : Duong

@property (nonatomic, copy) NSString *firstName;

@end
