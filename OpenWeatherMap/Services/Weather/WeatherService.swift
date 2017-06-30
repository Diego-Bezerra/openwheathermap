//
//  WeatherService.swift
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 30/06/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class WeatherService: NSObject {
    
    static let BASE_URL = "http://api.openweathermap.org"
    static let WEATHER_DATA_URL = "\(BASE_URL)/data/2.5/find?lat=%f&lon=%f&cnt=15&APPID=\(WEATHER_API_KEY)"
    
     func getWeatherData(lat:Double, lon:Double, callback:@escaping (_ weatherResponse:WeatherResponse?) -> Void) {
        let url = String(format: WeatherService.WEATHER_DATA_URL, lat, lon)
        Alamofire.request(url).responseObject { (response:DataResponse<WeatherResponse>) in
            callback(response.value)
        }
    }
}
