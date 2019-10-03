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
    private let networkService = NetWorkService()
    
    private var viewModel: CoffeeShopViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigation()
        setupLocation()
        loadCoffeeShopData()
    }
    
    private func setupNavigation() {
        navigationItem.title = "台灣咖啡地圖"
    }
    
    private func setupLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    private func showMapMarker() {
        viewModel.coffeeShops.forEach {
            let marker = CoffeeShopMarker(vm: $0)
            marker.map = mapView
        }
    }
    
    private func loadCoffeeShopData() {
        guard let url = URL(string: API.baseURL) else { return }
        
        let resorce = Resource<[CoffeeShopInfo]>(url: url)
        networkService.load(resource: resorce) { [weak self](coffeeShops) in
            guard let coffeShops = coffeeShops else { return }
            
            self?.viewModel = CoffeeShopViewModel(coffeeShops: coffeShops)
            self?.showMapMarker()
        }
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
