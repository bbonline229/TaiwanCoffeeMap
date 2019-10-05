//
//  MainCoffeeMapVC.swift
//  TaiwanCoffeeMap
//
//  Created by Jack on 2019/10/3.
//  Copyright © 2019 Jack. All rights reserved.
//

import UIKit
import GoogleMaps

class CoffeeShopMapVC: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    private let locationManager = CLLocationManager()
    
    var viewModel: CoffeeShopViewModel?
    
    private var coffeeShopCallOutView: CoffeeShopCallOutView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigation()
        setupLocation()
        showMapMarker()
    }
    
    private func setupNavigation() {
        navigationItem.title = "台灣咖啡地圖"
    }
    
    private func setupLocation() {
        mapView.delegate = self
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    private func showMapMarker() {
        guard let viewModel = viewModel else { return }
        
        viewModel.coffeeShops.forEach {
            let marker = CoffeeShopMarker(vm: $0)
            marker.map = mapView
        }
    }
}

extension CoffeeShopMapVC: CLLocationManagerDelegate {
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

extension CoffeeShopMapVC: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        guard let coffeeShopMarker = marker as? CoffeeShopMarker else {
            return false
        }
        
        if let _ = coffeeShopCallOutView {
            coffeeShopCallOutView.removeFromSuperview()
            coffeeShopCallOutView = nil
        }
        
        coffeeShopCallOutView = CoffeeShopCallOutView(frame: .zero)
        coffeeShopCallOutView.viewModel = coffeeShopMarker.viewModel
        
        layout(callOutView: coffeeShopCallOutView)
        
        return false
    }
    
    private func layout(callOutView: UIView) {
        view.addSubview(callOutView)
        
        callOutView.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
}