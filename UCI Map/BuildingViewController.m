//
//  BuildingViewController.m
//  UCI Map
//
//  Created by John Appleseed on 5/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BuildingViewController.h"


@interface BuildingViewController ()

@end

@implementation BuildingViewController
@synthesize mapView = _mapView;
@synthesize building = _building;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.building.abbreviation;
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setMapView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewWillAppear:(BOOL)animated
{
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = self.building.coordinate.latitude;
    zoomLocation.longitude = self.building.coordinate.longitude;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.1*METERS_PER_MILE, 0.1*METERS_PER_MILE);
    MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];
    [_mapView setRegion:adjustedRegion animated:TRUE];
    
    [_mapView addAnnotation:self.building];
    
}

- (IBAction)whereAmI:(id)sender {
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    [locationManager startUpdatingLocation];
    
    CLLocation *cLocation = [locationManager location];
    
    if (![CLLocationManager locationServicesEnabled] || cLocation == nil)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Service Disabled" message:@"To re-enable, please go to Settings and turn on Location Services for this app" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    CLLocationCoordinate2D currentLocation = cLocation.coordinate;
    
    CLLocation *buildingLocation = [[CLLocation alloc] initWithLatitude:self.building.coordinate.latitude longitude:self.building.coordinate.longitude];
    
    double distance = [cLocation distanceFromLocation:buildingLocation];
    
    CLLocationCoordinate2D centerPoint;
    centerPoint.longitude = (currentLocation.longitude + self.building.coordinate.longitude) / 2;
    centerPoint.latitude = (currentLocation.latitude + self.building.coordinate.latitude) / 2;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(centerPoint, distance, distance);
    MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];
    [_mapView setRegion:adjustedRegion animated:TRUE];

}
@end
