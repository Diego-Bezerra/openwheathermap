//
//  WeatherService.m
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 01/07/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import "WeatherService.h"
#import <AFNetworking/AFNetworking.h>
#import "WeatherResponse.h"
#import "OWConstants.h"

@interface WeatherService()
    
@end

@implementation WeatherService
    
    NSString* const BASE_URL = @"http://api.openweathermap.org/";
    NSString* const GET_DATA = @"data/2.5/find?lat=%f&lon=%f&cnt=15&units=metric&APPID=%@";
    
    -(NSString*) makeUrlWithString:(NSString*) url {
        return [NSString stringWithFormat:@"%@%@", BASE_URL, url];
    }
    
    -(void) getWeatherDataWithLatitude:(double) lat longitude:(double) lon andCallback:(void (^)(WeatherResponse* weatherResponse, NSError* error)) callback {
        
        NSString* urlStr = [self makeUrlWithString:[NSString stringWithFormat:GET_DATA, lat, lon, WEATHER_API_KEY]];
        
        [self getWithParameters:nil url:urlStr andCallback:^(NSURLSessionTask *task, id responseObject, NSError *error) {
            
            if (error) {
                NSLog(@"Error: %@", error);
                callback(nil, error);
            } else {
                NSError* jsonError;
                WeatherResponse* wr = [[WeatherResponse alloc] initWithDictionary:responseObject error:&jsonError];
                if (jsonError) {
                    NSLog(@"Error: %@", jsonError);
                }
                callback(wr, jsonError);
            }
            
        }];
    }
    
@end
