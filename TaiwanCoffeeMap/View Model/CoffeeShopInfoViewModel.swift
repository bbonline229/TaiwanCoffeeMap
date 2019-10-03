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
    var latitude: Double {
        return Double(coffeeShopInfo.latitude)!
    }
    
    var longitude: Double {
        return Double(coffeeShopInfo.longitude)!
    }
}
