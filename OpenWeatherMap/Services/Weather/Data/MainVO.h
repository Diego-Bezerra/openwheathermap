//
//  Main.h
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 30/06/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@interface MainVO : JSONModel
    @property (nonatomic) double temp;
    @property (nonatomic) double pressure;
    @property (nonatomic) int humidity;
    @property (nonatomic) double temp_min;
    @property (nonatomic) double temp_max;
    @property (nonatomic) double sea_level;
    @property (nonatomic) double grnd_level;
@end
