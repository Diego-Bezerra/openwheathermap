//
//  OWLocationManagerCentral.h
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 28/06/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface OWLocationManagerCentral : NSObject

@property(strong, nonatomic) CLLocation* lastLocation;
    
+(OWLocationManagerCentral*)sharedManager;
-(void) start;
    
@end
