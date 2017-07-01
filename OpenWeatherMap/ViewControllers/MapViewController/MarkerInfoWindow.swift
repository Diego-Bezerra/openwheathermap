//
//  MarkerInfoWindow.swift
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 01/07/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

import UIKit

class MarkerInfoWindow: UIView {

    @IBOutlet weak var searchButton: UIButton!
    
    override func willMove(toSuperview newSuperview: UIView?) {
        searchButton.setTitle(NSLocalizedString("SEARCH_NEARBY_CITIES", comment: ""), for: UIControlState.normal)
    }
    
}
