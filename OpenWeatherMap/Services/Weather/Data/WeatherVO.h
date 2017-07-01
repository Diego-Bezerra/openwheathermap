//
//  Weather.h
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 30/06/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@interface WeatherVO : JSONModel
    @property (nonatomic) NSInteger* id;
    @property (nonatomic) NSString* main;
    @property (nonatomic) NSString* mDescription;
    @property (nonatomic) NSString* icon;
@end
