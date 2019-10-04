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

extension CoffeeShopViewModel {
    var numberOfShops: Int {
        return coffeeShops.count
    }
    
    func viewModel(for index: Int) -> CoffeeShopInfoViewModel {
        return coffeeShops[index]
    }
}
