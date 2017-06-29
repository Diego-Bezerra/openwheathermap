//
//  MapViewController.swift
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 28/06/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    var mapView:GMSMapView?
    var hasUserLocation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("APP_NAME", comment: "")
        observeLocationsUpdates()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        print("MapController")
    }
    
    override func loadView() {
        
        let camera = GMSCameraPosition.camera(withLatitude: -14.232006, longitude: -51.924594, zoom: 10.0)
        
        self.mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        self.mapView!.isMyLocationEnabled = true
        view = mapView
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    func observeLocationsUpdates() {
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateLocations),
                                               name: NSNotification.Name(rawValue: DID_UPDATE_LOCATIONS), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeAuthorizationStatus),
                                               name: NSNotification.Name(rawValue: DID_CHANGE_AUTHORIZATION_STATUS), object: nil)
    }
    
    //MARK: - LocationManager
    func didUpdateLocations(notification:NSNotification) {
        if !hasUserLocation {
            hasUserLocation = true
            if let loc = OWLocationManagerCentral.sharedManager().lastLocation {
                let camera = GMSCameraUpdate.setCamera(
                    GMSCameraPosition.camera(withLatitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude, zoom: 10.0))
                mapView?.moveCamera(camera)
            }
        }
    }
    
    func didChangeAuthorizationStatus(notification:NSNotification) {
        
    }
}
