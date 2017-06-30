//
//  CoordVO.swift
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 30/06/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

import Foundation
import ObjectMapper

class CoordVO: Mappable {
    
    var lat:Double?
    var lon:Double?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        lat <- map["lat"]
        lon <- map["lon"]
    }
}
