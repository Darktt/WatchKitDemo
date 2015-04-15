//
//  MapControllerInterfaceController.m
//  WatchTest
//
//  Created by EdenLi on 2015/4/13.
//  Copyright (c) 2015年 Darktt. All rights reserved.
//

#import "MapControllerInterfaceController.h"

#import <CoreLocation/CoreLocation.h>

@interface MapControllerInterfaceController () <CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
}

@property (weak) IBOutlet WKInterfaceMap *map;

@end

@implementation MapControllerInterfaceController

- (void)awakeWithContext:(id)context
{
    [super awakeWithContext:context];
    
    [self setTitle:@"Map"];
    
    if (![CLLocationManager locationServicesEnabled]) {
        return;
    }
    
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    if (status != kCLAuthorizationStatusAuthorizedWhenInUse) {
        return;
    }
    
    _locationManager = [CLLocationManager new];
    [_locationManager setDelegate:self];
    [_locationManager startUpdatingLocation];
}

- (void)willActivate
{
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate
{
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (void)dealloc
{
    _locationManager = nil;
}

#pragma mark - CLLocationManager Delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = locations.lastObject;
    CLLocationCoordinate2D coordinate = location.coordinate;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 200.0f, 200.0f);
    
    [self.map setRegion:region];
    [self.map removeAllAnnotations];
    [self.map addAnnotation:coordinate withPinColor:WKInterfaceMapPinColorRed];
    
    [manager stopUpdatingLocation];
}

@end



