//
//  CityVO.h
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 30/06/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import "CoordVO.h"
#import "WeatherVO.h"
#import "WindVO.h"
#import "MainVO.h"
#import "RainVO.h"

@protocol WeatherVO;

@interface CityVO : JSONModel
    @property(nonatomic) NSNumber<Optional>* id;
    @property(nonatomic) NSString<Optional>* name;
    @property(nonatomic) CoordVO<Optional>* coord;
    @property(nonatomic) MainVO<Optional>* main;
    @property(nonatomic) NSArray<Optional, WeatherVO>* weather;
    @property(nonatomic) WindVO<Optional>* wind;
    @property(nonatomic) RainVO<Optional>* rain;
    @property(nonatomic) NSNumber<Optional>* dt;
@end
