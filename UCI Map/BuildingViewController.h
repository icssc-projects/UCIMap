//
//  BuildingViewController.h
//  UCI Map
//
//  Created by John Appleseed on 5/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Building.h"

#define METERS_PER_MILE 1609.344

@interface BuildingViewController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) Building *building;
- (IBAction)whereAmI:(id)sender;

@end
