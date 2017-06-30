//
//  WeatherResponse.swift
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 30/06/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherResponse: Mappable {
    
    var message:String?
    var cod:Int?
    var count:Int?
    var cities:Array<CityVO>?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        message <- map["message"]
        cod <- map["cod"]
        count <- map["count"]
        cities <- map["list"]
    }
}
