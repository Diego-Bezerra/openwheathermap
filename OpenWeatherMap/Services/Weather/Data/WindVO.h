//
//  Wind.h
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 30/06/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@interface WindVO : JSONModel
    @property (nonatomic) double speed;
    @property (nonatomic) int deg;
@end
