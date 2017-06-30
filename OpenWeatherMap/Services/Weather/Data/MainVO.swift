//
//  MainVO.swift
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 30/06/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

import Foundation
import ObjectMapper

class MainVO: Mappable {

    var temp:Double?
    var pressure:Double?
    var humidity:Int?
    var tempMin:Double?
    var seaLevel:Double?
    var grndLevel:Double?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        temp <- map["temp"]
        pressure <- map["pressure"]
        humidity <- map["humidity"]
        tempMin <- map["temp_min"]
        seaLevel <- map["sea_level"]
        grndLevel <- map["grnd_level"]
    }
}
