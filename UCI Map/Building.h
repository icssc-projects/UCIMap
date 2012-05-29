//
//  Building.h
//  UCI Map
//
//  Created by John Appleseed on 5/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Building : NSObject <MKAnnotation>

@property (strong) NSString *name;
@property (strong) NSString *abbreviation;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithName:(NSString*)name abbreviation:(NSString*)abbreviation coordinate:(CLLocationCoordinate2D)coordinate;

- (NSComparisonResult)compare:(Building *)otherBuilding;

@end
