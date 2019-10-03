//
//  MainCoffeeMapViewModel.swift
//  TaiwanCoffeeMap
//
//  Created by Jack on 2019/10/3.
//  Copyright © 2019 Jack. All rights reserved.
//

import Foundation

class CoffeeShopViewModel {
    var coffeeShops: [CoffeeShopInfoViewModel]
    
    init(coffeeShops: [CoffeeShopInfo]) {
        self.coffeeShops = coffeeShops.map { CoffeeShopInfoViewModel(coffeeShopInfo: $0) }
    }
}
