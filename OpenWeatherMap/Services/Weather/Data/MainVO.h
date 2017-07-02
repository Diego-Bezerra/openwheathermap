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
    @property (nonatomic) NSNumber<Optional>* temp;
    @property (nonatomic) NSNumber<Optional>* pressure;
    @property (nonatomic) NSNumber<Optional>* humidity;
    @property (nonatomic) NSNumber<Optional>* temp_min;
    @property (nonatomic) NSNumber<Optional>* temp_max;
    @property (nonatomic) NSNumber<Optional>* sea_level;
    @property (nonatomic) NSNumber<Optional>* grnd_level;
@end
