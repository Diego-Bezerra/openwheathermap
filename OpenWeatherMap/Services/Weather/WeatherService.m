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
    NSString* const GET_DATA = @"data/2.5/find?lat=%f&lon=%f&cnt=15&APPID=%@";
    
    -(NSURL*) makeUrlWithString:(NSString*) url {
        
        //UserPre
        
        return [[NSURL alloc] initWithString: [NSString stringWithFormat:@"%@%@", BASE_URL, url]];
    }
    
    -(void) getWeatherDataWithLatitude:(double) lat longitude:(double) lon andCallback:(void (^)(WeatherResponse* weatherResponse, NSError* error)) callback {
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        
        NSString* urlStr = [NSString stringWithFormat:GET_DATA, lat, lon, WEATHER_API_KEY];
        NSURL *URL = [self makeUrlWithString:urlStr];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        
        NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
            if (error) {
                NSLog(@"Error: %@", error);
                callback(nil, error);
            } else {
                NSError* jsonError;
                WeatherResponse* wr = [[WeatherResponse alloc] initWithDictionary:responseObject error:&jsonError];
                callback(wr, jsonError);
            }
        }];
        [dataTask resume];
        
    }
    
@end
