//
//  Building.m
//  UCI Map
//
//  Created by John Appleseed on 5/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Building.h"

@implementation Building

@synthesize name = _name;
@synthesize abbreviation = _abbreviation;
@synthesize coordinate = _coordinate;

- (id)initWithName:(NSString *)name abbreviation:(NSString *)abbreviation coordinate:(CLLocationCoordinate2D)coordinate
{
    if ((self = [super init]))
    {
        self.name = name;
        self.abbreviation = abbreviation;
        _coordinate = coordinate;
    }
    
    return self;
}

- (NSString *)title
{
    if (_abbreviation == nil)
        return _name;
    else
        return _abbreviation;
}

- (NSString *)subtitle
{
    if (_abbreviation == nil)
        return @"";
    else
        return _name;
}    

- (NSComparisonResult)compare:(Building *)otherBuilding
{
    return [self.name compare:otherBuilding.name];
}

@end
