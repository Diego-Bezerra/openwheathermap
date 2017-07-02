//
//  MapViewController.swift
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 28/06/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, GMSMapViewDelegate, UIAlertViewDelegate {

    var mapView:GMSMapView?
    var hasUserLocation = false
    var hasFirstMapTap = false
    var marker = GMSMarker()
    
    deinit {
        print("MapController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("APP_NAME", comment: "")
        setupMarker()
        showTutorialAlert()
        observeLocationsUpdates()
    }

    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func loadView() {
        
        let lat = -14.232006
        let lng = -51.924594
        let initZoom:Float = 10.0
        
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lng, zoom: initZoom)
        
        self.mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        self.mapView?.isMyLocationEnabled = true
        self.mapView?.delegate = self
        self.mapView?.settings.myLocationButton = true
        view = mapView
    }
    
    func observeLocationsUpdates() {
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateLocations),
                                               name: NSNotification.Name(rawValue: DID_UPDATE_LOCATIONS), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeAuthorizationStatus),
                                               name: NSNotification.Name(rawValue: DID_CHANGE_AUTHORIZATION_STATUS), object: nil)
    }
    
    func setupMarker() {
        marker.map = self.mapView
        marker.isDraggable = true
        marker.infoWindowAnchor = CGPoint(x: 0.2, y: -0.1)
    }
    
    func openCityList() {
        let cityListVC = CityListViewController(latitude: marker.position.latitude, andLongitude: marker.position.longitude)
        self.navigationController?.pushViewController(cityListVC!, animated: true)
    }
    
    func dontShowTutorialAnymore() {
        OWUserPreferences.setShowTutorialKey(false)
    }
    
    func showTutorialAlert() {
        
        if OWUserPreferences.getShowTutorialKey() {
            let delaySeconds = 5.0
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delaySeconds) {
                if !self.hasFirstMapTap {
                    let alert = UIAlertController(title: NSLocalizedString("TUTORIAL", comment: ""), message: NSLocalizedString("TUTORIAL_MSG", comment: ""), preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: UIAlertActionStyle.default, handler: nil))
                    alert.addAction(UIAlertAction(title: NSLocalizedString("DONT_SHOW_ANYMORE", comment: ""), style: UIAlertActionStyle.default, handler:{ [weak self] (ac) in
                        guard let sel = self else {return}
                        sel.dontShowTutorialAnymore()
                    }))
                    
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
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
    
    //MARK: - GMSMapViewDelegate
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        marker.position = coordinate
        if !hasFirstMapTap {
            hasFirstMapTap = true
            mapView.selectedMarker = marker
        }
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let btnSearch = Bundle.main.loadNibNamed("MarkerInfoWindow", owner: self, options: nil)?[0] as? MarkerInfoWindow
        
        return btnSearch
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        self.openCityList()
    }
    
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        mapView.selectedMarker = marker
    }
}
