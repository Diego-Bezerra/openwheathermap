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
        lblCityName.text = city?.name
        guard let weathers = city?.weather as? Array<WeatherVO>, !weathers.isEmpty else {
            return
        }
        lblDescription.text = weathers.first?.mDescription
    }

}
