//
//  MapViewController.h
//  UCI Map
//
//  Created by John Appleseed on 5/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#define METERS_PER_MILE 1609.344

@interface MapViewController : UIViewController

@property (strong) NSMutableArray *buildings;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end
