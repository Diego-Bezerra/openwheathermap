//
//  WeatherProtocolAPI.h
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 02/07/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import <Foundation/Foundation.h>

//Weather API protocol
@protocol WeatherProtocolAPI
-(void) getWeatherDataWithLatitude:(double) lat longitude:(double) lon andCallback:(void (^)(WeatherResponse* weatherResponse, NSError* error)) callback;
@end
