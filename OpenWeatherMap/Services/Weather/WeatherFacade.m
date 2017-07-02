//
//  WeatherFacade.m
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 02/07/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import "WeatherFacade.h"
#import "WeatherProtocolAPI.h"
#import "WeatherService.h"

@interface WeatherFacade()
    @property(nonatomic, strong) id<WeatherProtocolAPI> weatherService;
@end

@implementation WeatherFacade
    
    - (instancetype)init {
        self = [super init];
        if (self) {
            self.weatherService = [[WeatherService alloc] init];
        }
        return self;
    }
    
    -(void) getWeatherDataWithLatitude:(double) lat longitude:(double) lon andCallback:(void (^)(WeatherResponse* weatherResponse, NSError* error)) callback {
        [_weatherService getWeatherDataWithLatitude:lat longitude:lon andCallback:^(WeatherResponse *weatherResponse, NSError *error) {
            callback(weatherResponse, error);
        }];
    }
    
    
@end
