//
//  Weather.m
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 30/06/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import "WeatherVO.h"

@implementation WeatherVO
    + (JSONKeyMapper *)keyMapper {
            return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"mDescription": @"description"}];
    }
@end
