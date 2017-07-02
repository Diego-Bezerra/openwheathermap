//
//  WeatherService.h
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 01/07/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherResponse.h"
#import "OWBaseSessionManager.h"

@interface WeatherService: OWBaseSessionManager
    -(void) getWeatherDataWithLatitude:(double) lat longitude:(double) lon andCallback:(void (^)(WeatherResponse* weatherResponse, NSError* error)) callback;
@end
