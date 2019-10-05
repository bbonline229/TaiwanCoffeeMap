//
//  CoffeeShopMarker.swift
//  TaiwanCoffeeMap
//
//  Created by Jack on 2019/10/3.
//  Copyright © 2019 Jack. All rights reserved.
//

import UIKit
import GoogleMaps

class CoffeeShopMarker: GMSMarker {
    
    let viewModel: CoffeeShopInfoViewModel?
    
    init(vm: CoffeeShopInfoViewModel) {
        self.viewModel = vm
        
        super.init()
        
        position = CLLocationCoordinate2D(latitude: vm.latitude, longitude: vm.longitude)
        icon = UIImage(named: "coffeeMarker")
        appearAnimation = .pop
    }
}
