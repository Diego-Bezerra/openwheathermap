//
//  WeatherResponse.h
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 30/06/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import "CityVO.h"

@interface WeatherResponse : JSONModel
    @property (nonatomic) NSString* message;
    @property (nonatomic) NSNumber* cod;
    @property (nonatomic) NSNumber* count;
    @property (nonatomic) NSArray<CityVO *>* list;
@end
