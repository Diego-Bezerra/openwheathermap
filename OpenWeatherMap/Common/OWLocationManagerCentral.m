//
//  OWLocationManagerCentral.m
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 28/06/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import "OWLocationManagerCentral.h"
#import "OpenWeatherMap-Swift.h"
#import "OWConstants.h"

@interface OWLocationManagerCentral() <CLLocationManagerDelegate>
    @property(strong, atomic) CLLocationManager* locationManager;
    @property(strong, atomic) CLLocation* lastLocation;
    @property(atomic) BOOL hasAlreadyStardeLocationUpdate;
@end

@implementation OWLocationManagerCentral

+(OWLocationManagerCentral*)sharedManager {
    static OWLocationManagerCentral *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}
    
-(id) init {
    self = [super init];
    if (self) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = 20;
    }
    
    return self;
}
    
-(void) start {    
    if (!_hasAlreadyStardeLocationUpdate) {
        _hasAlreadyStardeLocationUpdate = true;
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager startUpdatingLocation];
    }
}
    
#pragma mark CLLocationManagerDelegate

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    self.lastLocation = locations.firstObject;
    NSDictionary* userInfo = @{LM_LOCATIONS_KEY: locations};
    [[NSNotificationCenter defaultCenter] postNotificationName:DID_UPDATE_LOCATIONS object:nil userInfo:userInfo];
}
    
-(void) locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    NSDictionary* userInfo = @{LM_LOCATIONS_KEY: [NSNumber numberWithInt:status]};
    [[NSNotificationCenter defaultCenter] postNotificationName:DID_CHANGE_AUTHORIZATION_STATUS object:nil userInfo:userInfo];
}
    
@end
