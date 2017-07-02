//
//  CoordVO.h
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 30/06/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@interface CoordVO : JSONModel
    @property (nonatomic) NSNumber<Optional>* lat;
    @property (nonatomic) NSNumber<Optional>* lon;
@end
