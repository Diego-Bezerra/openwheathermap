//
//  RainVO.h
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 01/07/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@interface RainVO : JSONModel
    @property (nonatomic) NSNumber<Optional>* threeH;
@end
