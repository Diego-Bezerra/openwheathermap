//
//  WeatherDetailsViewController.swift
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 01/07/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

import UIKit

class WeatherDetailsViewController: UIViewController {

    @IBOutlet weak var lblCityName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblMaxTemp: UILabel!
    @IBOutlet weak var lblMinTemp: UILabel!
    @IBOutlet weak var lblMaxTempValue: UILabel!
    @IBOutlet weak var lblMinTempValue: UILabel!
    
    var city:CityVO?
    
    init(city:CityVO) {
        self.city = city
        super.init(nibName: "WeatherDetailsViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWeatherDetails()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setupWeatherDetails() {
        
        lblMaxTemp.text = NSLocalizedString("MAX_TEMP", comment: "")
        lblMinTemp.text = NSLocalizedString("MIN_TEMP", comment: "")
        lblCityName.text = city?.name
        
        if let weathers = city?.weather as? Array<WeatherVO>, !weathers.isEmpty {
            lblDescription.text = weathers.first?.mDescription
        }
        
        lblMaxTempValue.text = getFormatedStringTemp(temp: city?.main.temp_max.doubleValue ?? 0)
        lblMinTempValue.text = getFormatedStringTemp(temp: city?.main.temp_min.doubleValue ?? 0)
    }
    
    func getFormatedStringTemp(temp:Double) -> String {
        return String(format: "%.0f°", temp)
    }

}
