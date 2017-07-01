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

@protocol CityVO;

@interface CityVO : JSONModel
    @property(nonatomic) NSInteger* id;
    @property(nonatomic) NSString* name;
    @property(nonatomic) CoordVO* coord;
    @property(nonatomic) MainVO* main;
    @property(nonatomic) WeatherVO* weather;
    @property(nonatomic) WindVO* wind;
    @property(nonatomic) NSInteger* dt;
    @property(nonatomic) JSONModel<Optional>* sys;
    @property(nonatomic) JSONModel<Optional>* rain;
    @property(nonatomic) JSONModel<Optional>* snow;
@end
