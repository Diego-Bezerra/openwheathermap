//
//  CityVO.swift
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 30/06/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

import Foundation
import ObjectMapper

class CityVO: Mappable {

    var id:Int64?
    var name:String?
    var coord:CoordVO?
    var main:MainVO?
    var dt:Int64?
    var wind:WindVO?
    var weather:[WeatherVO]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        coord <- map["coord"]
        main <- map["main"]
        dt <- map["dt"]
        wind <- map["wind"]
        weather <- map["weather"]
        
    }
}
