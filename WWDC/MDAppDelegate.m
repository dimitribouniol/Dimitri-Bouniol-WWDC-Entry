//
//  MDAppDelegate.m
//  WWDC
//
//  Created by Dimitri Bouniol on 4/28/13.
//  Copyright (c) 2013 Mochi Development, Inc. All rights reserved.
//

#import "MDAppDelegate.h"
#import "MDRootViewController.h"
#import "Dimitri.h"

@implementation MDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor blackColor];
    
    self.rootController = [[MDRootViewController alloc] init];
    self.window.rootViewController = self.rootController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
    [self.rootController restartAnimations];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (id)createDimitri
{
    Dimitri *me = [[Dimitri alloc] init];
    
    me.lastName = @"Bouniol";
    me.firstName = @"Dimitri";
    
    me.mother = [Maria new];
    me.father = [JeanLuc new];
    me.girlfriend = [Linh new];
    
    me.dob = [NSDate dateWithTimeIntervalSince1970:685063200];
    // Sep 16, 1991 - 4:20 PM PST
    
    me.nationality = @[@"American",
                       @"Français"];
    me.languagesSpoken = @[@"English",
                           @"French",
                           @"Japanese",
                           @"Mandarin",
                           @"Classical Chinese",
                           @"Spanish"];
    me.favoriteColor = [UIColor orangeColor];
    
    me.martialArtRanks = @{@"Tae-Kwon-Do": @"2nd Degree Black Belt",
                           @"Hap-Ki-Do": @"2nd Degree Balck Belt",
                           @"Iaidou": @"5th Kyuu",
                           @"Judo": @"Novice"};
    me.yearsProgramming = 11; // Since the age of 10!
    me.firstProgrammingLanguage = @"Perl";
    me.favoriteProgrammingLanguage = @"Obj-C";
    me.favoriteFonts = @[@"Futura Medium", @"Avenir Next", @"Monofur"];
    
    me.firstObjCApp = @"JapanesePod101";
    me.firstObjCAppURL = [NSURL URLWithString:@"http://blogs.japanesepod101.com/blog/2006/10/22/dimitris-incredible-mac-application/"];
    me.firstObjCAppYear = 2006; // Released Oct 22, 2006
    
    me.firstiPhoneApp = @"EleMints";
    me.firstiPhoneAppURL = [NSURL URLWithString:@"http://mochidev.com/apps/elemints"];
    me.firstiPhoneAppYear = 2008; // Released Oct 9, 2008
    
    me.height = USMakeInchesFromFeet(5, 7);
    me.weight = 148.7;
    me.eyeColor = [UIColor brownColor];
    me.hairColor = [UIColor colorWithRed:0
                                   green:0
                                    blue:1
                                   alpha:1];
    
    return me;
}

@end
