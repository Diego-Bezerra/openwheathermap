//
//  WeatherVO.swift
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 30/06/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherVO: Mappable {

    var id:Int64?
    var main:String?
    var description:String?
    var icon:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        main <- map["main"]
        description <- map["description"]
        icon <- map["icon"]
    }
}
