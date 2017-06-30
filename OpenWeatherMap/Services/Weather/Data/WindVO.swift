//
//  WindVO.swift
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 30/06/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

import Foundation
import ObjectMapper

class WindVO: Mappable {
    
    var speed:Double?
    var deg:Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        speed <- map["speed"]
        deg <- map["deg"]
    }
}
