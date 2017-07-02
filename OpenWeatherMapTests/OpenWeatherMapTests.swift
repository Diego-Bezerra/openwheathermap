//
//  OpenWeatherMapTests.swift
//  OpenWeatherMapTests
//
//  Created by Diego Bezerra Souza on 27/06/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

import XCTest
@testable import OpenWeatherMap

class OpenWeatherMapTests: XCTestCase {
    
    var baseSessionManager:OWBaseSessionManager!
    let url = "http://api.openweathermap.org/data/2.5/find?lat=-8.058714&lon=-34.872348&cnt=15&units=metric&APPID=b7032a789ddf76625c8d9fe3efdf6129"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        baseSessionManager = OWBaseSessionManager()
        UserDefaults.standard.removeObject(forKey: "showtutorialkey")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        baseSessionManager = nil
        super.tearDown()
    }
    
    func testSetUserTutorialPreference() {
        let msg = "Value returned from tutorial user preference is wrong"
        
        OWUserPreferences.setShowTutorialKey(true)
        var value = OWUserPreferences.getShowTutorialKey()
        
        XCTAssertTrue(value, msg)
        
        OWUserPreferences.setShowTutorialKey(false)
        value = OWUserPreferences.getShowTutorialKey()
        
        XCTAssertFalse(value, msg)
    }
    
    func testValidCallToWeatherGetData() {
        
        let promise = expectation(description: "Request completed")
        var statusCode:Int?
        var responseError:Error?
        
        baseSessionManager.getWithParameters(nil, url: url) { (task, response, error) in
            
            statusCode = (task?.response! as? HTTPURLResponse)?.statusCode
            responseError = error
            
            promise.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(responseError, "Request returned an error! error: \(responseError?.localizedDescription ?? "")")
        XCTAssertEqual(statusCode, 200, "StatusCode is wrong")
    }
    
    func testValidWeatherDataContent() {
        
        let promise = expectation(description: "Request completed")
        var jsonError:Error?
        var weatherData:WeatherResponse?
        var city = CityVO()
        var max:Double = 0
        var min:Double = 0
        var weatherDesc = ""
        
        baseSessionManager.getWithParameters(nil, url: url) { (task, response, error) in
            do {
                try weatherData = WeatherResponse(dictionary: response as! [AnyHashable : Any])
                if let c = weatherData?.list.first as? CityVO {
                    city = c
                    max = c.main.temp_max.doubleValue
                    min = c.main.temp_min.doubleValue
                    weatherDesc = (c.weather.first as? WeatherVO)?.mDescription ?? ""
                }
            } catch {
                jsonError = error
            }
            
            promise.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertNil(jsonError, "Json data was not passed. JsonError: \(jsonError?.localizedDescription ?? "")")
        XCTAssertNotNil(weatherData)
        
        XCTAssertEqual(city.name, "Recife", "City name not equals")
        //This test is in Recife. It's impossible to have max and min temperatures under zero
        XCTAssertGreaterThan(max, 0)
        XCTAssertGreaterThan(min, 0)
        XCTAssertFalse(weatherDesc.isEmpty, "Weahter description is empty")
        
    }
    
}
