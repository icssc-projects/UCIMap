//
//  AppDelegate.m
//  UCI Map
//
//  Created by John Appleseed on 5/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "Building.h"
#import "TableViewController.h"
#import "MapViewController.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"UCI_Coordinates" ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray *rows = [content componentsSeparatedByString:@"\n"];
    
    NSMutableArray *buildings = [NSMutableArray array];
    
    for (NSString *row in rows)
    {
        
        //latitude,longitude    buildingNumber  BuildingName    [abbreviation]
        NSArray *elements = [row componentsSeparatedByString:@"\t"];
        if (elements.count > 2)
        {
            NSArray *coordinatesArray = [[elements objectAtIndex:0] componentsSeparatedByString:@","];
            if (coordinatesArray.count != 2) continue;
            
            CLLocationCoordinate2D coordinate;
            coordinate.latitude = [[coordinatesArray objectAtIndex:0] doubleValue];
            coordinate.longitude = [[coordinatesArray objectAtIndex:1] doubleValue];
            
            NSString *abbreviation = nil;
            if (elements.count > 3) abbreviation = [elements objectAtIndex:3];
            
            NSString *name = [elements objectAtIndex:2];
            
            Building *building = [[Building alloc] initWithName:name abbreviation:abbreviation  coordinate:coordinate];
            
            [buildings addObject:building];
            
            
        }
    }
    [buildings sortUsingSelector:@selector(compare:)];
    
    UITabBarController *barController = (UITabBarController *) self.window.rootViewController;
    
    UINavigationController * navController = [barController.viewControllers objectAtIndex:0];
    TableViewController * buildingsView = [navController.viewControllers objectAtIndex:0];
    buildingsView.buildings = buildings;
    
    MapViewController * mapController = [barController.viewControllers objectAtIndex:1];
    mapController.buildings = buildings;
    
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
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
