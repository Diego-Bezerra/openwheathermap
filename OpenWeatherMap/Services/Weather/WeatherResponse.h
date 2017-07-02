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

@protocol CityVO;

@interface WeatherResponse : JSONModel
    @property (nonatomic) NSString<Optional>* message;
    @property (nonatomic) NSNumber<Optional>* cod;
    @property (nonatomic) NSNumber<Optional>* count;
    @property (nonatomic) NSArray<Optional, CityVO>* list;
@end
