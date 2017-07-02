//
//  WeatherFacade.h
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 02/07/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherResponse.h"

@interface WeatherFacade : NSObject
    -(void) getWeatherDataWithLatitude:(double) lat longitude:(double) lon andCallback:(void (^)(WeatherResponse* weatherResponse, NSError* error)) callback;
@end
