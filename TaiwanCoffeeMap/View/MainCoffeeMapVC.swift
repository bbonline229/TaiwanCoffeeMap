//
//  MainCoffeeMapVC.swift
//  TaiwanCoffeeMap
//
//  Created by Jack on 2019/10/3.
//  Copyright © 2019 Jack. All rights reserved.
//

import UIKit
import GoogleMaps

class MainCoffeeMapVC: UIViewController {
    @IBOutlet weak var mapView: GMSMapView!
    
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigation()
        setupLocation()
    }
    
    private func setupNavigation() {
        navigationItem.title = "台灣咖啡地圖"
    }
    
    private func setupLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
}

extension MainCoffeeMapVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else { return }
        
        locationManager.startUpdatingLocation()
        
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
    }
}
