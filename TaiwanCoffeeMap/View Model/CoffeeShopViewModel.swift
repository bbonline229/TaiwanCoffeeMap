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
    
    var searchCoffeeShops: [CoffeeShopInfoViewModel] = []
    
    var isSearch = false
    
    init(coffeeShops: [CoffeeShopInfo]) {
        self.coffeeShops = coffeeShops.map {
            CoffeeShopInfoViewModel(coffeeShopInfo: $0)
        }
    }
}

extension CoffeeShopViewModel {
    var numberOfShops: Int {
        if isSearch {
            return searchCoffeeShops.count
        }
        return coffeeShops.count
    }
    
    func viewModel(for index: Int) -> CoffeeShopInfoViewModel {
        if isSearch {
            return searchCoffeeShops[index]
        }
        return coffeeShops[index]
    }
}

extension CoffeeShopViewModel {
    func filterCoffeeShop(with searchText: String) {
        searchCoffeeShops = coffeeShops.filter{
            $0.name.prefix(searchText.count) == searchText
        }
        isSearch = true
    }
    
    func cancelSearch() {
        isSearch = false
    }
}
