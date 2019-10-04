//
//  CoffeeShopViewModel.swift
//  TaiwanCoffeeMap
//
//  Created by Jack on 2019/10/3.
//  Copyright © 2019 Jack. All rights reserved.
//

import Foundation

class CoffeeShopInfoViewModel {
    let coffeeShopInfo: CoffeeShopInfo
    
    init(coffeeShopInfo: CoffeeShopInfo) {
        self.coffeeShopInfo = coffeeShopInfo
    }
}

extension CoffeeShopInfoViewModel {
    var name: String {
        return coffeeShopInfo.name
    }
    
    var address: String {
        return coffeeShopInfo.address
    }
    
    var mrtStation: String {
        return coffeeShopInfo.mrtStation.isEmpty ? "暫無資訊" : coffeeShopInfo.mrtStation
    }
    
    var openTime: String {
        return coffeeShopInfo.openTime.isEmpty ? "暫無資訊" : coffeeShopInfo.openTime
    }
    
    var latitude: Double {
        return Double(coffeeShopInfo.latitude)!
    }
    
    var longitude: Double {
        return Double(coffeeShopInfo.longitude)!
    }
}
