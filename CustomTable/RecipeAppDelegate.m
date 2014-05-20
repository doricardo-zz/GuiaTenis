//
//  CustomTableAppDelegate.m
//  CustomTable
//
//  Created by Simon on 7/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "RecipeAppDelegate.h"
#import <RevMobAds/RevMobAds.h>
#import <Parse/Parse.h>
#import <CoreLocation/CoreLocation.h>
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation RecipeAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [RevMobAds startSessionWithAppID:@"536cab51f9344f3c440f6cb7"];
    
    // Override point for customization after application launch.
    [Parse setApplicationId:@"mdanrMutiGx6o8DJ560U1f1v9ayOfajZfuoU1kPE"
                  clientKey:@"Fqk14MJli1AfhqqhsML8Fto4RzvU7UhmzCuov9DT"];
    
    // Register for push notifications - Push
    [application registerForRemoteNotificationTypes:
     UIRemoteNotificationTypeBadge |
     UIRemoteNotificationTypeAlert |
     UIRemoteNotificationTypeSound];
   
    // Override point for customization after application launch.
    [NSThread sleepForTimeInterval:1.0];
    
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0xFF6D44)];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 0);
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont fontWithName:@"Verdana" size:21.0], NSFontAttributeName, nil]];

    //[[UINavigationBar appearance] setTitleTextAttributes:<#(NSDictionary *)#>];`

    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    // Store the deviceToken in the current Installation and save it to Parse.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    [currentInstallation saveInBackground];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];
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
    
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    if (currentInstallation.badge != 0) {
        currentInstallation.badge = 0;
        [currentInstallation saveEventually];
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)setUserLocation {
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_4_2
    RevMobAds *revmob = [RevMobAds session];
    BOOL locationAllowed = [CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied);
    
    if (locationAllowed){
        CLLocation *location = self.locationManager.location;
        
        [self.locationManager setDistanceFilter: kCLDistanceFilterNone];
        [self.locationManager setDesiredAccuracy: kCLLocationAccuracyHundredMeters];
        [self.locationManager startUpdatingLocation];
        
        [revmob setUserLatitude: location.coordinate.latitude
                  userLongitude: location.coordinate.longitude
                   userAccuracy: location.horizontalAccuracy];
    }
#endif
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    [self setUserLocation];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    if (currentInstallation.badge != 0) {
        currentInstallation.badge = 0;
        [currentInstallation saveEventually];
    }
    
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    //[RevMobAds session].testingMode = RevMobAdsTestingModeWithAds;
    //[RevMobAds session].userInterests = @[@"sports", @"games", @"mobile", @"advertising"];
    [[RevMobAds session] showFullscreen];
    //[[RevMobAds session] showPopup];
    //[[RevMobAds session] showBanner];
    
}

@end
